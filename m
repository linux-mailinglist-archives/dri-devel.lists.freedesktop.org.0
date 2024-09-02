Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD36968DF8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 20:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5721C10E360;
	Mon,  2 Sep 2024 18:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ciXMX2ay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7B110E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 18:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ2qokgLnc84xeyxWfjWBGxHjVxmtlh/r8LKe6a7VUf9b8Ll9gwtfcGnLVmwR9452Qu4JJwHRxguCXmw644deiJs4ea43X1oWSoUzTbTNFH9m1G/ngCf7xPCGDq6ORepzTZghzSNvdiJvfwrOQXTDRxU++u4VaMt7bp+VIXyq85F7yLRayfDYgqNiVwUFq28yysrwseJ2hzZdxji0T5bhVdrIGV2KKjMiVsY4r4UPOIrTPqmQSKpxo7Vr4HF/EdgL000c1e2IfK3VtgmzJp++H2hCpdA8eCrHA+xrlmRtEqyNg9wl7Kigvtl4xu2NC7zifLFBAuRn06yb1vCYBb3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9Q/fTn+igfcpQ2dl/MhqC6cobvPhsDBGd34T7/4Cus=;
 b=OAL1QqPyxC+SR3CYqCF+cqZTAQV3zLx+0xFr2hDEnfsYFqngexfToQenPRWKNqTWSuHkI6xU89mDREneok4/i4Odi6Ml88RJ9ZXNl/KuanYQRe200Wr32JedluYnetgM4UUob0iokrNL/ZuAq+ewbZDkQ3HZBwjHY68yZ1aCal7bLAAJQ+d/VWZm3eLsKthoByoR/WWtZF+iRvWi2qkQAt7akQFHJOGOzVUOBKaN6pQXtO9d92gOf+aX72AdrNXGHLbn66/Vww53aNCvobapNWZcalzxJ2hfRmGWAE5gqu+WK4djXJDNtIdlnVHdR36CJicCIciHb2C6ydLbQyLZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9Q/fTn+igfcpQ2dl/MhqC6cobvPhsDBGd34T7/4Cus=;
 b=ciXMX2aysys2xbdoDXu3vKiNh4O65SLbm/bZIZOqwfDOFjsFs17IrHkWKyPhhtlAEDwO7H2QgIVsF/GQtZHt1YIxSsbdK+77Xf/AZ6bq35UeX+DlTL/Joqo1ae8kuLc62RG451yOiYaRf+3m78/n3bv76rmKI3gCkiCWYpzfT7o=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 CY8PR12MB7633.namprd12.prod.outlook.com (2603:10b6:930:9c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.24; Mon, 2 Sep 2024 18:56:02 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744%7]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 18:56:02 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, open
 list <linux-kernel@vger.kernel.org>, "linux@weissschuh.net"
 <linux@weissschuh.net>, Borislav Petkov <bp@alien8.de>, Helge Deller
 <deller@gmx.de>
Subject: Re: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160
Thread-Topic: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160
Thread-Index: AQHa/S0UVvhkZ/Wo30mAWgWYLmKdfbJE1b2d
Date: Mon, 2 Sep 2024 18:56:01 +0000
Message-ID: <DM4PR12MB50863789A621575F937E240F89922@DM4PR12MB5086.namprd12.prod.outlook.com>
References: <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
 <20240902084546.GAZtV7Ot58w7D90fwQ@fat_crate.local>
 <7cf68133-e6f5-4fef-92ae-7a8c30631fb5@suse.de>
