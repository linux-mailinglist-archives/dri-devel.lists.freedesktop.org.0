Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657771320F9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAE289B03;
	Tue,  7 Jan 2020 08:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300139.outbound.protection.outlook.com [40.107.130.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2B26E4FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 22:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMEsMwiBMLqfhzKBzI2gC62+D8UtNgSvjnxif8BznXuZlNchNxCewJqgo6JGVE9Brk9F/C9FSw+qBijV15JHePsPhDhsvsOgnecZy5asFC3O8A+Ey01PdASvv9KhRFtBPsSihHeHzmU7LS8PUeB1KMmaYm1i8zFJqlctgIjAfE41g5lXizGA/xq28q6Eqy4tAaVMaRMl+sil6EYkBR0d7xNbmaq9duA3//8asz0OV9ZwrurZ0oZZ97NRUJRZKuvi7z/S1bs+6RraoehzhSgZYDCUiAvnm+bSEIj2FofXj0vi7m6IzRIb+t5imqImMp+D2p3OjyM337BUCsOKbd+z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiCD50HsVXB3SDNGKs1hwRp9s1laNPeqRrAt3EpEMwY=;
 b=RugJ9mrVF68bVZoQjk7bbHMDVlJEDgqkbxmiltcHZ8XG8pp2PAlEMVFzp2XSalTZ4ye3iN2E7K6hGSSXLlFvi2JceYaJBK6hLUvZZ9k9DeV5MKMV+6JvUOMw2yr5+vsn03oBAR766vRW4Y78E5/wo0fXSIPeZ2LlXVubCQvt5+igoVMUeDmxxm2P5i+NRg1fvh+kZdBM/bMPJ2XG8FT2mlJB4YTV6LghLVZwWCTy35cutGYsVK5D3oYGJQm1HNOBgL9+veoLGKIfxCRyM+9CLTiZetz5jbgjAhOsjO//JyXkpf6uKYL4uPFBBeR/ZhR1H/o1oPPyqO+k20sJrHalfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiCD50HsVXB3SDNGKs1hwRp9s1laNPeqRrAt3EpEMwY=;
 b=dmF2P7alSZraMBXg1uLx8R4w/hUK6BnOPg6iSEoBuY+SHpKty8COJXdKQtvToWBVDsSDTjguCwGmYMgHHLoILS7puTaPzL/emFVvnsivP+7AT2bozg2lrKggUa+TDVHSbXYrxHOPWe5jqdoiJG4JTP5vDzTq3FOUjbiQBw80lUg=
Received: from HK0P153MB0148.APCP153.PROD.OUTLOOK.COM (52.133.156.139) by
 HK0P153MB0145.APCP153.PROD.OUTLOOK.COM (52.133.156.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.3; Mon, 6 Jan 2020 22:38:00 +0000
Received: from HK0P153MB0148.APCP153.PROD.OUTLOOK.COM
 ([fe80::15e7:8155:31bc:d4e7]) by HK0P153MB0148.APCP153.PROD.OUTLOOK.COM
 ([fe80::15e7:8155:31bc:d4e7%7]) with mapi id 15.20.2644.002; Mon, 6 Jan 2020
 22:38:00 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Michael Kelley <mikelley@microsoft.com>, Wei Hu <weh@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>, "sashal@kernel.org" <sashal@kernel.org>,
 "hch@lst.de" <hch@lst.de>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "mchehab+samsung@kernel.org"
 <mchehab+samsung@kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "info@metux.net" <info@metux.net>, "arnd@arndb.de" <arnd@arndb.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
Thread-Topic: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
Thread-Index: AQHVxOHxuopG5mY95kawnV462nTW6w==
Date: Mon, 6 Jan 2020 22:37:59 +0000
Message-ID: <HK0P153MB0148F18913BEA45144AF8443BF3C0@HK0P153MB0148.APCP153.PROD.OUTLOOK.COM>
References: <20191209075749.3804-1-weh@microsoft.com>
 <CY4PR21MB06293C21EC5338C98080F6AED7580@CY4PR21MB0629.namprd21.prod.outlook.com>
In-Reply-To: <CY4PR21MB06293C21EC5338C98080F6AED7580@CY4PR21MB0629.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-09T16:32:55.0594936Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=32db805d-f982-4dfd-985a-2183a1a1211d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
x-originating-ip: [2001:4898:80e8:9:9215:9356:cafd:e70d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ad78d3bc-0336-43a8-b8ae-08d792f91593
x-ms-traffictypediagnostic: HK0P153MB0145:|HK0P153MB0145:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0P153MB01453B73FFC8D5E7FB72F0FFBF3C0@HK0P153MB0145.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(396003)(136003)(366004)(189003)(199004)(71200400001)(76116006)(316002)(10290500003)(86362001)(7416002)(9686003)(66946007)(478600001)(66476007)(66556008)(64756008)(55016002)(66446008)(53546011)(110136005)(8936002)(4326008)(8990500004)(5660300002)(2906002)(7696005)(6506007)(81166006)(81156014)(52536014)(8676002)(33656002)(186003)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK0P153MB0145;
 H:HK0P153MB0148.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TYfy/9hBwPHtX71CRSOAYpTOfijLZNuE09eWdKZAmqkEQsVJDYe5cAXN08W6/rwgaugrYVxueZQxBzP5nMJJgvZhPBBTNYWVHhLCjnNnkh/7XwEWxgnvrgC6EB/6nt0XBYiksmrQl28x/v1gzOGQDW1GXy/EdAP8RmuJD2bzw41HBjKPI39HKRnMmJloV8l3doBw7vRkvkwj9iz0whpNqJhRZHpy0Cgk6hylbgX47DyiYu/SOnW+33nO4bCg/Lireg3+jyhtBRcWvy82kjFK2W18UM/pPSjSa+Z/FYTWBWU3B+uFz1iiEfVlHXhwCdkApBXGe9g4Ajp8bj0UvA7PsQBD7gOK7mIGh+xOVTWKgLBmFFsDkjQNHOzSX0a0dNTuaE46ksA1YjEUDK95/4K3jPxj1Le8I2gjmGMOpMZiAIuUqMTTsea9hehD5+s35TnNEoVbUi6qHjIy4aKSyuO++ygODrs0ZNYgUWosY2R5Y/bma/SLlbzGKn4ueS7la5ZL
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad78d3bc-0336-43a8-b8ae-08d792f91593
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 22:37:59.8621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EgCmK1Ap1QFrM8BoWUuJ/CtYV54glkYyXuWQkpbSByV4QB+nlXqnOZBn6N127HB6glQky2coOSTQWFkMTTqxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0P153MB0145
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Michael Kelley <mikelley@microsoft.com>
> Sent: Monday, December 9, 2019 8:33 AM
> To: Wei Hu <weh@microsoft.com>; b.zolnierkie@samsung.com; KY
> Srinivasan <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.com>;
> Stephen Hemminger <sthemmin@microsoft.com>; sashal@kernel.org;
> hch@lst.de; m.szyprowski@samsung.com; mchehab+samsung@kernel.org;
> sam@ravnborg.org; gregkh@linuxfoundation.org;
> alexandre.belloni@bootlin.com; info@metux.net; arnd@arndb.de;
> dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; Dexuan Cui
> <decui@microsoft.com>
> Cc: kbuild test robot <lkp@intel.com>
> Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for
> fb on HyperV Gen 1 VMs.
> 
> From: Wei Hu <weh@microsoft.com> Sent: Sunday, December 8, 2019 11:58
> PM
> >
> > On Hyper-V, Generation 1 VMs can directly use VM's physical memory for
> > their framebuffers. This can improve the efficiency of framebuffer and
> > overall performance for VM. The physical memory assigned to framebuffer
> > must be contiguous. We use CMA allocator to get contiguous physicial
> > memory when the framebuffer size is greater than 4MB. For size under
> > 4MB, we use alloc_pages to achieve this.
> >
> > To enable framebuffer memory allocation from CMA, supply a kernel
> > parameter to give enough space to CMA allocator at boot time. For
> > example:
> >     cma=130m
> > This gives 130MB memory to CAM allocator that can be allocated to
> > framebuffer. If this fails, we fall back to the old way of using
> > mmio for framebuffer.
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Wei Hu <weh@microsoft.com>
> > ---
> >     v2: Incorporated review comments form hch@lst.de, Michael Kelley
> and
> >     Dexuan Cui
> >     - Use dma_alloc_coherent to allocate large contiguous memory
> >     - Use phys_addr_t for physical addresses
> >     - Corrected a few spelling errors and minor cleanups
> >     - Also tested on 32 bit Ubuntu guest
> >     v3: Fixed a build issue reported by kbuild test robot and incorported
> >     some review comments from Michael Kelley
> >     - Add CMA check to avoid link failure
> >     - Fixed small memory leak introduced by alloc_apertures
> >     - Cleaned up so code
> >     v4: Removed request_pages variable as it is no longer needed
> >
> >  drivers/video/fbdev/Kconfig     |   1 +
> >  drivers/video/fbdev/hyperv_fb.c | 182
> +++++++++++++++++++++++++-------
> >  2 files changed, 144 insertions(+), 39 deletions(-)
> >
> 
> Reviewed-by: Michael Kelley <mikelley@microsoft.com>

Tested-by: Dexuan Cui <decui@microsoft.com>

For a Gen-1 VM running on recent Hyper-V hosts, this patch can greatly 
reduce the CPU utilization because it avoids the slow data copy from the 
shadow framebuffer to the MMIO framebuffer, and hence it resolves the
"blurred screen" issue when we output a lot of characters on the text-mode
ternimal (e.g. "dmesg").
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
