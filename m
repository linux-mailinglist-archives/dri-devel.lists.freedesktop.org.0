Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645987D7EC1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 10:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2510E774;
	Thu, 26 Oct 2023 08:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 9F8CD10E774
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 08:46:34 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id AF3DB60863911; 
 Thu, 26 Oct 2023 16:46:30 +0800 (CST)
Message-ID: <54d21280-6e1e-780c-372d-d630630a4fe9@nfschina.com>
Date: Thu, 26 Oct 2023 16:46:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] vga_switcheroo: Fix impossible judgment condition
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <4ec2b80b-f042-4abf-b799-0a9ef364f0fa@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, Jim.Qu@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/10/26 12:44, Dan Carpenter wrote:
> On Thu, Oct 26, 2023 at 10:10:57AM +0800, Su Hui wrote:
>> 'id' is enum type like unsigned int, so it will never be less than zero.
>>
>> Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/vga/vga_switcheroo.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
>> index 365e6ddbe90f..d3064466fd3a 100644
>> --- a/drivers/gpu/vga/vga_switcheroo.c
>> +++ b/drivers/gpu/vga/vga_switcheroo.c
>> @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
>>   	mutex_lock(&vgasr_mutex);
>>   	if (vgasr_priv.active) {
>>   		id = vgasr_priv.handler->get_client_id(vga_dev);
>> -		if (id < 0) {
>> +		if ((int)id < 0) {
> Hi,
>
> I feel like you're using Smatch?  Which is great!  Fantastic!
Yep, Smatch helps me  a lot to find these bugs! I really like this 
excellent tool!
>
> Have you built the cross function database?  If you have there is a
> command that's useful.
Not yet, bu I want to build this.
> $ ~/smatch/smatch_db/smdb.py functions vga_switcheroo_handler get_client_id | tee where
> drivers/gpu/drm/nouveau/nouveau_acpi.c | (struct vga_switcheroo_handler)->get_client_id | nouveau_dsm_get_client_id | 1
> drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | (struct vga_switcheroo_handler)->get_client_id | amdgpu_atpx_get_client_id | 1
> drivers/gpu/drm/radeon/radeon_atpx_handler.c | (struct vga_switcheroo_handler)->get_client_id | radeon_atpx_get_client_id | 1
> drivers/platform/x86/apple-gmux.c | (struct vga_switcheroo_handler)->get_client_id | gmux_get_client_id | 1
> $ make cscope
> $ vim where
> Use cscope to jump to each of those four functions.  Move the cursor to
> the nouveau_dsm_get_client_id and hit CTRL-].
Sounds great! I must try this!
>
> They never return negatives.  The enum vga_switcheroo_client_id has a
> VGA_SWITCHEROO_UNKNOWN_ID define which I guess these functions are
> supposed to return on error.  They never do return that, but I bet
> that's what we are supposed to check for.  It honestly might be good
> to check for both...
>
> 		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
> 			mutex_unlock(&vgasr_mutex);
> 			return -EINVAL;
> 		}
Agreed, I will send v2 patch soon.
Really thanks for your wonderful suggestion! :)

Su Hui

> regards,
> dan carpenter
>
