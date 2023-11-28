Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27E7FB7F2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9048110E4AE;
	Tue, 28 Nov 2023 10:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638410E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:34:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AS5sBKU023885; Tue, 28 Nov 2023 10:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=eHmgkdZ/mkEHSqUqQOyWZldUJyz/ewY510vr36EayuE=; b=
 uBeCX54k8kCYTreg8skAeR2tVGvXwAkUSxMkcgNBfWtR7hUoiRA2GT5/Hyo9x/AQ
 DlruDsHLMgXOiBFiPL5/X5FFQriC6Ijsk19YE14dT21XTTY0iPxzE+wckvimq834
 8VLX3lDbI+rCB8KHAbxeR8ufNlcERgoBZgfNA6nd3/wP/vkJeqfcNGcMQkWo/BDu
 1m3IyLbOhC9iFGPAduNW5Se77aevYEYU4E5X3rRYi5pcNX2GIjQt8hnZjTkRE09b
 IrQKXUOUkm1VMHBnacKq3abrD194stiHJ3YWNUlYiBJU9WO3GIfKWlA7oEHZDe/k
 mjslQkzMBN26ocdWS9wnug==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uk82sj1dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 10:34:13 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:34:12 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 10:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nveE3RvyDJPtCt1sGX8kRwwGFgPl6+Psep9yNP6XD968fu/J4+9KRusz5Smnu+zCb0b1i3xjxmyRTF9XHT5uo2Mg1EdODqoynB1WYETwKlB7r7xJ0GEMM4ufWJnQwmIfpsYT1CIjJNFng8D42uNFNGbD6XVxdr4N5+qh6k3TbL5w2ri8D8AXG7REUNhWvDQwwe9nsemOX7+++QlHxF47PCWwWeHeJEOATc/Ok/CYvZBKwuYBEpbF4F9mNNUhm63OsbyfIC9i0d4A1nsvBMVhsdlNaeRCr495nKygab2qZxVghZlBzSRcpMvsz85Ygre7gLTipkBNe6J0h2PJd3gGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHmgkdZ/mkEHSqUqQOyWZldUJyz/ewY510vr36EayuE=;
 b=WMi7x6tkLwkZuW9gBn8uiyeiPuH2PQKzdI3UZQ8Uvm+MAaRNdfXzD8mIoB9E0svfeQEK6zsMMSF91BjNDfHm+KVQwjac5SnMFhYAGX70sD28dxyuA2fIeT9JMXfdA5YOaLWAsAQAH1cWh+aic65sepg3cUFNZnXmVth7sKcSHnwtMwpYH+AibaqVC32Lp1KPCnu0F3Yo/5smxliWvCSk6ilk1Ny4kV1Q/jCP6cAk8pXxW1LN09cgDvhJvEyhTJ434gFs/4CW4lpR0m0EmCNp7Q8VmbGNkjbEmJLgDvAqrw2plgMslMEEbk1rkrxTk38U/PTZ/0Cdjx/yPNrQAMQbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHmgkdZ/mkEHSqUqQOyWZldUJyz/ewY510vr36EayuE=;
 b=FCLeaE6BIao6P5G4K1K/Iozy/2cR5xG+pTgBF/JZb0Wk5nBeoi42R21JPzZ1jDRFcknmDDeW4EI5xCYUI1fYvVSSb8PDgkwduz9zgrjj+eaC/w4G7x67LuSiV3sLVB0epAlyGofcTxv34oTi2l607rmZdc8hiFSjj0YC877tWV4=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6036.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 10:34:05 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:34:05 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Frank Binns <Frank.Binns@imgtec.com>, 
 Matt Coster <Matt.Coster@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [EXTERNAL] [PATCH drm-misc-next 1/5] drm/imagination: vm: prevent
 duplicate drm_gpuvm_bo instances
Thread-Topic: [EXTERNAL] [PATCH drm-misc-next 1/5] drm/imagination: vm:
 prevent duplicate drm_gpuvm_bo instances
