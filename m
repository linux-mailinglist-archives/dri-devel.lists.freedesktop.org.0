Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E97378699C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6E210E4B4;
	Thu, 24 Aug 2023 08:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A23E10E4B4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:09:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37O6gTvr018679; Thu, 24 Aug 2023 09:09:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=0HX+znAXSuBfZ4Z2J0XC0lddMI3SP6CUwFgOUevExYQ=; b=
 ZbxMSCEcZUi7FfxI9pLv7qgE6vRxJoLeKd6M1h/At0KjkQnn6pMFaEnUvL9+yuma
 t7oySB/k6W9WSvgZ0vmJ/PohwwIWo0+srxUm1qBCwsBvjAu3+oDMA35mK+2fcpRY
 pcabi14qqVXRkx63oIi35ezxlqpIYmGwOX8KcvVRGMCWyw58igFDKhAX5tsOooxr
 95JlrMxG7b7AvFBFFPSSeKuSq2cybP5W/MniuOmvvwbe9Xh6WutSpUwe/oQpkNnF
 17M/CqUPngU7/ckAR8O4HSwcgNAgxbqjuSC+/XcMnRVkI/AWha2xNiaIKHAmiSId
 eAIP7AsCKJqOD2U08bSGVQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3snw3bg78c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 24 Aug 2023 09:09:02 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 24 Aug 2023 09:09:01 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.52) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Thu, 24 Aug 2023 09:09:01 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHEKS228B/QMOEMynAmOw88vunWGjEQK1n2j1uiAHARnj6WnJ4FN+5H27ZuCp74mhSHGHkH5IwobTRsgLVQerUW6a8xDrvtOPsETK//Ys4D/4c4M2SxRHphMa3RsXtMCY129kzrlHEvowNcbPQeb19nwjjhLgtBe+B9yd2zRQZD7hNqvt+KtJ/esh2syvZwLRCXRZp6stIJZwt3b9UtU+sM3AnAM0Rq7g4N/HC2OVETpq/oEZz0I7C3Ow8iOvl+IeptQOOHYeUSwY+FXL8lbV+ajlgo+pvdv50mOsWcTEL2A9lWCpSJP/ed8zIUd46MGKzDHc2opUN38qnqHp8G1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HX+znAXSuBfZ4Z2J0XC0lddMI3SP6CUwFgOUevExYQ=;
 b=LqAej2JWcfXrYacJtcIU2yyhF+2V+MPDgk3nde2SMrNpxIOvbPOlSmZt+/Jy9EAET0z9ZexHArD8KJkcnrksTJay2ubPPV7/8Wwt4uQCJj/8pJx2p85sgmsIym427d68c+Oh6PTNXE5qsZJrhN3Rnt6ucw1b87PxlQd2wWjUIL7/VzmaPin5+8B6A7QYHiziJRQWaGuQ5F9UwHl6W3jUT5UmJBvY/vPNoOpWuDtdWc/rQp1UjlR9NWZJvNIPfbJsBboEpBXr2pbZJ11OKUcTzCtnXnKhzKNX47x5iKnK3aFtSoU+CIub1KvQ3zlAH4O380mLdlThjPobe9FEDtkyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HX+znAXSuBfZ4Z2J0XC0lddMI3SP6CUwFgOUevExYQ=;
 b=pZkANy/L8pGSxP7HREeyTCPitDIwi8EXe4nCqUVy641ocYVnoUxonYkhDMQUtLb7nu3vfmGf2h7lZegDwZqnmarZzt105oqblfcwNvJBR0C/8UppyPtX4NUfTibV/DMgPs/mhoJKqi1HQTskYdnHS16vPhj9DGjzt5W40L8E97U=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO3P265MB1930.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:102::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:08:59 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 08:08:59 +0000