In-Reply-To: <7cf68133-e6f5-4fef-92ae-7a8c30631fb5@suse.de>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-02T18:56:01.577Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|CY8PR12MB7633:EE_
x-ms-office365-filtering-correlation-id: 097cdfda-2c10-4f7d-7586-08dccb80e3f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?fZsQTsjY/kyP3plHiqJRCiJNIkUjjQf5/1SKMXW5Rv5YJlUbIZdBLRH8kO?=
 =?iso-8859-1?Q?jBIp5R7IgLfZSimPnGjUR4LP5KKZaRxf0edweNQZbiLzptVmYmY7W01MfC?=
 =?iso-8859-1?Q?P7UoLdnVBjFE8IDMl7aM0TAuFa4+IWDvCx74/shlNG7uCZzNv3dOzM7M3+?=
 =?iso-8859-1?Q?48W0gHMLzYumMhUmOUQ5UIcRAAJKmToCAIEvf+0/nunzBglyBXefOfKRhd?=
 =?iso-8859-1?Q?v6aahbmUz1FF1y6n4Dde6k/c88Ch/3/1UXonQkMGpsPZtKIjMqNnNAJblw?=
 =?iso-8859-1?Q?rrpZKH42GqpvgFsZ+4lvypmUFwPs0mQJ2xwNCINENFbIpLQLj6DR63DMAr?=
 =?iso-8859-1?Q?5W24DTxgUf67woBEG6bpbhVc0LnoNoOuj38I86cWKG1QiLwAl4oKobZRc1?=
 =?iso-8859-1?Q?3YhrIVTyJG2wxsBJLi7vepwttJ5mIl4fxjoDhyZMdx49K5A1cguDS9ROep?=
 =?iso-8859-1?Q?JiAtKhDZA5gYb4bJYfIs6wUbOMy8GvEup/AzgsVEjJHN+HQOMA0KTg95Je?=
 =?iso-8859-1?Q?uOE0j2X6H01NOOv4J4YF1W+0SHR/0eDNshsRN+x1EYwYyqpKckcYzNj8py?=
 =?iso-8859-1?Q?Jk+mVqXh8kMiZ5Ch0x7x8wm05k8lrukwPR94Ez5avy1B9ikvToBc8gwT8s?=
 =?iso-8859-1?Q?/8tlla0PcL7ws71Nb9v9ZJV+LlwP2wlr91hUnjSWgzmiMvP9h5e3OJ8Sau?=
 =?iso-8859-1?Q?QtUm3yyMiMce0KkBP3lmX5TmzDoMKiZgUrGUIs5/hBOk/sZz+stazO3ahH?=
 =?iso-8859-1?Q?6DFbh5a5Woc6miGHU0ly6egM+46kv6nFV271xvUDjrfVJRJZUlNANAcrjt?=
 =?iso-8859-1?Q?N3tLD6ZvnGgstzRVEsC7elLF1+5RsOjI54v0ZXAKOE0skAM0ZCBygEpDtb?=
 =?iso-8859-1?Q?k7Kvsk0p7oBzKIjQKDqxSiDZfvIO4B1M4goE89YG4hXDv6ekthpHP4llVO?=
 =?iso-8859-1?Q?0nwfA4L/9shNRgP9BqB2d2RrHSrrqbtPn+oDCXre0QC1ZLSXrJDIdIrmRm?=
 =?iso-8859-1?Q?ZXObDsOTq9767N1modS7XC83lnB4TDQPkLKUl44tLTnLc2dFbQ2n38mvPo?=
 =?iso-8859-1?Q?Ig+CmHEI6ZWJhLcDZp0UYiPWZW48UlpCVInZXkfuTTEgBYPI5qXMgSrgdl?=
 =?iso-8859-1?Q?cuWJhlH2oX+fnpTZDCJvJkIRSwkcyymO201TnJEgDSNw7KxceLgfIRCXnM?=
 =?iso-8859-1?Q?VvfsbeXPb7kiad6jY6pxFrsOES/nT8KVXdp60CcTkulm5pDfeVV6Wkbl6W?=
 =?iso-8859-1?Q?jtTlwnOBNcAyaSyiYi2L43wo0iTTmJ268roHu/ga45AjCDOyerP219h5tv?=
 =?iso-8859-1?Q?8KrVuGOUlBW8XQl/YbJLSA0WDFKhJI2gHMHnTf9Zbrcxf92r5UIDupG5MZ?=
 =?iso-8859-1?Q?cMz71XSb/MyeEK53607HsH25RYpvd4RwVZPULAwwYmYD0Ep34Yh9M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5086.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3VohM3sHrGoxurSvo6em0yx9AeVwqJYPpcBasuk61HEbf3zVJ3552a6Qme?=
 =?iso-8859-1?Q?Erg4hPu0t2kAVPLjexoN+y/rnXRj38OWzCtEd1Uv8CuLxl+E/ozP9Dm6SB?=
 =?iso-8859-1?Q?etArbi8xWkvX1Adu5h1EyzuL1frKSsAUFPdH/qll1UhJaaO/qO+fR9mhpF?=
 =?iso-8859-1?Q?6bTLsKOWu+w8vOOaXWbDjeciGQ6/mghS5v8vwYlqWvDbmakYFMzl4BpUBl?=
 =?iso-8859-1?Q?kvyCNSyCiIfSIm6Pe1jlYRbP08U+nN1ZhJwZ6syl4Ywnn7/V0SnK1mIk7o?=
 =?iso-8859-1?Q?wsHoetlLG3dRk/TaM58ddNt1pTIm//oxpWY7l5Hbhsif4IZhv186CwpIcz?=
 =?iso-8859-1?Q?xv0rauhQReov5RwW1ZHi01uWSBmkqecKJxk05WBYZGHHKwaBbalyim9iHx?=
 =?iso-8859-1?Q?zgGFFlIgBzZpwPMuqdSVW4z0aZKR2W7+Y4E8gdwbigDCaXzLPVYkSxOE9h?=
 =?iso-8859-1?Q?1i93TN4SWypaJbr9ZVxosmkitKXeUNladcFxR2p7zQ6GDQ+IVJPHrhyeuw?=
 =?iso-8859-1?Q?JqvSzfUS+Y/5LZcd3bM0XhkHPY/SnUJ3k6vNRMvUukfodJEy6tFS/STU2r?=
 =?iso-8859-1?Q?+3SswDoyAjgans3FcyFyvoxaw1IFhdThIC1SDEcMy/Qt3AIe8PDI5gCnGW?=
 =?iso-8859-1?Q?4IiXz1L904o/7PW4ukqC89r5p8B5IifmbcAIFWawi6Rskfsz/PaZpVumHp?=
 =?iso-8859-1?Q?KwWCGvhDgg4zUgL1jaJdfTt2dZHmUZMAw9pGOH7sF/nwBG5nZaOwHPZlyt?=
 =?iso-8859-1?Q?Hq2yK0v1K1OO4+RrQNfXPduZgXaSxC7skzgpVfUVKvWHItn9CDVmExTvgY?=
 =?iso-8859-1?Q?pSmzManM2tTOaSJLfzd2QYbvvS11bK9wwmp+FGmNLAGnqvI6SWXecm4UEQ?=
 =?iso-8859-1?Q?3dw/uJIVJY++DzNKVA25vXdUqJbkCBK8tLUaUN3zPGbyYmYuvMVamJvQaD?=
 =?iso-8859-1?Q?UKOqo5aSUdDgDv5OubLqGVqbRTCDI3oefaKaF1IPY9H3k2ZJPoJureJuQg?=
 =?iso-8859-1?Q?lDe5XzvuHYcBT+2aihvDOoseHIiwOsaxPGpKqnoEuE4/Su6WGrVgp7+65K?=
 =?iso-8859-1?Q?LMY9Ac5QqQcGq8dPQkxjqcf3HufxSmX0VWUuWQ8PpX+KM+yWwnMU4mLsUU?=
 =?iso-8859-1?Q?9knj/JZI9NX3uXaMs3zK68sGD6Fr1xopuNzB9ohnAlX847A6SoK/qQuW1z?=
 =?iso-8859-1?Q?TPsSjWlxc1KP9+EZ6LQVdOh3Y4gXa7fbMI1Vcnj5GlkXSiw3BbxqBJryv1?=
 =?iso-8859-1?Q?RpD1o5JvUUt+cqNs/won7l7J1RBPnxEthGktwJUjFFbv9XCRYg4/dl9tzg?=
 =?iso-8859-1?Q?Hhjpa40NOaiRG7jEf18EJmJt9c9oSyXCde/D6wfQOTu+cACtFbv1C9GTyd?=
 =?iso-8859-1?Q?sXDv8cob6cNVYlMRnkZAoYowUyTibrYB9twjjmYOzemrC+3pYHQrz864Mg?=
 =?iso-8859-1?Q?rk+VAkn/wjdVu79Pw9nNgaIPk/X1sjm4B2dl0++mCJdWo9Zl3oM0GMxz81?=
 =?iso-8859-1?Q?5ASEFw4ADJgxhKUc5btTfBP9PENynHu9q4GP1ocKkHBKyBYmbDtf7RjEIQ?=
 =?iso-8859-1?Q?zAiLTHzmcopzHf3ExeeyBGnm3Q9FlpL63cmn1/tVaMnKgBomc+CxJ2/vCh?=
 =?iso-8859-1?Q?NTfLujXaFdcl4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5086.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097cdfda-2c10-4f7d-7586-08dccb80e3f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 18:56:01.9982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/RmpGi+PicHFQ1yOHd9JiuJ2/iaUOQ+pPNf2t89zMMvQ1aadZKVrqbYHvtNrCGAe2pwP95tFSN7aQI9ixssnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7633
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,


