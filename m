Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572AE54E029
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 13:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679FE11A4D4;
	Thu, 16 Jun 2022 11:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jun 2022 09:27:38 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24304113C91
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655371658; x=1686907658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=saEr1fIEdMTvlg+6odBD11DDP+kcQP6lvlRgWyJ0eoM=;
 b=Z0i6sCqEBe1fOChlnt8LpZIZYfZTn5n+iDBiPrlgtVvCIPWiHh53WvKY
 MSsT93Qgk+oEZ7uf4jcdfOo5zPiJUcxpmHJswDAFOOfHF7IKIuKmIMLHH
 TxGq67ljlmV1Kal2L+3CwycHKZjS1cvcLQ18brynG89KD9+TfE7/c055R
 M4yvqdc0E/mSNlx+aimp5mH5MCxXFpQzjfmGGv4izQkI52XN4oXptmLWl
 5KeTjLSraKkUzybuqq2uGMPMuQ3RFyYdw/GbNJggNCQWXr/lAsrmeIpW4
 Tz4OBj93w/bnkey15ZbK4YCIoa/7kkpjZNDey3J8pFF3fgHG3q17swGxN w==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="163638917"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Jun 2022 02:20:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Jun 2022 02:20:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 16 Jun 2022 02:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOHYu4Z2JfKcdf1sTp98EvxROx/fx49NWThrem2VlRx4kYr/OUK8CGZ+zJhmLrF2U9dpvH+/8Sl2pfI8ZZwG1k2Iia/CM3EAOZDbv8oK+33siijNBoT/JIDJTAIb69cPqBeKgpsrOtINmPU5kTqKZx3eyz2EIJcGvJURVFPgyeMgf20xT+Z1rQBbcEZWCAiIRLw6gPIKi87ZSM+dCizXq3qpTpYJ1y75D81ZCiKwzgw6PhpaSlM6naIs5SmotHBoh/GICX7h0EfyyhYDhsVqRsd19hiqf5jkVnyGGvVpxi/90Dkv+zCcyWdkUbsCyvG2LZjU90Qu9qXqZxJlCNSj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saEr1fIEdMTvlg+6odBD11DDP+kcQP6lvlRgWyJ0eoM=;
 b=Y5M6iiG9bOECwnmIS1m8kohVLAGqPy384nKdm21R5Vdv23iSAAu6j5uMEsaFXVL3HfPric8f4rWaMoL3Xmz4CoKHAOOnqrAO9CmyRBEXDCdYNfMFJdplUSJEQRz43aM/5FpEGct1IhFFCgzp5sSVYDVcDQDlY8Bzm+CJc37WE16tQThcQ3SO9170H7O79dscPFuAjvIj79fyVkeyAVepvv8pJ7fm3I5ifyRgwswZzrtKFeaX7mdKv5skiPagDxX3TfkD32uftAdLNaxC1W0s5ZFqmEoc0FKcFyEwFtNwuCnYLsFikw9mMvcTfMxP4vUYbDj+DOScpaWqHf+pMznc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saEr1fIEdMTvlg+6odBD11DDP+kcQP6lvlRgWyJ0eoM=;
 b=M0Rvq9Qqz9eB1tvT3c59WJ0nYYvQR9GzIDxS6ikY9TCUYzqxGil1rGeVqQT3NcLj60mBTxTk/bWMCaJ4+h3Xv+muFdL+uifVSvPl0/+IT9Izrgj+mFq7pZczi0L4SnLqJlnS8x0Mn98VLu8l9FOt8W2jLXpvSN8WjRyeSORvXA4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3176.namprd11.prod.outlook.com (2603:10b6:a03:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Thu, 16 Jun
 2022 09:20:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 09:20:24 +0000
From: <Conor.Dooley@microchip.com>
To: <airlied@gmail.com>, <windhl@126.com>, <daniel@ffwll.ch>,
 <gregkh@linuxfoundation.org>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
Thread-Topic: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
Thread-Index: AQHYgWJPUpa1+ETeeU2rnKRqD4hdDA==
Date: Thu, 16 Jun 2022 09:20:24 +0000
Message-ID: <1f70f001-7bab-9146-b52c-2f75265137d9@microchip.com>
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
 <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
 <YqrtP2jS0Gg4pBRe@kroah.com>
 <5911192c.6793.1816bb6a391.Coremail.windhl@126.com>
In-Reply-To: <5911192c.6793.1816bb6a391.Coremail.windhl@126.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bde4146b-61fd-4d92-d0d0-08da4f7971cc
x-ms-traffictypediagnostic: BYAPR11MB3176:EE_
x-microsoft-antispam-prvs: <BYAPR11MB31763E921C47A7FDF707CB3B98AC9@BYAPR11MB3176.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MGTEI5yk99Z+K1X8DDuBPE/Q3EKNKybo4vpru9wBrA5/AcQK24l6ydABv2lXVjNSkFHWK986qgo7NlhODLeaUtEOTw/loMwJ+bywOZokSoQizpNApW9aXT3xbyy6zlTw2BJY5USmcjQ3gkXz25WQlyVuu421CENtP5eG5DoXq7QNrpEfIXoSjgcqCzkEEXfEn4mV6SEDexLJNPgvYbDSptMPqNiWGZrKsAzgLmUxTcOinyfZySQfQtyYgvn5bYOGHLryKphKYSfO4VnDIACtYwJFefHxbgH7CvsU6SEQc5aJkBVA8fcaPDKv88IH7QcQZR2PqM/FTFBN6knF8Klx8KhSHLkZqtus4Q1RoljZ5Ki5Hgr23Bue3aVSMhzzqIXW959HDc3tmf9wsLRfm1o7C47QnuMyugyuLVFYnSnXSwQd0fPV0StAIZYXhC9dZC7G46vU7pWjI5D4Hvu7ZVBrOv624KuSISYSmU0cUpHF1zQojyyUgEycn5RBhoOEj6kfgZhbnjHSHzRiQq4evJrhSPGxF6UKGXGuaX01rSqOdRyOR/9HOQcw8csT1y9ZWGfhuSBkAeeBo/UPU8lRdJOfZeYUJqNhs9acWM7L2t446ua/XVJJUU9Xna3osjQCy4czueoNL4hWq2scBFSj5BYukNVNMShsfgMM6tOjJShO6M/mfEZUYNkK1U5mRVTFBr9WCw69wTzoH3njEd3jbePjqQMb8i6JFH/PQuoLz/yrk2joymOKLyWhpw/Hp0KB0e2MVxcOABv+E2C82WxVGBiSww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(83380400001)(91956017)(66946007)(38070700005)(122000001)(38100700002)(66476007)(76116006)(64756008)(2906002)(53546011)(4326008)(508600001)(66446008)(66556008)(31686004)(6506007)(316002)(110136005)(6512007)(54906003)(5660300002)(86362001)(31696002)(6486002)(186003)(8676002)(26005)(2616005)(8936002)(36756003)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUNXaGs0bXVXY2t1enRvNTFvK1pZU1NsSy91QlFUWnF4eGliekpPcDl1OSth?=
 =?utf-8?B?VlRjbGM0eDhJMUxFNEpjcFBNbHRtVHB4N1hQbnREOGJyTnliTG04Y3VOT3Jt?=
 =?utf-8?B?WlNKQzJXcmMvMW4zalhhUFFjUHd1ZWtEaWY4RzF2VTQrV0ZTQkVQK0R3a29B?=
 =?utf-8?B?MVFwT2JVMEpPTWRYekpmVkxOb3FTcFJyQjkvWXF2ak5JNmRiTXVvN2t3RVpp?=
 =?utf-8?B?RXU2b3hweko3SDVVeVV0RXI0RDJwZk5NcWFHR1VFcTY2aWlUellzemNSUFk2?=
 =?utf-8?B?clhVdDY0VTRrTFdDSktlY3V3cWg1QmFDT3dVWWpTRGcrdTkvdVdEc1luR21r?=
 =?utf-8?B?SlA3WFJqYlZVcE1lczBCSytkbkd1QTkybVd0ekZCM1Fxc0RIb2cyNjB0SUpC?=
 =?utf-8?B?SEhxTjBCSTJNZVZ1TVpGdzNSNWdMa3hVMTNNSU5uOXhUNWZ5aTNUUUFLekcy?=
 =?utf-8?B?Q250U1VEV1BXS0tmazhMR3NTWlRBcFRnRmM0MjNXa2xTVTdMNDVpbkdhTS9a?=
 =?utf-8?B?RTJXSmtRR1k0WDNjakJoMUIvdFpWNGNWUWFxY1hkc1ZKb2lkbi8yOFNkWlFV?=
 =?utf-8?B?VmRMOXBIOWl6ZzdZdVYyRU9UT0VGaXBhWi9Oa0dsQVZVdzBpTFV4Z2NoL0hp?=
 =?utf-8?B?QURadW5Xc0xXY2ZYTjZReDB2NWUrWU1YSTNNY2xabmE2QTZCY1RlYXVGZ29o?=
 =?utf-8?B?WjBJQkNER1VGc1ErNWxmYXRVQ1h4SDRsd2IvV1dMVWxNWVZlWmdHNnJ2NkRZ?=
 =?utf-8?B?d3ZqaG5uckIzSjZHMlJPZnVXM095ei9qR0c4Yk1ZTmdRckprNmg5OU5YYWky?=
 =?utf-8?B?emgyMjREKy9RRXo0aWtSMzlBL0hhaWpITUdKRHNSN1RsckdSTUJVQ0srVVl6?=
 =?utf-8?B?b0c1bkR2bCtibmFDN0U5YVVDZ211OTVoRE9UWkZaYllZU2htcHd0VVBQUE16?=
 =?utf-8?B?OTZ1YmxEemIyUWJqWElaNWdsV2VmTUlsWFRwRVdwY0lkQTBackNORjhVbmU0?=
 =?utf-8?B?SEhnbExiVkttODJJbnE1ZjFla2hPRDluTE4yZ3gvSFEzbjk1RUR5alBzRmFT?=
 =?utf-8?B?d2Q0ZVgzR2hITUFWWHdHTm93SFNyNUh3OC9jWlVQdDJlLzVYckthRzEzUmZF?=
 =?utf-8?B?VlJHUm5XYVFlM1Erd1BqNEo2TnJUbEtwanFWRGhjRW5ZUmhORit1cTI0R0VZ?=
 =?utf-8?B?akpPR1BwLzIyWGFKa0lseVkzUXlLTVJuK3VqcEFBL3c2MndhMzI0STNLMWRD?=
 =?utf-8?B?UTdwdUY1dkc0ekQ1TzVFZ0J2V0JpdnpBaW5LbVR3M1VJNVJNUkkzcS9GbDhs?=
 =?utf-8?B?cUFqcDZQbUw0V01hVUJMK2VlQUE5amVlRzczeTh0R09MbDVTMm1MeXRVTTVM?=
 =?utf-8?B?bW5LV1JFZng5QzZvUXl6VDJ6ZmhsYU42aUhtdGMzYzkrMU9paVJOc05QK3lI?=
 =?utf-8?B?UjVXWmNLMmNVdTliUTc1NkJyYTZteW5NaTA4TkNhNGk1dkZCVC9acVZVZno4?=
 =?utf-8?B?ZXA4TGNWU0pwYXo2TFF0TVprMHdlRjFKa05ZaVdYU0lPaHJJbys5cUFBcUJa?=
 =?utf-8?B?Q0FGRkV1RkN1YjE5QkVMeHdUUFlZQnJPcTNIUUg1VEY5bGlJUkIyeUV4eFZF?=
 =?utf-8?B?am9GZEVLY3I2MEgxM3RpaEFkb2pla0FtcTRTU280SktnUG43c040T1IvMCth?=
 =?utf-8?B?Y2ZPRURrTVpDZk41VXJIeUJmRDVkaC9iVmM5MTVPQUVNTy9ZY3VtZVhhZEtI?=
 =?utf-8?B?N1RUNFRRZElkTlRNaDl0c2htekltYmpVamZlZFdlb2tCeUNFMUl4SHd4aTNS?=
 =?utf-8?B?YlJHS2dwSTR2aC90NFFnN0xpRjlPTTJaOVkvOUV2bEY1SWdISklsQ0NST0x0?=
 =?utf-8?B?a2lxanFVVUQrN3Z6T0ZXNzEwZHZzclhQQ2J4TkorZ3I4Wm1POEhhbnBCNTFE?=
 =?utf-8?B?TzVkbHRCclFXNUhmS09rQnowTzZzVnRYd0ZKWmRMc2k2Q25QL0NRVFRTc29K?=
 =?utf-8?B?RW9WczRoajgxc3dJUWRoaHY0RHc2MjJ1UG00cERDM2FNV0RjYlptY0llOWlQ?=
 =?utf-8?B?ekRBSzI4cVBGY2pKWHR6QnZjUHJIR0c5QTdONDkxOGJEWkp5V0xtck9ZNDEx?=
 =?utf-8?B?am9XSzNMbGJybUhycTVqNmN3Ly9wNVlrU2tHWmhwTFAwTEdqeTVnckFoWUpV?=
 =?utf-8?B?cFR5ald6cFFLenZHbzYvUXcrcVM5cCtsU0hnZGF5R0dINjltL0dtWllhaFJ1?=
 =?utf-8?B?YUIydTNUeWhIbThoWUNUMUJod3JFQ0Mwb3JHcXhmV2hHSnlWWUVIVERZRjJ0?=
 =?utf-8?B?eFM0UnEyL3pWUGR3WmRGQm11SjVpREl1R3dac2VITkkzaEdpMjYwMUkybnZC?=
 =?utf-8?Q?v+pdLWtlWjxk14VY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD7FC1B043E3194D8A50F30E781F108B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde4146b-61fd-4d92-d0d0-08da4f7971cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 09:20:24.4763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RaNzVY12Eo9EmbJ6u8/lReX/tsoiJ2ZmNRu+jXPH5MAoAZPwAkQEUc0XrBXNBaLnY0x8g285UnXvkHt1Nki2i9xQ3Ab6/UrKbDpcfJSuLCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3176
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:41:09 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDYvMjAyMiAwOTo1MiwgTGlhbmcgSGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQXQgMjAyMi0wNi0xNiAxNjo0Mzo0MywgIkdyZWcgS0gi
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+PiBPbiBXZWQsIEp1biAxNSwg
MjAyMiBhdCAxMDozMDo0N1BNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+IE9uIFdl
ZCwgMTUgSnVuIDIwMjIgYXQgMjI6MjMsIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pj4+DQo+Pj4+IE9uIFdlZCwgMTUgSnVuIDIwMjIgYXQgMjA6NTMsIEdyZWcgS0gg
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4+Pj4+DQo+Pj4+PiBPbiBXZWQs
IEp1biAxNSwgMjAyMiBhdCAwNjo0ODozM1BNICswODAwLCBoZWxpYW5nIHdyb3RlOg0KPj4+Pj4+
IEluIHRlZ3JhX3VhcnRfaW5pdCgpLCBvZl9maW5kX21hdGNoaW5nX25vZGUoKSB3aWxsIHJldHVy
biBhIG5vZGUNCj4+Pj4+PiBwb2ludGVyIHdpdGggcmVmY291bnQgaW5jcmVtZW50ZWQuIFdlIHNo
b3VsZCB1c2Ugb2Zfbm9kZV9wdXQoKQ0KPj4+Pj4+IHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9y
ZS4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IGhlbGlhbmcgPHdpbmRobEAxMjYuY29t
Pg0KPj4+Pj4NCj4+Pj4+IFdlIG5lZWQgYSByZWFsIG5hbWUgcGxlYXNlLCBvbmUgeW91IHNpZ24g
ZG9jdW1lbnRzIHdpdGguDQo+Pj4+DQo+Pj4+IEhvdyBkbyB3ZSBlbmZvcmNlIHRoYXQ/IFdoYXQg
aWYgV29uZywgQWRlbGUgb3IgQmV5b25jZSBzdWJtaXQgYSBwYXRjaD8NCj4+Pj4NCj4+Pj4gV2hh
dCBoYXBwZW5zIGlmIHRoYXQgcGF0Y2ggZ2V0cyByZXBvc3RlZCwgd2l0aCBTLW8tYjogSGUgTGlh
bmcNCj4+Pj4gPHdpbmRobEAxMjYuY29tPiBvciBIZWwgSWFuZywgSGVsaSBBbmc/IERvIHlvdSBr
bm93IGFueSBvZiB0aG9zZSBhcmUNCj4+Pj4gcmVhbCBuYW1lcz8gV2hhdCBoYXBwZW5zIGlmIHRo
ZXkgcG9zdCBhIHJlYWwgbmFtZSBpbg0KPj4+PiBNYW5kYXJpbi9UaGFpL0N5cmlsbGljLCBjYW4g
eW91IHZhbGlkYXRlIGl0Pw0KPj4+Pg0KPj4+PiBSZWFsbHkgd2UgcmVxdWlyZSB5b3UgaGF2ZSBh
biBpZGVudGl0eSBhdHRhY2hlZCB0byBhbiBlbWFpbC4gSWYgdGhlcmUNCj4+Pj4gaXMgYSBwcm9i
bGVtIGluIHRoZSBmdXR1cmUsIHdlJ2QgcHJlZmVyIHRoZSBlbWFpbCBjb250aW51ZXMgdG8gd29y
ayBzbw0KPj4+PiB0aGF0IHlvdSBhcmUgY29udGFjdGFibGUuIElmIHlvdSBhcmUgc3VibWl0dGlu
ZyBhIHNtYWxsIGFtb3VudCBvZg0KPj4+PiBjaGFuZ2VzIGl0J3MgcHJvYmFibHkgbmV2ZXIgZ29p
bmcgdG8gbWF0dGVyLiBJZiB5b3UgYXJlIHN1Ym1pdHRpbmcNCj4+Pj4gbGFyZ2VyIGJvZGllcyBv
ZiB3b3JrIG9mIGNvdXJzZSBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgYSBjb21wYW55IG9yDQo+
Pj4+IGxhcmdlciBvcmcgYXR0YWNoZWQgdG8gdHJhY2sgdGhpbmdzIGRvd24gbGVnYWxseSBsYXRl
ciwgYnV0IGFnYWluIHRoYXQNCj4+Pj4gaXNuJ3QgYWx3YXlzIHBvc3NpYmxlLg0KPj4+Pg0KPj4+
PiBJIGRvbid0IHRoaW5rIGFsaWVuYXRpbmcgdGhlIG51bWVyb3VzIGRldmVsb3BlcnMgd2hvIG5v
IGxvbmdlciB1c2UNCj4+Pj4gdGhlaXIgbGVnYWwgbmFtZXMgYXJlIGlkZW50aWZpZWQgYnkgb25l
IG5hbWUsIGJ1dCBoYXZlbid0IGNoYW5nZWQNCj4+Pj4gdGhlaXIgbGVnYWwgb25lIHlldCBwZW9w
bGUgd2hvIGdldCBtYXJyaWVkIGFuZCBjaGFuZ2UgdGhlaXIgbGVnYWwgbmFtZQ0KPj4+PiBidXQg
ZG9uJ3QgY2hhbmdlIHRoZWlyIGNvbnRyaWJ1dGlvbiBuYW1lIGFuZCBJIGNvdWxkIHJ1biB0aGlz
IHNlbnRlbmNlDQo+Pj4+IG9uIGZvcmV2ZXIuDQo+Pj4NCj4+PiBZZWFoIGxpa2UgYWJzb2x1dGUg
YmVzdCBjYXNlIHRyeWluZyB0byAiZW5mb3JjZSIgdGhpcyBqdXN0IHJlc3VsdHMgaW4NCj4+PiBl
bmNvdXJhZ2luZyBwZW9wbGUgdG8gY29tZSB1cCB3aXRoIGVudGlyZWx5IGZha2UgYnV0IEVuZ2xp
c2ggbG9va2luZw0KPj4+IG5hbWVzIGZvciB0aGVtc2VsdmVzLiBXaGljaCAuLi4ganVzdCBuby4N
Cj4+DQo+PiBBZ3JlZSwgYWdhaW4sIEknZCBwcmVmZXIgdG8gdGFrZSByZWFsIG5hbWVzIGluIG5h
dGl2ZSBsYW5ndWFnZXMsIG91cg0KPj4gdG9vbHMgY2FuIGhhbmRsZSB0aGF0IGp1c3QgZmluZS4g
IE5vIG5lZWQgdG8gbWFrZSB1cCBhbnl0aGluZy4NCg0KU2luY2UgdGhpcyBpcyB0aGUgb25seSBt
YWlsIGZyb20gdGhpcyBjaGFpbiBpbiBteSBpbmJveCBhbmQgSSBhc2tlZCB0aGUNCnNhbWUgcXVl
c3Rpb24gYXMgR3JlZyBvbiBvdGhlciBwYXRjaGVzOg0KSSB0aGluayBpdCBpcyBwcmV0dHkgcmVh
c29uYWJsZSB0byAvYXNrLyBpZiBzb21ldGhpbmcgaXMgbm90IGEgcmVhbCBuYW1lDQp3aGVuIHlv
dSBzZWUgc29tZXRoaW5nIGxpa2UgImhlbGlhbmcgPHdpbmRobEAxMjYuY29tPiIgd2hlcmUgdGhl
cmUncyBhDQpjbGVhciBkaWZmZXJlbmNlLiBBbmQgIkl0IGlzIG15IHJlYWwgbmFtZSIgaXMgYSBw
ZXJmZWN0bHkgcmVhc29uYWJsZQ0KcmVzcG9uc2UgL3NocnVnLg0KVHJ1c3QgYnV0IHZlcmlmeSBy
aWdodD8gSXQncyBub3QgbGlrZSBJJ20gZ29ubmEgYXJndWUgdGhlIHRvc3Mgd2l0aA0Kc29tZW9u
ZSBpZiB0aGV5IHNheSBpdCBpcyB0aGVpciByZWFsIG5hbWUuLi4NCg0KVGhhbmtzLA0KQ29uY2h1
YmhhciA7KQ0KDQo+Pg0KPj4gdGhhbmtzLA0KPj4NCj4+IGdyZWcgay1oDQo+IA0KPiBoaSwgR3Jl
ZyBLLUgsDQo+IA0KPiBJIGhhdmUgcmVzZW50IGEgbmV3IHBhdGNoIGZvciBteSBjb21taXQgb2Yg
dGVncmFfdWFydF9pbml0KCkgYnVnIHdpdGggbXkgcmVhbCBuYW1lIGZvciBTb2IuDQo+IA0KPiBT
byB0aGVyZSBpcyBhbnlvdGhlciB0aGluZyBJIHNob3VsZCBkbz8NCg0K