Thread-Index: AQHaHy8jvfAfytBNh0Kc6nTAoFo1JLCPjnOA
Date: Tue, 28 Nov 2023 10:34:05 +0000
Message-ID: <f319e839d4f51c626e36aed6c6e89539a4bde7ee.camel@imgtec.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-2-dakr@redhat.com>
In-Reply-To: <20231124233650.152653-2-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB6036:EE_
x-ms-office365-filtering-correlation-id: de8897a4-7b7d-4073-fd83-08dbeffd8bec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ax37hhbk29naWVcuwYp8vFm17EtqeR7vPdHjgaOJw6DOvOl0aDBVP+pzTJjOXM6//S6JQ60SW9OnmvYsxOX0GFfQwe7+yniyf8UfoPx9q/IQvt3w2YuzW/HQiu6Ym1DdDo+EKizbyhsNDX1LKIcyAKTnxCmS+WSiEfCJjrKPkKOSmU0TXRkZXRMJ4Kafv+XVMftYP5O3OpVsCk5ImSipb5tFuqyqFD/EidJBzB1s5y+pqXG0hmv3l7719yS6gjxSjU3WB+FnrXDotw0R4ULmivfk7uPSeAmmKUIUMEbxfjI2w7pfm16N93/sqnmKdkiqhj+6f8WKKoJCKqIjF3D8uO+snffBTR9evXUNjI1Yx9Cf2qcSIJ/ks4SY6uwCL68gipWF9yxGcdCum4I9alzepMGjujTr8gAReF8bRp1sqFlwpI1qqXGkfqVCTAOcivrClzjcMOcr3k/1tfomawq9/6T7XH4s1alng1V1YVzuie0W0loY00JrAHWeNxEEZn1DBSYcGJFyTy6naB6D0xAnfSFzrb7CoTCml1d/CyZIIzG0kP84y96Kk3pM3VzbCVndGDpFFwPE0NlkvguwRNnbpfqXioRnpVKIjf9J8v97SLXWzOYiZuOHwSbgbg45obWcW46DqzVBbnYQ52BaKOSzOxEPcnGlf4MbNZxtLkr2d64=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39850400004)(396003)(376002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(8676002)(91956017)(8936002)(5660300002)(4326008)(66946007)(64756008)(66556008)(54906003)(41300700001)(76116006)(6636002)(66476007)(66446008)(316002)(6512007)(71200400001)(6486002)(478600001)(4001150100001)(6506007)(110136005)(26005)(83380400001)(2616005)(2906002)(38100700002)(86362001)(122000001)(38070700009)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkllalRJVS9RL1NSNVVORmhvNmtScTgveTAxQ04ydW9OYVJYUUJTc0tSeVpp?=
 =?utf-8?B?SWhMNVRDWGt6SnR6V2tORzVTanFzaEpXdkJpV2EzZnM1cnJPWVdwTzZZUWRN?=
 =?utf-8?B?RGMwYkI5cjVNbjNvMnJaeGNlZ0hIWHhMc20rdStZVlQ0ditrRkwzMnlrMDg2?=
 =?utf-8?B?dzdKNkhVMVlGZG92Ui9VbXFZVUY3clR6eVAwVGxWaW8wSWMwVFJLSXlod3Z3?=
 =?utf-8?B?RzkyaTE0OEpBZjdqbGYzaWxnZ0hRUzRhS3dsTzNBS1VDcUNlM1k1K2pFeFVS?=
 =?utf-8?B?NVlLWWZ1N01EejlKWnBCQnpKT3NqdGRaYTNoeXB3amo1SDBqaXBkYkZ0Mkpm?=
 =?utf-8?B?OGFZZEo0OUxHc1JtRzVybGcvM1lDQW5JTmZjL3AxcDk3WVRodmF4QWRZZHJh?=
 =?utf-8?B?U0xzM2tveTF1SWFHeFR4NC9RNmRGQ1NlYmpZRVkwdFVYdlBETWMzeWZKMWNi?=
 =?utf-8?B?SzJRSHYrVjViMFcrQlh0dXdQeGFNSjRoL3JBZGozcERlOFZaSDZFMURXdjZa?=
 =?utf-8?B?UXBQaDJheThUQzhjSXRSVTI3YzN1VnlLSnVMVWN2c254YmpsTUNkb25MK2Jq?=
 =?utf-8?B?K1h6aG9VS0Rac09mR0ZxczlJTEJQSThTNHp6K2lEaFRUcDB4Z2I4V2xsTS9x?=
 =?utf-8?B?QUtSdCt2ME9EdkRTdnpsbGZFYXoyMTEzVG52WlFQcUlGYkljS1ltV05jQWMr?=
 =?utf-8?B?OHBPbnJ3RnpqUFMzNUJWKy9aYzgvbGVCTFBDLytGNEtVZGRnelIwb0lpL3lZ?=
 =?utf-8?B?MjczWlBKRkRxTFJiWk9RZkxSeXdTdmpBNFViVlJMM2ttRUpvUTdzOUtlN1hh?=
 =?utf-8?B?L3UyNUtwOFZETTYrZmU0SEs0bVB0eUQ4NHU4Rm5ZQmFlSVp5YVZPWEZJeWlZ?=
 =?utf-8?B?VXcyaVJjTDEzbzZEVi85MTVFQjVvSXFyKzdiQU1Lc1k2VTdOYU96cVNpQjhI?=
 =?utf-8?B?a084Nm0rS2VuVDQwVmJWNWZIWTU2Y1RGdndFaHI1Qk1MUm5vKytJNEU5d1Va?=
 =?utf-8?B?SFQyWlEvV2dKUjVPOVlEQ0hTcVA1cWFsMnorSDk3VVZWdGZOT0ltWHlud1p3?=
 =?utf-8?B?U01UU3hJV1Y3T2VTbm5tZFQ1UmxPbW00djlZQnBpWGFDTEl0Ynh0dmZWWi9h?=
 =?utf-8?B?SDh1dFdhKzZpeEJIQ3FWWTl4ejQrTHdMWEdyREZ5VUpheXZDcGZ6WHFEN1BI?=
 =?utf-8?B?dVM4N0x6cXA1STVUQUYzUjVnZjcyZ0lJQllSQjlia3VqeUlRK3ArbXVOYmtE?=
 =?utf-8?B?MTlvT3lodnIzakJJeGJGaGNuN1pwT1FSMXBUbXhjU05IaXI4NDRqb283UlJp?=
 =?utf-8?B?bThJd2Jwc0VqajMxZFdVNjg1MGVoQ0pET3lOQ2NjR1BXbU1JSDJ1aVZlRTZ0?=
 =?utf-8?B?ZnE4c3h5Tm84a3VBdE1RWnVKVi9WYWFIU2R2R2xDTmhQU2VGbFRWNUkvenFj?=
 =?utf-8?B?VHQrV2U1SUpGN1lkQnBHY3gwb1lUWW1WMzZZeENyWWpyUW5BdDJsTGF5ZDZ6?=
 =?utf-8?B?NGEwc3JhRzJzNHFUVDUrNjJzRTU4elg2SlJhcjM3ckRSSkFjcE5qRmlBZktj?=
 =?utf-8?B?ODNyc2xONWg3OGRqVmphK0FlN1dxRk1ET3krS2lTalNMaHN0b1pLaWF2ZGhZ?=
 =?utf-8?B?cFcvSTRCODRSY3V2WEU2SjBBTGFqblhpWXZYTkxXS09HSi90R2M3WldDa3RU?=
 =?utf-8?B?TnM0bXhqV3pTS3pvdWxkajdkRlduY01COWtxQkFPdkhTdDAydi9XKzQ4M21z?=
 =?utf-8?B?R2ExZUVZRTE0enlydzNjbHZyMXVFOUZqMTZUalRFTEtnbE1wcktsRkJlV2Jp?=
 =?utf-8?B?aWZMbTdIcU5mY0Q2UFo1QlZHZmV6QUdwU2ZaYy93SG0vMEw0bUhVZTRITmZS?=
 =?utf-8?B?Q0MyeDhwaFZkcHNvSTF1OWNQQ1VSOFhEbnR0UGdraXFzODYxYXQrSDgwTURS?=
 =?utf-8?B?TWNoeC9KWnNOY0t0Nm80SFRHbXp1UkR0ckMwQnNvS0hGQkQ4RVpXZm5DTEJG?=
 =?utf-8?B?NnpiWHpDU1oxeEFia2tlZ1YxWFpKMmRBNkZ6NzVGSHBxbzRyM3luMVJVWnNH?=
 =?utf-8?B?aEFEUGhvWEsvTTB3bHR6NlJoMG5VL1B5OVh4RFpuVmttc0FOWlBORTIxMHo5?=
 =?utf-8?B?emhtbytZb1VkSUhBV3o5M3hKM3FvYjBKeHFyQktKVXlVWlFLNVFGOUx4RHBo?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <332723FE97ECC8408D226C920EEAAA19@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de8897a4-7b7d-4073-fd83-08dbeffd8bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 10:34:05.6148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GkcgERiZhElhkIZf9ZVC/th8riZwdC0erdpZucL0BiSAnmNolECrgUeUYuczZDyJsWWhdHaugzU7gWuclu2FdBRNTdXkONxWN/Q2WktHonY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6036
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 2JWhvHKkKmMAwjNHdVHHaKJzPNQaZ_Ij
X-Proofpoint-GUID: 2JWhvHKkKmMAwjNHdVHHaKJzPNQaZ_Ij
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWxvLA0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGlzIGZpbGUgYWdhaW4gYW5kIHRo
YW5rcyBmb3IgY2xhcmlmeWluZyB0aGUgdXNlIG9mIHRoZXNlIGZ1bmN0aW9ucy4NCg0KUmV2aWV3
ZWQtYnk6IERvbmFsZCBSb2Jzb24gPGRvbmFsZC5yb2Jzb25AaW1ndGVjLmNvbT4NCg0KT24gU2F0
LCAyMDIzLTExLTI1IGF0IDAwOjM2ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3RlOg0KPiAq
KiogQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVzIGZyb20gYSBzb3VyY2Ugbm90IGtub3du
IHRvIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcy4gVGhpbmsgYmVmb3JlIHlvdSBjbGljayBhIGxp
bmsgb3Igb3BlbiBhbiBhdHRhY2htZW50ICoqKg0KPiANCj4gVXNlIGRybV9ncHV2bV9ib19vYnRh
aW4oKSBpbnN0ZWFkIG9mIGRybV9ncHV2bV9ib19jcmVhdGUoKS4gVGhlIGxhdHRlcg0KPiBzaG91
bGQgb25seSBiZSB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggZHJtX2dwdXZtX2JvX29idGFpbl9w
cmVhbGxvYygpLg0KPiANCj4gZHJtX2dwdXZtX2JvX29idGFpbigpIHJlLXVzZXMgZXhpc3Rpbmcg
aW5zdGFuY2VzIG9mIGEgZ2l2ZW4gVk0gYW5kIEJPDQo+IGNvbWJpbmF0aW9uLCB3aGVyZWFzIGRy
bV9ncHV2bV9ib19jcmVhdGUoKSB3b3VsZCBhbHdheXMgY3JlYXRlIGEgbmV3DQo+IGluc3RhbmNl
IG9mIHN0cnVjdCBkcm1fZ3B1dm1fYm8gYW5kIGhlbmNlIGxlYXZlIHVzIHdpdGggZHVwbGljYXRl
cy4NCj4gDQo+IEZpeGVzOiBmZjVmNjQzZGUwYmYgKCJkcm0vaW1hZ2luYXRpb246IEFkZCBHRU0g
YW5kIFZNIHJlbGF0ZWQgY29kZSIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbmlsbyBLcnVtbXJpY2gg
PGRha3JAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX3ZtLmMgfCAxMCArKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
bWFnaW5hdGlvbi9wdnJfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0u
Yw0KPiBpbmRleCAzYWQxMzY2Mjk0YjkuLjA5ZDQ4MWM1NzViMCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfdm0uYw0KPiBAQCAtMjI0LDYgKzIyNCw3IEBAIHB2cl92bV9iaW5k
X29wX21hcF9pbml0KHN0cnVjdCBwdnJfdm1fYmluZF9vcCAqYmluZF9vcCwNCj4gIAkJCXN0cnVj
dCBwdnJfZ2VtX29iamVjdCAqcHZyX29iaiwgdTY0IG9mZnNldCwNCj4gIAkJCXU2NCBkZXZpY2Vf
YWRkciwgdTY0IHNpemUpDQo+ICB7DQo+ICsJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBn
ZW1fZnJvbV9wdnJfZ2VtKHB2cl9vYmopOw0KPiAgCWNvbnN0IGJvb2wgaXNfdXNlciA9IHZtX2N0
eCA9PSB2bV9jdHgtPnB2cl9kZXYtPmtlcm5lbF92bV9jdHg7DQo+ICAJY29uc3QgdTY0IHB2cl9v
Ympfc2l6ZSA9IHB2cl9nZW1fb2JqZWN0X3NpemUocHZyX29iaik7DQo+ICAJc3RydWN0IHNnX3Rh
YmxlICpzZ3Q7DQo+IEBAIC0yNDUsMTAgKzI0NiwxMSBAQCBwdnJfdm1fYmluZF9vcF9tYXBfaW5p
dChzdHJ1Y3QgcHZyX3ZtX2JpbmRfb3AgKmJpbmRfb3AsDQo+ICANCj4gIAliaW5kX29wLT50eXBl
ID0gUFZSX1ZNX0JJTkRfVFlQRV9NQVA7DQo+ICANCj4gLQliaW5kX29wLT5ncHV2bV9ibyA9IGRy
bV9ncHV2bV9ib19jcmVhdGUoJnZtX2N0eC0+Z3B1dm1fbWdyLA0KPiAtCQkJCQkJZ2VtX2Zyb21f
cHZyX2dlbShwdnJfb2JqKSk7DQo+IC0JaWYgKCFiaW5kX29wLT5ncHV2bV9ibykNCj4gLQkJcmV0
dXJuIC1FTk9NRU07DQo+ICsJZG1hX3Jlc3ZfbG9jayhvYmotPnJlc3YsIE5VTEwpOw0KPiArCWJp
bmRfb3AtPmdwdXZtX2JvID0gZHJtX2dwdXZtX2JvX29idGFpbigmdm1fY3R4LT5ncHV2bV9tZ3Is
IG9iaik7DQo+ICsJZG1hX3Jlc3ZfdW5sb2NrKG9iai0+cmVzdik7DQo+ICsJaWYgKElTX0VSUihi
aW5kX29wLT5ncHV2bV9ibykpDQo+ICsJCXJldHVybiBQVFJfRVJSKGJpbmRfb3AtPmdwdXZtX2Jv
KTsNCj4gIA0KPiAgCWJpbmRfb3AtPm5ld192YSA9IGt6YWxsb2Moc2l6ZW9mKCpiaW5kX29wLT5u
ZXdfdmEpLCBHRlBfS0VSTkVMKTsNCj4gIAliaW5kX29wLT5wcmV2X3ZhID0ga3phbGxvYyhzaXpl
b2YoKmJpbmRfb3AtPnByZXZfdmEpLCBHRlBfS0VSTkVMKTsNCg==