________________________________________
From: Thomas Zimmermann <tzimmermann@suse.de>
Sent: Monday, September 2, 2024 05:11 PM
To: Borislav Petkov; V, Narasimhan
Cc: Linux Next Mailing List; Daniel Vetter; Helge Deller; linux-fbdev@vger.=
kernel.org; dri-devel@lists.freedesktop.org; open list
Subject: Re: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467=
 unregister_framebuffer+0x45/0x160

>Hi

> Am 02.09.24 um 10:45 schrieb Borislav Petkov:
>> Fixing subject and recipients and leaving the whole mail untouched.
>>
>> On Sun, Sep 01, 2024 at 05:01:28PM +0200, V, Narasimhan wrote:
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> Hi,
>>>
>>> Seeing the following warning and bug on boot with linux-next-20240829
>>>
>>> WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregist=
er_framebuffer+0x45/0x160
>>> BUG: kernel NULL pointer dereference, address: 0000000000000000

>Does it work if you revert one of these commits?

>   b49420d6a1ae ("video/aperture: optionally match the device in
>sysfb_disable()")

>   c2fe0480cd77 ("fbdev/efifb: Use devm_register_framebuffer()")


Reverting this commit fixes the issue.


> For the latter, there might be a fix at

> https://patchwork.freedesktop.org/patch/611902/?series=3D138008&rev=3D1



> Best regards
> Thomas

--
Regards
Narasimhan V


>>
>>
>>
>> 19:07:54  [   18.395285] WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/c=
ore/fbmem.c:467 unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.406264] Modules linked in: ast(+) i2c_algo_bit drm_shme=
m_helper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel s=
ha256_ssse3 drm tg3 nvme sha1_ssse3 ahci i2c_piix4 libahci i2c_smbus nvme_c=
ore aesni_intel crypto_simd cryptd
>> 19:07:54  [   18.430347] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tain=
ted 6.11.0-rc5-next-20240830-1725196918033 #1
>> 19:07:54  [   18.440929] Hardware name: AMD Corporation Shale96/Shale96,=
 BIOS RSH100BD 12/11/2023
