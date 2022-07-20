Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056157B757
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C341131C4;
	Wed, 20 Jul 2022 13:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-bgr052101064008.outbound.protection.outlook.com [52.101.64.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AAF14B5A2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqwF8lcs9q1sroZ5heaht324vvRMZGQ/6pxjSN0cvDbBdFrP15q7EtQUZFRThtWGdw6tbydguaLLyJ9MdKGwNUirYGcVVEGVdw1FCqU3H5y3uhHSGz6VFg1tDXFZMn/TLUonmK8L0vqoyvrHx7pffaDb1jtYpLuS9GdZBkGB8bJ6Ve1xI2mZUtZcv2lqSPQKrWuiOZKm11ZCye1Gs/fKhAXxiFpNL7V+yx8BGqVNgaes40jayaQ7f1Q81xAZjp98iVdyZtua3gQK497GCEEyUoXFJKZAJvjH6EnNg0w7K50mi/33CPy70Bd7PbHm8UhoHioyXq8aGfpYSOIv16Jvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZkCc8fKj/1/olFMD9wztUm4Wq7cdTPHixyEc4/wWTQ=;
 b=lBUTbwBxz8im1kSYpo3Cgs2qTPNVeaXnbQRVS9q+iOU1DLJIEtnIx9WONjBZKpHsoOZKGNQccxx8HElLXkWDm1LxPBrkQ5LyOwH5FuNpf3JTyqudyVt3F3jzGtSdNW7US+Jk7wA7ExMV0RdwTxWfBiUMVic4wDBfSqG+CjfUi41hkZ6apkr0683Wor/8Ddr4rPaouVTJ1CIXGBTxtVav0RTOajaZrqMDmoa7rEQCOgfAJXg5wuyS4qKurkp9hN6zjveg8ss7FNEL5iBg6fkOspitm65Nv3ScbyQzYMI+PlOR3TZFNRZe5n+Ctbp9oXvp99JEaM2lk9/U/EG5rBg2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZkCc8fKj/1/olFMD9wztUm4Wq7cdTPHixyEc4/wWTQ=;
 b=ETXxUrsb62HPjLwW/vyDwmNdIy0Vrazs9JsaIs+p5A5HfR+YJz2SCvNPKo8WYZT3+Ow/5ZszXL3rRGg3G6cynoHinRDHbvFG3Vnoq1cGQ+vWDcPhig4yQuSMfHcV1rW2V657E/n5j4LSmnSp96Hl2J+zUDUJDRwdBdFqDncWTl0=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BN8PR05MB6706.namprd05.prod.outlook.com (2603:10b6:408:54::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.16; Wed, 20 Jul
 2022 13:22:14 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5458.016; Wed, 20 Jul 2022
 13:22:14 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/vmwgfx: clean up some error pointer checking
Thread-Topic: [PATCH] drm/vmwgfx: clean up some error pointer checking
Thread-Index: AQHYm1SZLx6Bcc2v2UiVJHhUCzW75K2HQMmA
Date: Wed, 20 Jul 2022 13:22:14 +0000
Message-ID: <feb694b8757823f35f0d786d64179cc99b891bd2.camel@vmware.com>
References: <YtZ9qrKeBqmmK8Hv@kili>
In-Reply-To: <YtZ9qrKeBqmmK8Hv@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7a8f7ce-c763-47f3-4c28-08da6a52dc7f
x-ms-traffictypediagnostic: BN8PR05MB6706:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ozcVdC+3WjNZcvpXNUaDPtAuLH5/btcgmatqtLfm6TH/9AkJIivCn3FFH9ODFc5aMRnUKQS5IAcDXpUVqrfv+SaGdmQH1pSqwNVV/L1WSYvU5HX7/lr4zPZGSUgYNFhCHZbGM3POyHqsQfhbDsV4igdzEcdhSpuR0Y9R83TxocV8RNdnoEP2w0OBXRffo/QOScxGyLKFHOiyiv1vmFZ1aAf6Qp6LbF14eFizlaIMqkfyH2+TBfsa1Dbuhfq6aEzBZuFQ10yhTjnDb75zQ5VRxSzxoN/Dx8Cy2LgojiJzdvEsgoUDG8gmR0u5N9aw2uRIrj9OozNPLcK2s2YHDuiOl0z5ejxRxJdTOEQYUa190sqclr/X0xShdTnUH1EUBMLW2sjqa+gmAOz+wJdUQbIdKdHStTlB6QMb4iaGMqzSfopnyuIFi9Mo+bRRhBODAteo6KJkbEDYfy0TJ7DwSoFZmQj3T3s8VkKQpdX2yhwuQzFHUSmoF1ASkOGx3qOE9A4XDsXYe7ZkjeRdMBdLTR3CHm5CRlzi1jWigrgCu1qv7BP+bPnBUZyH2vTTpvQn0ueweonS3ohhERZsIxvKHRFs/nWxG0jAim7a2eVrr4gmBSvmBFcKv1iHyKpbMY6x2SAt26ixXARJ5P/qXpD0SOKE0J6zP5/3XW5c0cokGQX5FiSJsea5jfvn7lk6zRE1v7lLsx6JYK7lIe+lFGRT0lLotD6VKkKdd6RauRLmd4sTQKlH5X44QKRwyulp4JgsUYwNxXEldUMtojCWebo/YyzP4GNDjTZ52TvlWuVR8eG9Jt4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(6916009)(86362001)(36756003)(2906002)(41300700001)(478600001)(186003)(4744005)(316002)(6512007)(26005)(2616005)(8676002)(71200400001)(76116006)(64756008)(38100700002)(66446008)(66556008)(5660300002)(66476007)(66946007)(122000001)(38070700005)(54906003)(8936002)(6486002)(6506007)(4326008)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTFhdmdqYTY5VGpQanQzSHF5bGVpeHJSazNJQmx2R0hJTWllRlhxVkZJN3Zy?=
 =?utf-8?B?QW52ZXV5c3pPNEt6NGE5NkdpbG1Kb3NYSDYwK2xpRHhSQUQxRGlFeW43T29o?=
 =?utf-8?B?TzkrdGFiRjNJVE1sS09wZTZKT2ZkM0EzNGVtZ0tnSkdBYUwrQzBCZlFmNWpp?=
 =?utf-8?B?ZzBEd2krTkZoSHg5dlNkeTFrMVU1dkpYRFB4ZTliMFNLL1NWZGpnekZuRDhr?=
 =?utf-8?B?UnRWUHdCdUxuZGhOMWx2d0I2YUg0ZGdtUTk3U3ZGYnAwT0YrV1M4VGhCQ3Rv?=
 =?utf-8?B?VGFCVFllVG1FQlNlZnlYWS9LNW1tVGVWZ2tGd2pRVk9wazhGbVFwcmhBd2Nr?=
 =?utf-8?B?anhIMmlJRDBPK2RmTzliZHBjYno5VEhFNnVlYmVzVktYTDBGTktwZ1ExenNZ?=
 =?utf-8?B?RWg0ejJpTnpzcmtSbUkveEFob2RUaE95Z0hiYnQrcWRZS3VPTnR0QVowQ2VW?=
 =?utf-8?B?ZDYwQW9LbjhGajM3dC93U1ZrQzhvTkYyWWExdG1vRGI3aUxmV0U5dXg0WnVQ?=
 =?utf-8?B?QnoxWUdxTlhYaGNqcjREenVSS09CT0p3RTZuRm1obUhRcXJLMVVjeWx5WGJZ?=
 =?utf-8?B?SitGeGgrMXBoRHRnSWppNGFLOFgvaDJmUkgwL1VDRExLc2dLZ1NqOVI1MWVO?=
 =?utf-8?B?cHBJUHoyYS9laXJwTXpNcjd6bjJrWkNsNEd1OVJXTVlyNExhcXJ1WjJ5T3U2?=
 =?utf-8?B?Y1hxVDdkM3FISFBvMHZVdDIySkJhSWlFdkRRS1hNMzZYbGlyNkNjY1J0dmpR?=
 =?utf-8?B?RXhySXgweTRPZXpoczArL2VWRmgwanBtMDBVWU82WXlqZlpLVEFDWDBnQ0Vs?=
 =?utf-8?B?ME1tZ2ZwbmoxcGcrZTlDaUx3ekFtdEhPUTVMdWNEbUJxZGw1YmRtSXdKSE1T?=
 =?utf-8?B?MTJFQmQ4cVdUcnAxMkNQeTk1NEE4RGVHZzVWUkZEeEY4NXM0eHlVUitKZUk1?=
 =?utf-8?B?d2phUXVlRjI5T3QwV3VPOVhGTWQ1UGpESGxtWHFZZ1E1UGZuYUsra0dhUjN4?=
 =?utf-8?B?RzZxMjlOMEoyZSsvZ2FFNW9IdFA2bGU0WjA2MjhQdS9NWVdwcElZN3FMQm5w?=
 =?utf-8?B?VTNxVW5LWkRINlhsd0hLZ2RXaEhYcTN2NjZET3BsMWRKOExZTXdSQVh3WUxF?=
 =?utf-8?B?N1ptaE96NGJGdkpOdWZ4dGdGS3czM0NHczVCdUVmWWRFVGhDVDdGQUNpdXNs?=
 =?utf-8?B?NDBqZHBJSlFvNEhrS3c3d1k0dnQ2MEU5SWR5ak5HWDJMWTNvbEV6SXpSZlBt?=
 =?utf-8?B?d0I3RXVTL0xUcnNhOTR1ZlVxQnRVZnlVOVc4emdzbEd2bFZWUy9DZ0FlblZD?=
 =?utf-8?B?bU02bGM4Vk9tUHhaaEY0L0tVeEVndm5aODB1dmZWai9VYXFpRFd3NkJ4bk5Y?=
 =?utf-8?B?YmpXTnhJNlhkQ1VHMDJOcGxyVGVZS3ZYV3htWjB0cDVHd1BJZ1hHQnUwUVdj?=
 =?utf-8?B?eFA4enRDZ0tnM0tIWWhvdnZqNjNLM2Fydjk1ZU9YNEIyejBKWjRsckZ3b3Ex?=
 =?utf-8?B?a2p0UTQvME1kVml2WkcvTTh2VnJmM2RVK1U5Wi85cWdMdG92QWM4K0pwVndX?=
 =?utf-8?B?RXUwZkthOVdVdGFjVWVpK1ZZcjFoZk92bGYzZzNqUTVNTG5xTnhFVmRIYmpK?=
 =?utf-8?B?WTdPNXQ5RHBuM2w1Zjg3RlNHVlNPaVN4Y2tRbzlxN2FPU3g2UjFjYmRZNENw?=
 =?utf-8?B?VWF6dk9sbXFTODNmUG15NW9Obi8veEIwbHdXUm8xMEEzNW82OUI0WUJiTThm?=
 =?utf-8?B?WXJOTmR4dFBZV1QrK0ZZZjlkV0FlbGxad3NycWVLWWNZeWlnV0duNTBoejUx?=
 =?utf-8?B?T2hjZXlmMThtY0ZFWHpnZ3d5RWtEdE5PK1hQK3BiTWdTT1drNmIwM0tWR09y?=
 =?utf-8?B?dTZGaVMxZTIydlIxZ3lvdlRsSGUvZCtaeHA4S0FHZi9XYm1zSGM3U1dnZ28v?=
 =?utf-8?B?eEpBcmZveW9zTmhOaDNvQzY4ZTM2VzRoNUZTVFM3a3NWcVU0R01BdDBBc0g1?=
 =?utf-8?B?bmtPQUtaL3MvWWxya3ZwU3lsY2VtalltYmdwOFprb2EwcEtTdGRrYlczU3k5?=
 =?utf-8?B?b3dMa0Zpb1RLdkhRVGl2OVA0dG13UnVoK1BPOGhRUzZQOWtTc3FCZUtKeFNI?=
 =?utf-8?Q?rkrXkLaYwShLbvrZjsW0k7FGi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71B0CA2BA0F5DD45825C604A36F4DB3B@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a8f7ce-c763-47f3-4c28-08da6a52dc7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:22:14.5070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XpuCVabBzWzZZd69+12FnTuixN3SKh+yGIn2KtZr7bOZhQtEWWrSEDF41a7h5R3dWD1Uv80+S+kzzvLz6QsGWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR05MB6706
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA3LTE5IGF0IDEyOjQ3ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgdm13X3VzZXJfYm9fbm9yZWZfbG9va3VwKCkgZnVuY3Rpb24gY2Fubm90IHJldHVybiBO
VUxMLiAgSWYgaXQNCj4gY291bGQsIHRoZW4gdGhpcyBmdW5jdGlvbiB3b3VsZCByZXR1cm4gUFRS
X0VSUihOVUxMKSB3aGljaCBpcyBzdWNjZXNzLg0KPiBSZXR1cm5pbmcgc3VjY2VzcyB3aXRob3V0
IGluaXRpYWxpemluZyAiKnZtd19ib19wID0gdm13X2JvOyIgd291bGQNCj4gbGVhZCB0byBhbiB1
bmluaXRpYWxpemVkIHZhcmlhYmxlIGJ1ZyBpbiB0aGUgY2FsbGVyLiAgU21hdGNoIGNvbXBsYWlu
cw0KPiBhYm91dCB0aGlzOg0KPiANCj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhl
Y2J1Zi5jOjExNzcgdm13X3RyYW5zbGF0ZV9tb2JfcHRyKCkgd2FybjogcGFzc2luZyB6ZXJvIHRv
ICdQVFJfRVJSJw0KPiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmM6MTMx
NCB2bXdfY21kX2R4X2JpbmRfcXVlcnkoKSBlcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ3Zt
d19ibycuDQoNClRoYW5rcywgRGFuLg0KDQpJJ2xsIHB1c2ggaXQgdGhyb3VnaCB0aGUgZHJtLW1p
c2MgdHJlZS4NCg0Keg0K
