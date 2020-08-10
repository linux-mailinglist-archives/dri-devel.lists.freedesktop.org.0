Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD07241697
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01AC6E101;
	Tue, 11 Aug 2020 06:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8A089E7B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:43:30 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f31951d0000>; Mon, 10 Aug 2020 11:42:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Aug 2020 11:43:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Aug 2020 11:43:30 -0700
Received: from [172.20.40.66] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Aug
 2020 18:43:29 +0000
Subject: Re: [PATCH v3] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To: Lukas Wunner <lukas@wunner.de>
References: <0850ac9a-3d60-053d-1d70-5f20ce621b24@nvidia.com>
 <20200729210557.9195-1-ddadap@nvidia.com>
 <20200810083757.2jbwebbvocqe5rle@wunner.de>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <c7b1b098-a0ef-6e78-92c1-32da9b4ea3f3@nvidia.com>
Date: Mon, 10 Aug 2020 13:44:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200810083757.2jbwebbvocqe5rle@wunner.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597084957; bh=SzBLgHjB26ZW+phBa80l41xf15YlZglGp7LynW49+kA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=LaEmMJoCtyTTIIRW27PsDBXx59T/tcG4XXCNIshccoDEoHvKDI3ERSl7IO3P94THq
 cqPVUF8uFOkw3bAL3WefIHL+t4UA09WPkpcjENVl21OSoEJNg2sPWSV1/BIx92Y2Z+
 d81epUIudwEqE24GEqRR8z7YCsgiQbFVXsm02DrF8ZKNqrGH7Rlm14DzHmagUNkRV/
 EL5yFcNS2wuPeljXKYDc4qYHHjoh2n0UR/oovx0cHvp1N7OhfV+TpSQCupfZ3kAuoh
 Q29I+fu2hlHq3Y0O92x+r0xJpflSlfTuhUHXIgQ01WBB3NR8PFrxQPrlKQwPihwZYt
 Hjy5bUxu/aLNQ==
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 pobrn@protonmail.com, peter@lekensteyn.nl, dvhart@infradead.org,
 andy@infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/10/20 3:37 AM, Lukas Wunner wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, Jul 29, 2020 at 04:05:57PM -0500, Daniel Dadap wrote:
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses>.
> This boilerplate is unnecessary, the SPDX identifier is sufficient.


I don't doubt that it's unnecessary, but this is the recommended 
boilerplate license text for NVIDIA-copyrighted GPLv2-licensed code by 
NVIDIA legal. Unless there's a compelling reason to omit it, I'll leave 
it as-is. If anybody feels strongly about removing it, I can ask our 
legal team for guidance.


>
>> +static int mxds_gmux_switchto(enum vga_switcheroo_client_id);
>> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(struct pci_dev *);
>> +
>> +static const struct vga_switcheroo_handler handler = {
>> +     .switchto = mxds_gmux_switchto,
>> +     .get_client_id = mxds_gmux_get_client_id,
>> +};
> Move the handler struct further down to avoid the forward declarations.
>

Sure.


>> + * Call MXDS with bit 0 set to change the current state.
>> + * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
> [...]
>> +enum mux_state_command {
>> +     MUX_STATE_GET = 0,
>> +     MUX_STATE_SET_IGPU = 0x01,
>> +     MUX_STATE_SET_DGPU = 0x11,
>> +};
> It looks like the code comment is wrong and bit 1 (instead of bit 4) is
> used to select the GPU.


The code comment is correct. The enum values are hexadecimal, not 
binary. Would it be clearer to write it out as something like 0 << 4 & 1 
<< 0 for MUX_STATE_SET_IGPU and 1 << 4 & 1 << 0 for MUX_STATE_SET_DGPU?


>> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method method,
>> +                             acpi_integer action)
>> +{
>> +     union acpi_object arg;
>> +     struct acpi_object_list in = {.count = 1, .pointer = &arg};
>> +     acpi_integer ret;
>> +     acpi_status status;
>> +
>> +     arg.integer.type = ACPI_TYPE_INTEGER;
>> +     arg.integer.value = action;
> Hm, why not use an initializer for "arg", as you do for "in"?
>

Sure.


>> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
>> +     struct pci_dev *dev)
>> +{
>> +     if (dev) {
>> +             if (ig_dev && dev->vendor == ig_dev->vendor)
>> +                     return VGA_SWITCHEROO_IGD;
>> +             if (dg_dev && dev->vendor == dg_dev->vendor)
>> +                     return VGA_SWITCHEROO_DIS;
>> +     }
> That's a little odd.  Why not use "ig_dev == dev" and "dg_dev == dev"?


No reason; that is indeed better. I think originally these comparisons 
got a vendor ID from some other means.


>
>> +static acpi_status find_acpi_methods(
>> +     acpi_handle object, u32 nesting_level, void *context,
>> +     void **return_value)
>> +{
>> +     acpi_handle search;
>> +
>> +     /* If either MXDM or MXDS is missing, we can't use this object */
>> +     if (acpi_get_handle(object, "MXDM", &search))
>> +             return 0;
> Since this function returns an acpi_status, all the return statements
> should use AE_OK intead of 0.


Okay.


> Otherwise LGTM.
>
> Please cc dri-devel when respinning since this concerns vga_switcheroo.


Will do, after testing the updated change. I'll leave the GPL 
boilerplate text and hexadecimal enum definitions as-is unless I hear 
otherwise.


> I'm also cc'ing Peter Wu who has lots of experience with hybrid graphics
> through his involvement with Bumblebee, hence might be interested.
> Searching through his collection of ACPI dumps, it seems MXDS and MXMX
> have been present for years, but not MXDM:
>
> https://github.com/search?q=user%3ALekensteyn+MXDS&type=Code


Yes, MXMX and MXDS go back a ways, it seems. I'm not familiar enough 
with the MXMX+MXDS designs to know if MXDS uses the same API in those 
designs as it doesn in the MXDM+MXDS designs. I'm not aware of any 
already available designs with MXDM. MXMX was used for switching DDC 
lines independently back when LVDS panels were the norm. The upcoming 
MXDM+MXDS designs are eDP-based and do not support independent DDC muxing.


> Thanks,
>
> Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