>> 19:07:54  [   18.449572] Workqueue: events work_for_cpu_fn
>> 19:07:54  [   18.454435] RIP: 0010:unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.460267] Code: 83 ec 08 e8 7d 4a 76 00 49 63 44 24 04 83=
 f8 1f 77 18 48 83 f8 1f 0f 87 d6 00 00 00 4c 3b 24 c5 80 76 a7 83 0f 84 85=
 00 00 00 <0f> 0b 49 8b bc 24 d0 01 00 00 48 85 ff 74 0b 41 f6 84 24 ec 01 =
00
>> 19:07:54  [   18.481224] RSP: 0018:ff56f06f800efb50 EFLAGS: 00010286
>> 19:07:54  [   18.487058] RAX: 0000000000000000 RBX: ff2d2a8913c77a40 RCX=
: ff2d2a8913c77400
>> 19:07:54  [   18.495023] RDX: ff2d2a8900956000 RSI: ff2d2a8913c77428 RDI=
: ffffffff83918360
>> 19:07:54  [   18.502987] RBP: ff56f06f800efb68 R08: ffffffff82dce06a R09=
: 0000000000000010
>> 19:07:54  [   18.510950] R10: ff2d2a8913cfc2b0 R11: 0000000000000004 R12=
: ff2d2a8913cffc00
>> 19:07:54  [   18.518911] R13: ff56f06f800efbd0 R14: ff2d2a8913cfc010 R15=
: 0000000000000202
>> 19:07:54  [   18.526873] FS:  0000000000000000(0000) GS:ff2d2a980ba00000=
(0000) knlGS:0000000000000000
>> 19:07:54  [   18.535903] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> 19:07:54  [   18.542312] CR2: 0000558d19347c98 CR3: 000000011827a006 CR4=
: 0000000000771ef0
>> 19:07:54  [   18.550275] PKRU: 55555554
>> 19:07:54  [   18.553293] Call Trace:
>> 19:07:54  [   18.556016]  <TASK>
>> 19:07:54  [   18.558354]  ? show_regs+0x6d/0x80
>> 19:07:54  [   18.562153]  ? __warn+0x91/0x140
>> 19:07:54  [   18.565756]  ? unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.570917]  ? report_bug+0x193/0x1a0
>> 19:07:54  [   18.575008]  ? handle_bug+0x63/0xa0
>> 19:07:54  [   18.578901]  ? exc_invalid_op+0x1d/0x80
>> 19:07:54  [   18.583181]  ? asm_exc_invalid_op+0x1f/0x30
>> 19:07:54  [   18.587842]  ? unregister_framebuffer+0x45/0x160
>> 19:07:54  [   18.592994]  devm_unregister_framebuffer+0x12/0x20
>> 19:07:54  [   18.598338]  devm_action_release+0x16/0x20
>> 19:07:54  [   18.602910]  release_nodes+0x47/0xc0
>> 19:07:54  [   18.606898]  devres_release_all+0x9f/0xe0
>> 19:07:54  [   18.611371]  device_unbind_cleanup+0x12/0x80
>> 19:07:54  [   18.616136]  device_release_driver_internal+0x20c/0x250
>> 19:07:54  [   18.621967]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 19:07:54  [   18.627315]  device_release_driver+0x16/0x20
>> 19:07:54  [   18.632079]  bus_remove_device+0xcf/0x130
>> 19:07:54  [   18.636551]  device_del+0x16a/0x3c0
>> 19:07:54  [   18.640444]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 19:07:54  [   18.645791]  platform_device_del.part.0+0x18/0x90
>> 19:07:54  [   18.651042]  platform_device_unregister+0x24/0x40
>> 19:07:54  [   18.656303]  sysfb_disable+0x5c/0xa0
>> 19:07:54  [   18.660296]  aperture_remove_conflicting_pci_devices+0x33/0=
x140
>> 19:07:54  [   18.666907]  drm_aperture_remove_conflicting_pci_framebuffe=
rs+0x19/0x20 [drm]
>> 19:07:54  [   18.674886]  ast_pci_probe+0x2c/0x540 [ast]
>> 19:07:54  [   18.679556]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 19:07:54  [   18.684904]  local_pci_probe+0x4c/0xb0
>> 19:07:54  [   18.689087]  work_for_cpu_fn+0x1b/0x30
>> 19:07:54  [   18.693271]  process_one_work+0x17a/0x3b0
>> 19:07:54  [   18.697745]  worker_thread+0x2a0/0x3a0
>> 19:07:54  [   18.701927]  ? __pfx_worker_thread+0x10/0x10
>> 19:07:54  [   18.706688]  kthread+0xe5/0x120
>> 19:07:54  [   18.710192]  ? __pfx_kthread+0x10/0x10
>> 19:07:54  [   18.714375]  ret_from_fork+0x3d/0x60
>> 19:07:54  [   18.718363]  ? __pfx_kthread+0x10/0x10
>> 19:07:54  [   18.722544]  ret_from_fork_asm+0x1a/0x30
>> 19:07:54  [   18.726923]  </TASK>
>> 19:07:54  [   18.729359] ---[ end trace 0000000000000000 ]---
>> 09:13:40  [   18.100937] BUG: kernel NULL pointer dereference, address: =
0000000000000000
>> 09:13:40  [   18.108694] #PF: supervisor read access in kernel mode
>> 09:13:40  [   18.114424] #PF: error_code(0x0000) - not-present page
>> 09:13:40  [   18.120153] PGD 1156fa067 P4D 0
>> 09:13:40  [   18.123751] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>> 09:13:40  [   18.129194] CPU: 0 UID: 0 PID: 458 Comm: kworker/0:2 Tainte=
d: G        W          6.11.0-rc5-next-20240829-1725075030567 #1
>> 09:13:40  [   18.141618] Tainted: [W]=3DWARN
>> 09:13:40  [   18.144922] Hardware name: AMD Corporation Shale96/Shale96,=
 BIOS RSH100BD 12/11/2023
