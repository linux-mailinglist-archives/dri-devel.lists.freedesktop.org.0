Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB93E5C57
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 15:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A6589FD3;
	Tue, 10 Aug 2021 13:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBCD89F9F;
 Tue, 10 Aug 2021 13:55:52 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d1so21103504pll.1;
 Tue, 10 Aug 2021 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=T5ai1h/BwkBlGJ4rm56PcMexvwYuHmzph6yr1FpzTao=;
 b=AfREYWBMW7HIKqL4q0JUGmAHOluslFavWgX1knqdC7WfNH2cyvF2GGIGdjZqXNfUY2
 +GWnJRg6JevMrNPi2EBOj6y6bZrrZSQsYL9GxLmcscMU64y/dOctYzZZKnjdy/RGElJ7
 8SvlQo7dKJImzgrNqPh6dxqgqXGTFPPowuHYtWvAb8FJWHMOYHL+3cxXqvpRqjQSvYMO
 WY9D6nXdRTzET059n73UIl5Lsrlnq2gvMMA3NWLLdHVo4fvAfIIvl0njmmhWuOGZA2pY
 vCyIvdeTkJvIjn+nWhbD5ENQTckhF86/edY7CIgkmNKtGP7Wc3RIx4QuZq9vNdu7O4pT
 mDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=T5ai1h/BwkBlGJ4rm56PcMexvwYuHmzph6yr1FpzTao=;
 b=evv8dNtNaMGQ/GPQ5PcdPTWig3tXiauLlAqGfz0sQcwyGeaS5pv/T84i9uy+Fx7p3r
 u+KuNbgGqfzhYYwsUmG2lMCspVIpivbcLTOwkGCQljK2LY4NhcByoCOod9D9aBXGDPnC
 Or2bvGVO17yS/MJsAsjni1A2IbgX7ppSUbg8j7Vy/DUQUTL9c2XJzW48sSGHtsY4rl8k
 2u3u+hLjLLMWMo5munMv24oAjsuFIzpvEg0wMMpAJ1CcG2mPVtuhcQkN8NVm2Xm71TzL
 LwqF/h6kUy+5qxshL8e7EZ/l5hobVMRncr2lOrCkGBsvIL9DfzleG8Uh/aDK5buLaA1j
 16pQ==
X-Gm-Message-State: AOAM531mNJQFIMuWbZrKfvzYMfLCxSovIxxk8d/wGVa0qe3JX8muhmXi
 QXkth/i0KxBfWe/MlcUdenQ=
X-Google-Smtp-Source: ABdhPJw+/WljnCGV2Q7sJ4421bNVf6OOqXQdcLB0iSJFUj7e/t66aXEA4rIxB5ZDYC+ovwUAU6JyEg==
X-Received: by 2002:a17:90a:804a:: with SMTP id
 e10mr15491454pjw.12.1628603751881; 
 Tue, 10 Aug 2021 06:55:51 -0700 (PDT)
Received: from [10.157.0.70] ([85.203.23.10])
 by smtp.gmail.com with ESMTPSA id x16sm12572516pfr.89.2021.08.10.06.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 06:55:51 -0700 (PDT)
Subject: Re: [PATCH] drm/display: fix possible null-pointer dereference in
 dcn10_set_clock()
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Cyr, Aric" <Aric.Cyr@amd.com>,
 "Lei, Jun" <Jun.Lei@amd.com>, "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>,
 "Stempen, Vladimir" <Vladimir.Stempen@amd.com>,
 "isabel.zhang@amd.com" <isabel.zhang@amd.com>, "Lee, Sung"
 <Sung.Lee@amd.com>, Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>,
 "Wood, Wyatt" <Wyatt.Wood@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 TOTE Robot <oslab@tsinghua.edu.cn>
References: <20210810092004.291429-1-islituo@gmail.com>
 <DM5PR12MB2469A884396F6018F8437E22F1F79@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Tuo Li <islituo@gmail.com>
Message-ID: <b652ceb9-9211-1a73-29a8-5469fe4485d7@gmail.com>
Date: Tue, 10 Aug 2021 21:55:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB2469A884396F6018F8437E22F1F79@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------F18C593468E0683DE5594DC0"
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------F18C593468E0683DE5594DC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your feedback. We will prepare a V2 patch according to your advice.

Best wishes,
Tuo Li