From: Sarah Walker <Sarah.Walker@imgtec.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: Re: [PATCH v5 00/17] Imagination Technologies PowerVR DRM driver
Thread-Topic: [PATCH v5 00/17] Imagination Technologies PowerVR DRM driver
Thread-Index: AQHZ0BtDfpzVTCaduUicOr+1137Z36/4gt6AgAChY4A=
Date: Thu, 24 Aug 2023 08:08:59 +0000
Message-ID: <315242e09345d492724ab115e931c667504842ff.camel@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <CAK7LNARQZjudwHe=u-Q1_y4HwpeamL-RiMnJ3fcPy93gaeQefA@mail.gmail.com>
In-Reply-To: <CAK7LNARQZjudwHe=u-Q1_y4HwpeamL-RiMnJ3fcPy93gaeQefA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|LO3P265MB1930:EE_
x-ms-office365-filtering-correlation-id: 09b577ab-c66b-48ce-a5d4-08dba4795f34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 98LpB73wutPrGEsMyzdBTrzNX31xTxjCeA5o2eKlqaGaetGWuHXHPu4hjUkI8Yyfh+OSNVpPW31HZpkJYEwNdr5ckofweTdhtIew2kqZwHBr32cNqJUABYvXZ0P8Jh1rJZwCIgwg8bk1aB4wsnS/taceI0YuTfjlrFEuBWbwApGEfFH6xBsc2st2Kk0f4POvGbTadfWeO3rao2bLxyt4AOGJ+8cvbSMOTSLqF+ddSTiN0osMPDPGp7d9w+s1ryHDxc+F7J3IzVu0JmYm0VO0vy2pzp0pgrZJEA+a2OcVsVBSb61NTcbIuD+5XB7iu9Ns6l3xV4/wHpbqW8xRZ37riJqtT/Vhg7THjH4m3uNO7siqE7g9RKnXYaqAGF8KuQ15I39bZkkj7j1BvvOtmm07ihA8fietQ0B3qnuxBAuDWluWYidy4OnDqqfZlBTxRDJZLEEq/KdoZ90BSCU5PgCILpEO3OWQ3x4q68Dcth9hg1foWNrr/o3jF2lUtGCmKEq4k824algu044csY49BGKvVp/dUUqc/gUvJ2HZJLIwO52c4d2ux2NcrI+V3BLgDoggowFdtsb6eHh8Vt2D2aSmNLwHr9Wtg3R0LH7zyL/LDwkmPH3DAM2FySBa/HR+r6+O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39850400004)(451199024)(186009)(1800799009)(66446008)(64756008)(54906003)(66946007)(76116006)(66476007)(66556008)(316002)(6916009)(122000001)(478600001)(91956017)(26005)(38070700005)(38100700002)(71200400001)(41300700001)(53546011)(86362001)(6486002)(6506007)(2906002)(6512007)(4326008)(8676002)(8936002)(2616005)(5660300002)(7416002)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjgyTUNYSk0zM3NTa0txN3Y2NUE1dE82aXIrcnhNWXkrc3FkRXh6SUhCa2NL?=
 =?utf-8?B?TWRvRnJIWEZTbEQ1Zmt3UDY0WFF4YUMvV2lEUlVCVFJJYjN6OEJGQlVsZjVJ?=
 =?utf-8?B?TzROVnBYZVVxd3BDVkd2a2xUdk13S0tyRVpTTUlHdEQ0UGtEOFZWcVhHa3ln?=
 =?utf-8?B?T2E0blk0clBzRE9CK3cybmRadlcwcmRjQStHdnFrcGFHZm1OeUtValBQdVBX?=
 =?utf-8?B?bGxSNkpLbk8vWTI1R3duLzNuZHhTeE9FUHVncVVVQTJjNGF2V0MxdVV6YUNi?=
 =?utf-8?B?VGpiMy9lTFRuL3ZvQm42WUFIWHhsMllOVjloK3k0MnNxaFRCd1dETjlJSHph?=
 =?utf-8?B?VXFBNmZheGR5RExhV0JsWnB4Ym40bWpHaFd4YlpYbEFVTkVjZnBZOVJWOHln?=
 =?utf-8?B?MklLYVhrTjgra3YxZU5EZmxmSzVkUXhNQUpjdW5WSndnczQ5M3IvSC96WG1m?=
 =?utf-8?B?cmpzaThxZm96VVJ5ZmZDd1lFVGhSMGlHbW9xUkJpd2RKSmJGd3dnZjAyOU40?=
 =?utf-8?B?bVJUVFlRTEY3MXcrQ3VWRTlsb2xqOWxUcy8vV0p2dXFRaWhFejFUSVhCUno2?=
 =?utf-8?B?aU9mdE5ob2tIRGJFSzlmYkZlVmFDOUpCQU5jOUhwSDhjUmZFcGZTZTYrSVMx?=
 =?utf-8?B?b2RES0hXaStweHMxWm5JYXlKTG1ETGZOMVZYVzhMeXVlS0NZOGgyQjdIcjVu?=
 =?utf-8?B?NWREUnBMcXdYaVBJbm1PREhGaElDa2JxbHhSVzNPV3liUlRmL21BV0RMTWZL?=
 =?utf-8?B?WmhycFp3cFpYNUJvekNhKytRdFYzT243ZDREUDJveEZBMjJQaE9KbzFxY01h?=
 =?utf-8?B?Y0dxVEYreTZNTlorcC9QeEVockxNWHpvQndTb0FUNnpjZ2RRQXV6TlFoWFJh?=
 =?utf-8?B?L3JBRDFPblJCVVV3SU1KOWhnc0toVVU0WnNrWE9rNGF1MWM4WVZlanM1dUhi?=
 =?utf-8?B?RExveDdGTWt5SVJHY2N4bWhMNWx3L0NwWWVjUVBnNFBieVlmSUU4cTlQZEx6?=
 =?utf-8?B?cDdCR29nV1N5Z0ZESTczTFQwbVMwUWordDBYQTFkOHFjUHVjVVVUR3hob1hp?=
 =?utf-8?B?bFZabGZQQnRGZ0tUVFZEc0JmL2NISnB6WU54T0ZnVVRVY0JlWUIxT05FdEor?=
 =?utf-8?B?Q28waVpIREFRSGMybVhhRVlRZlhjY0hucG9yN3hjc2lORHlrWmxxVlAvMjFI?=
 =?utf-8?B?SW1yN1hBVFh5U08wenJac0pTMnpocXVDM2laUHIyUnE2bWRpVzhhWFUvdlcz?=
 =?utf-8?B?eGVrbWFXemhYWnAxSWNjbEI2cUp4UWxrcEhGMkc5ajhNVFIrQ0l0RWJuZEFl?=
 =?utf-8?B?cmdaYTdvaVA4Z2ZXMElDWnJyT3BhS2JTSk52WWJ6QzQyL0RBaURZbCt5bSs5?=
 =?utf-8?B?OXFhRjA4WHgvZFFLTTlYU1VCb3RxVVBuaU5yMDBXUURWajEybDBUa0dEdUlR?=
 =?utf-8?B?V0J3WVNkZHNyZGV0b0hxOVhxUlE0eHF2Vm91ZG5mV2ZjQ3dzOGJveHY0L3Qy?=
 =?utf-8?B?c21QT29mWjdQZEFBYlQ5QzgwRWtKSEs3MW5ZNVRWVllFZHdiZkZWczY1clh0?=
 =?utf-8?B?M2FZODlzdUNsTHp2QVBPdldGVmtsaUpDWVRpV1dhZUZ2WnFVT2wxd2svL0Ez?=
 =?utf-8?B?dmtFdVBPanZ6djRUWjdhZVpXbUppOGNmbE5kZ05vN2ViUU9MaXpLTDRISXhr?=
 =?utf-8?B?a2RsZ0hlcTZSUExpYWUwY3N1OTBlNDlCaHBrbCtjb1M2d1diREh4VGV6ODNG?=
 =?utf-8?B?eUZWQlVvOHJCdjdNUXB0bVF2UFRVc0lnVEtoNDFEbUJYOHhrNk1iUHVVREdR?=
 =?utf-8?B?RlBvcENkVkRXZEhsNkw0T0k2K21OeWJGSENwWEhqcWY2aUJGRmFUQ2tUY1p4?=
 =?utf-8?B?TGtPY3IzT0x3b3I1NEJYZDVEWTJ5RjJCOHRlT0d5STVsN3k2Y1BZcGtIckdP?=
 =?utf-8?B?Q011UXo2TURCc2Z0U3dVQjMzOUNKbWlWemUwbTd5RjJsSWhvd1k1bldCQmxX?=
 =?utf-8?B?ZmNTazNRRDhkTHRQWm93STAyZ1kveEUzSHhoaSswUXNYcTcwRk11WXF1UVc5?=
 =?utf-8?B?ZnV0UUxPTDVUeTJsY2d3OFdURnhrUWFnZms1MHQ3aE82cXJLWGdTVW5Kd2xq?=
 =?utf-8?B?S1hPM0lsak1xVjd5czhYK2NHTUpGbHJiaVpkQ1hXOTUvdXFhWUNHaUlsSElX?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DF84CEF29E04642BE638003B5F2C5DA@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b577ab-c66b-48ce-a5d4-08dba4795f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 08:08:59.8214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zu9W5daoivFLfET99U0R0ez4OB3aAiKJ5+PVlbPZcIELm9dB4pb4nia5VCJ1vcCE6AuwkKsEapfYXZ6W2PUTZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1930
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: yQm-cHba3ox0wfQTlNuESHAB45S4-Uuf
X-Proofpoint-GUID: yQm-cHba3ox0wfQTlNuESHAB45S4-Uuf
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA4LTI0IGF0IDA3OjMxICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
DQo+IE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDQ6MzXigK9BTSBTYXJhaCBXYWxrZXIgPHNhcmFo
LndhbGtlckBpbWd0ZWMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHRo
ZSBpbml0aWFsIERSTSBkcml2ZXIgZm9yIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcyBQb3dlclZS
DQo+ID4gR1BVcywgc3RhcnRpbmcgd2l0aCB0aG9zZSBiYXNlZCBvbiBvdXIgUm9ndWUgYXJjaGl0
ZWN0dXJlLiBJdCdzIHdvcnRoIHBvaW50aW5nDQo+ID4gb3V0IHRoYXQgdGhpcyBpcyBhIG5ldyBk
cml2ZXIsIHdyaXR0ZW4gZnJvbSB0aGUgZ3JvdW5kIHVwLCByYXRoZXIgdGhhbiBhDQo+ID4gcmVm
YWN0b3JlZCB2ZXJzaW9uIG9mIG91ciBleGlzdGluZyBkb3duc3RyZWFtIGRyaXZlciAocHZyc3J2
a20pLg0KPiA+IA0KPiA+IA0KPiANCj4gDQo+IA0KPiANCj4gSSBmYWlsZWQgdG8gY29tcGlsZSB0
aGlzIHBhdGNoIHNldC4NCj4gDQo+IEkgYXBwbGllZCB0aGlzIHNlcmllcyB0byBsaW51eCBuZXh0
LTIwMjMwODIyIGFuZCBzZXQgQ09ORklHX0RSTV9QT1dFUlZSPW0uDQo+IA0KPiANCj4gSSBnb3Qg
dGhpcyBlcnJvci4NCj4gDQo+ICAgQ0MgW01dICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX2NjYi5vDQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX2NjYi5jOjQ6DQo+IGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY2Ni
Lmg6NzoxMDogZmF0YWwgZXJyb3I6DQo+IHB2cl9yb2d1ZV9md2lmLmg6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkNCj4gICAgIDcgfCAjaW5jbHVkZSAicHZyX3JvZ3VlX2Z3aWYuaCINCj4gICAg
ICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4NCj4gY29tcGlsYXRpb24gdGVybWluYXRl
ZC4NCg0KQXBvbG9naWVzLCBpdCBhcHBlYXJzIHBhdGNoIDYgKHdoaWNoIGluY2x1ZGVzIHRoaXMg
YW5kIG90aGVyIGhlYWRlcnMpIGdvdA0KYmxvY2tlZCBieSBvdXIgSVQgZW1haWwgcG9saWN5LiBX
aWxsIHJlc2VuZC4NCg0KU2FyYWgNCg==