>> 09:13:40  [   18.153551] Workqueue: events work_for_cpu_fn
>> 09:13:40  [   18.158412] RIP: 0010:fb_destroy_modelist+0x1a/0x70
>> 09:13:40  [   18.163853] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90=
 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 56 41 55 41 54 49 89 fc 53=
 48 8b 3f <48> 8b 1f 49 39 fc 74 36 49 be 00 01 00 00 00 00 ad de 49 bd 22 =
01
>> 09:13:40  [   18.184809] RSP: 0018:ff42b545c14e7b20 EFLAGS: 00010246
>> 09:13:40  [   18.190638] RAX: 0000000000000000 RBX: ff2cd8a142f7ce00 RCX=
: ff2cd8a142f7cf00
>> 09:13:40  [   18.198597] RDX: ff2cd8b088b74000 RSI: ff2cd8a142f7cf28 RDI=
: 0000000000000000
>> 09:13:40  [   18.206557] RBP: ff42b545c14e7b40 R08: ffffffff907cca2c R09=
: 0000000000000010
>> 09:13:40  [   18.214520] R10: ff2cd8a142fb06b0 R11: 0000000000000004 R12=
: ff2cd8a142fb5288
>> 09:13:40  [   18.222480] R13: ff42b545c14e7bd0 R14: ff2cd8a142fb0410 R15=
: 0000000000000283
>> 09:13:40  [   18.230440] FS:  0000000000000000(0000) GS:ff2cd8b046600000=
(0000) knlGS:0000000000000000
>> 09:13:40  [   18.239466] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> 09:13:40  [   18.245874] CR2: 0000000000000000 CR3: 00000001156cc005 CR4=
: 0000000000771ef0
>> 09:13:40  [   18.253836] PKRU: 55555554
>> 09:13:40  [   18.256851] Call Trace:
>> 09:13:40  [   18.259573]  <TASK>
>> 09:13:40  [   18.261901]  ? show_regs+0x6d/0x80
>> 09:13:40  [   18.265695]  ? __die+0x29/0x70
>> 09:13:40  [   18.269098]  ? page_fault_oops+0x15c/0x550
>> 09:13:40  [   18.273664]  ? unregister_framebuffer+0x45/0x160
>> 09:13:40  [   18.278813]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.284157]  ? vprintk+0x3f/0x70
>> 09:13:40  [   18.287755]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.293097]  ? _printk+0x5c/0x80
>> 09:13:40  [   18.296699]  ? do_user_addr_fault+0x47a/0x7e0
>> 09:13:40  [   18.301559]  ? __warn+0xbc/0x140
>> 09:13:40  [   18.305158]  ? unregister_framebuffer+0x45/0x160
>> 09:13:40  [   18.310307]  ? exc_page_fault+0x7c/0x1b0
>> 09:13:40  [   18.314680]  ? asm_exc_page_fault+0x2b/0x30
>> 09:13:40  [   18.319347]  ? fb_destroy_modelist+0x1a/0x70
>> 09:13:40  [   18.324107]  unregister_framebuffer+0x6c/0x160
>> 09:13:40  [   18.329063]  devm_unregister_framebuffer+0x12/0x20
>> 09:13:40  [   18.334408]  devm_action_release+0x16/0x20
>> 09:13:40  [   18.338978]  release_nodes+0x47/0xc0
>> 09:13:40  [   18.342965]  devres_release_all+0x9f/0xe0
>> 09:13:40  [   18.347436]  device_unbind_cleanup+0x12/0x80
>> 09:13:40  [   18.352196]  device_release_driver_internal+0x20c/0x250
>> 09:13:40  [   18.358024]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.363367]  device_release_driver+0x16/0x20
>> 09:13:40  [   18.368128]  bus_remove_device+0xcf/0x130
>> 09:13:40  [   18.372599]  device_del+0x16a/0x3c0
>> 09:13:40  [   18.376488]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.381837]  platform_device_del.part.0+0x18/0x90
>> 09:13:40  [   18.387086]  platform_device_unregister+0x24/0x40
>> 09:13:40  [   18.392330]  sysfb_disable+0x5c/0xa0
>> 09:13:40  [   18.396316]  aperture_remove_conflicting_pci_devices+0x33/0=
x140
>> 09:13:40  [   18.402921]  drm_aperture_remove_conflicting_pci_framebuffe=
rs+0x19/0x20 [drm]
>> 09:13:40  [   18.410899]  ast_pci_probe+0x2c/0x540 [ast]
>> 09:13:40  [   18.415566]  ? srso_alias_return_thunk+0x5/0xfbef5
>> 09:13:40  [   18.420914]  local_pci_probe+0x4c/0xb0
>> 09:13:40  [   18.425095]  work_for_cpu_fn+0x1b/0x30
>> 09:13:40  [   18.429277]  process_one_work+0x17a/0x3b0
>> 09:13:40  [   18.433746]  ? __pfx_worker_thread+0x10/0x10
>> 09:13:40  [   18.438507]  worker_thread+0x2a0/0x3a0
>> 09:13:40  [   18.442685]  ? __pfx_worker_thread+0x10/0x10
>> 09:13:40  [   18.447445]  kthread+0xe5/0x120
>> 09:13:40  [   18.450946]  ? __pfx_kthread+0x10/0x10
>> 09:13:40  [   18.455125]  ret_from_fork+0x3d/0x60
>> 09:13:40  [   18.459112]  ? __pfx_kthread+0x10/0x10
>> 09:13:40  [   18.463293]  ret_from_fork_asm+0x1a/0x30
>> 09:13:44  [   18.467673]  </TASK>
>> 09:13:44  [   18.470106] Modules linked in: ast(+) i2c_algo_bit drm_shme=
m_helper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel s=
ha256_ssse3 drm sha1_ssse3 nvme i2c_piix4 tg3 ahci nvme_core i2c_smbus liba=
hci aesni_intel crypto_simd cryptd
>> 09:13:44  [   18.494181] CR2: 0000000000000000
>> 09:13:44  [   18.497876] ---[ end trace 0000000000000000 ]---
>>
>> --
>> Regards
>> Narasimhan V
>>

--
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