On 2021/8/10 21:38, Chen, Guchun wrote:
> [Public]
>
> Thanks for your patch.
>
> I suggest moving the check of function pointer dc->clk_mgr->funcs->get_clock earlier, and return early if it's NULL, as if it's NULL, it's meaningless to continue the clock setting.
>
> ....
> if (!dc->clk_mgr || !dc->clk_mgr->funcs->get_clock)
>   	return DC_FAIL_UNSUPPORTED_1;
>
> dc->clk_mgr->funcs->get_clock(dc->clk_mgr,
>   	context, clock_type, &clock_cfg);
> ....
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Tuo Li
> Sent: Tuesday, August 10, 2021 5:20 PM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@linux.ie; daniel@ffwll.ch; Cyr, Aric <Aric.Cyr@amd.com>; Lei, Jun <Jun.Lei@amd.com>; Zhuo, Qingqing <Qingqing.Zhuo@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Lee, Alvin <Alvin.Lee2@amd.com>; Stempen, Vladimir <Vladimir.Stempen@amd.com>; isabel.zhang@amd.com; Lee, Sung <Sung.Lee@amd.com>; Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>; Wood, Wyatt <Wyatt.Wood@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; baijiaju1990@gmail.com; Tuo Li <islituo@gmail.com>; TOTE Robot <oslab@tsinghua.edu.cn>
> Subject: [PATCH] drm/display: fix possible null-pointer dereference in dcn10_set_clock()
>
> The variable dc->clk_mgr is checked in:
>    if (dc->clk_mgr && dc->clk_mgr->funcs->get_clock)
>
> This indicates dc->clk_mgr can be NULL.
> However, it is dereferenced in:
>    if (!dc->clk_mgr->funcs->get_clock)
>
> To fix this possible null-pointer dereference, check dc->clk_mgr before dereferencing it.
>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index c545eddabdcc..3a7c7c7efa68 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -3635,7 +3635,7 @@ enum dc_status dcn10_set_clock(struct dc *dc,
>   				dc->clk_mgr->funcs->get_clock(dc->clk_mgr,
>   						context, clock_type, &clock_cfg);
>   
> -	if (!dc->clk_mgr->funcs->get_clock)
> +	if (dc->clk_mgr && !dc->clk_mgr->funcs->get_clock)
>   		return DC_FAIL_UNSUPPORTED_1;
>   
>   	if (clk_khz > clock_cfg.max_clock_khz)
> --
> 2.25.1


--------------F18C593468E0683DE5594DC0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+DQogIDxoZWFkPg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4NCiAgPC9oZWFkPg0KICA8Ym9k
eT4NCiAgICA8cHJlPlRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gV2Ugd2lsbCBwcmVwYXJl
IGEgVjIgcGF0Y2ggYWNjb3JkaW5nIHRvIHlvdXIgYWR2aWNlLg0KDQpCZXN0IHdpc2hlcywN
ClR1byBMaQ0KPC9wcmU+DQogICAgPGJyPg0KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXBy
ZWZpeCI+T24gMjAyMS84LzEwIDIxOjM4LCBDaGVuLCBHdWNodW4gd3JvdGU6PGJyPg0KICAg
IDwvZGl2Pg0KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiDQpjaXRlPSJtaWQ6RE01UFIx
Mk1CMjQ2OUE4ODQzOTZGNjAxOEY4NDM3RTIyRjFGNzlARE01UFIxMk1CMjQ2OS5uYW1wcmQx
Mi5wcm9kLm91dGxvb2suY29tIj4NCiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+W1B1YmxpY10NCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KDQpJIHN1Z2dl
c3QgbW92aW5nIHRoZSBjaGVjayBvZiBmdW5jdGlvbiBwb2ludGVyIGRjLSZndDtjbGtfbWdy
LSZndDtmdW5jcy0mZ3Q7Z2V0X2Nsb2NrIGVhcmxpZXIsIGFuZCByZXR1cm4gZWFybHkgaWYg
aXQncyBOVUxMLCBhcyBpZiBpdCdzIE5VTEwsIGl0J3MgbWVhbmluZ2xlc3MgdG8gY29udGlu
dWUgdGhlIGNsb2NrIHNldHRpbmcuDQoNCi4uLi4NCmlmICghZGMtJmd0O2Nsa19tZ3IgfHwg
IWRjLSZndDtjbGtfbWdyLSZndDtmdW5jcy0mZ3Q7Z2V0X2Nsb2NrKQ0KIAlyZXR1cm4gRENf
RkFJTF9VTlNVUFBPUlRFRF8xOw0KDQpkYy0mZ3Q7Y2xrX21nci0mZ3Q7ZnVuY3MtJmd0O2dl
dF9jbG9jayhkYy0mZ3Q7Y2xrX21nciwNCiAJY29udGV4dCwgY2xvY2tfdHlwZSwgJmFtcDtj
bG9ja19jZmcpOw0KLi4uLg0KDQpSZWdhcmRzLA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzphbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnIj4mbHQ7YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs8L2E+
IE9uIEJlaGFsZiBPZiBUdW8gTGkNClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAxMCwgMjAyMSA1
OjIwIFBNDQpUbzogV2VudGxhbmQsIEhhcnJ5IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpIYXJyeS5XZW50bGFuZEBhbWQuY29tIj4mbHQ7SGFycnku
V2VudGxhbmRAYW1kLmNvbSZndDs8L2E+OyBMaSwgU3VuIHBlbmcgKExlbykgPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlN1bnBlbmcuTGlAYW1kLmNv
bSI+Jmx0O1N1bnBlbmcuTGlAYW1kLmNvbSZndDs8L2E+OyBEZXVjaGVyLCBBbGV4YW5kZXIg
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOkFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20iPiZsdDtBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tJmd0Ozwv
YT47IEtvZW5pZywgQ2hyaXN0aWFuIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzpDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20iPiZsdDtDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20mZ3Q7PC9hPjsgUGFuLCBYaW5odWkgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlhpbmh1aS5QYW5AYW1kLmNvbSI+Jmx0O1hp
bmh1aS5QYW5AYW1kLmNvbSZndDs8L2E+OyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJl
dmlhdGVkIiBocmVmPSJtYWlsdG86YWlybGllZEBsaW51eC5pZSI+YWlybGllZEBsaW51eC5p
ZTwvYT47IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0
bzpkYW5pZWxAZmZ3bGwuY2giPmRhbmllbEBmZndsbC5jaDwvYT47IEN5ciwgQXJpYyA8YSBj
bGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86QXJpYy5DeXJAYW1k
LmNvbSI+Jmx0O0FyaWMuQ3lyQGFtZC5jb20mZ3Q7PC9hPjsgTGVpLCBKdW4gPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOkp1bi5MZWlAYW1kLmNvbSI+
Jmx0O0p1bi5MZWlAYW1kLmNvbSZndDs8L2E+OyBaaHVvLCBRaW5ncWluZyA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWluZ3FpbmcuWmh1b0BhbWQu
Y29tIj4mbHQ7UWluZ3FpbmcuWmh1b0BhbWQuY29tJmd0OzwvYT47IFNpcXVlaXJhLCBSb2Ry
aWdvIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpSb2Ry
aWdvLlNpcXVlaXJhQGFtZC5jb20iPiZsdDtSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20mZ3Q7
PC9hPjsgTGVlLCBBbHZpbiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86QWx2aW4uTGVlMkBhbWQuY29tIj4mbHQ7QWx2aW4uTGVlMkBhbWQuY29tJmd0
OzwvYT47IFN0ZW1wZW4sIFZsYWRpbWlyIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpWbGFkaW1pci5TdGVtcGVuQGFtZC5jb20iPiZsdDtWbGFkaW1p
ci5TdGVtcGVuQGFtZC5jb20mZ3Q7PC9hPjsgPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJy
ZXZpYXRlZCIgaHJlZj0ibWFpbHRvOmlzYWJlbC56aGFuZ0BhbWQuY29tIj5pc2FiZWwuemhh
bmdAYW1kLmNvbTwvYT47IExlZSwgU3VuZyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86U3VuZy5MZWVAYW1kLmNvbSI+Jmx0O1N1bmcuTGVlQGFtZC5j
b20mZ3Q7PC9hPjsgUG8tWXUgSHNpZWggUGF1bCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86UGF1bC5Ic2llaEBhbWQuY29tIj4mbHQ7UGF1bC5Ic2ll
aEBhbWQuY29tJmd0OzwvYT47IFdvb2QsIFd5YXR0IDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpXeWF0dC5Xb29kQGFtZC5jb20iPiZsdDtXeWF0dC5X
b29kQGFtZC5jb20mZ3Q7PC9hPg0KQ2M6IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2
aWF0ZWQiIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyI+YW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+OyA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyI+ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvYT47IDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnIj5saW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPC9hPjsgPGEgY2xh
c3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOmJhaWppYWp1MTk5
MEBnbWFpbC5jb20iPmJhaWppYWp1MTk5MEBnbWFpbC5jb208L2E+OyBUdW8gTGkgPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmlzbGl0dW9AZ21haWwu
Y29tIj4mbHQ7aXNsaXR1b0BnbWFpbC5jb20mZ3Q7PC9hPjsgVE9URSBSb2JvdCA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86b3NsYWJAdHNpbmdodWEu
ZWR1LmNuIj4mbHQ7b3NsYWJAdHNpbmdodWEuZWR1LmNuJmd0OzwvYT4NClN1YmplY3Q6IFtQ
QVRDSF0gZHJtL2Rpc3BsYXk6IGZpeCBwb3NzaWJsZSBudWxsLXBvaW50ZXIgZGVyZWZlcmVu
Y2UgaW4gZGNuMTBfc2V0X2Nsb2NrKCkNCg0KVGhlIHZhcmlhYmxlIGRjLSZndDtjbGtfbWdy
IGlzIGNoZWNrZWQgaW46DQogIGlmIChkYy0mZ3Q7Y2xrX21nciAmYW1wOyZhbXA7IGRjLSZn
dDtjbGtfbWdyLSZndDtmdW5jcy0mZ3Q7Z2V0X2Nsb2NrKQ0KDQpUaGlzIGluZGljYXRlcyBk
Yy0mZ3Q7Y2xrX21nciBjYW4gYmUgTlVMTC4NCkhvd2V2ZXIsIGl0IGlzIGRlcmVmZXJlbmNl
ZCBpbjoNCiAgaWYgKCFkYy0mZ3Q7Y2xrX21nci0mZ3Q7ZnVuY3MtJmd0O2dldF9jbG9jaykN
Cg0KVG8gZml4IHRoaXMgcG9zc2libGUgbnVsbC1wb2ludGVyIGRlcmVmZXJlbmNlLCBjaGVj
ayBkYy0mZ3Q7Y2xrX21nciBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdC4NCg0KUmVwb3J0ZWQt
Ynk6IFRPVEUgUm9ib3QgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOm9zbGFiQHRzaW5naHVhLmVkdS5jbiI+Jmx0O29zbGFiQHRzaW5naHVhLmVkdS5j
biZndDs8L2E+DQpTaWduZWQtb2ZmLWJ5OiBUdW8gTGkgPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmlzbGl0dW9AZ21haWwuY29tIj4mbHQ7aXNsaXR1
b0BnbWFpbC5jb20mZ3Q7PC9hPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNl
ci5jDQppbmRleCBjNTQ1ZWRkYWJkY2MuLjNhN2M3YzdlZmE2OCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3
X3NlcXVlbmNlci5jDQpAQCAtMzYzNSw3ICszNjM1LDcgQEAgZW51bSBkY19zdGF0dXMgZGNu
MTBfc2V0X2Nsb2NrKHN0cnVjdCBkYyAqZGMsDQogCQkJCWRjLSZndDtjbGtfbWdyLSZndDtm
dW5jcy0mZ3Q7Z2V0X2Nsb2NrKGRjLSZndDtjbGtfbWdyLA0KIAkJCQkJCWNvbnRleHQsIGNs
b2NrX3R5cGUsICZhbXA7Y2xvY2tfY2ZnKTsNCiANCi0JaWYgKCFkYy0mZ3Q7Y2xrX21nci0m
Z3Q7ZnVuY3MtJmd0O2dldF9jbG9jaykNCisJaWYgKGRjLSZndDtjbGtfbWdyICZhbXA7JmFt
cDsgIWRjLSZndDtjbGtfbWdyLSZndDtmdW5jcy0mZ3Q7Z2V0X2Nsb2NrKQ0KIAkJcmV0dXJu
IERDX0ZBSUxfVU5TVVBQT1JURURfMTsNCiANCiAJaWYgKGNsa19raHogJmd0OyBjbG9ja19j
ZmcubWF4X2Nsb2NrX2toeikNCi0tDQoyLjI1LjENCjwvcHJlPg0KICAgIDwvYmxvY2txdW90
ZT4NCiAgICA8YnI+DQogIDwvYm9keT4NCjwvaHRtbD4NCg==
--------------F18C593468E0683DE5594DC0--
