Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E072F722
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8246710E226;
	Wed, 14 Jun 2023 07:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AE110E416;
 Wed, 14 Jun 2023 07:59:06 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35E7UEUK021205; Wed, 14 Jun 2023 08:58:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=zSIkVE+ByIDXunG+a3pC2R+KFnEWdw9c+WFDZwsae/o=; b=
 dha1wZAsldabSGnTqBzQ7+XSS4GtWJbSKI7u5GeM2EvfwgsGt56uPIf0rmi0o7is
 kVcnmB3UyXZDWl5qk0XwnMa9Zfg8vH6CkzJguhjXMczJwKXsBx44sa45Vdoi+Eb+
 V0UDaGZotFr6IZtBKZ2SFLBnPURpSf0lNZzjPyXi05b9MZy+c6gc7xInqKP7wDpM
 9vMGk7PjytrViMs0ZsxN5bMbVVHWapeP0Ynve4ZBKEBzqbEzYCpKuL+BuEvOULbg
 xOQAmc2ym/M5Puxs+IOnYgHnEruP0aJJIC0qkFvL5uRfCrlTD8Ugw/s5JMZJmJ9t
 blgt+ufnEiYonRylbV3pDw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbtgyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Jun 2023 08:58:31 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 08:58:30 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 08:58:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSrPwhE4bmym/+T7aTqzS7gEnQoyL8H9048cUdctyuWlyHCmBgz88ZY38+Rf7j+N0hqGgqYC4JEaakrT+5r5Trmuhy9MQxRETujy4dfc3kPhBmLNnQcm0cvvYTA2W7tQa4NZ4fihYBLdKaXzoBNnWqIRMbgP8vXcwXTLZvhErkwyZiR32BTgJycFy985PUHLgKkAWnfM2jnaHEnZtiI/B3GEKlRC05A1AIAExlFIVcvpAyoO1yl9LRWvhxhSFxV6TdLopHyp/vSaW6Pvm6P3eXX6hPRlEYQu3fGLFIH9ScFfyXDknkU9YhYbUFuHeEHDfneDTfT1sQ6TuCQuimyVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSIkVE+ByIDXunG+a3pC2R+KFnEWdw9c+WFDZwsae/o=;
 b=I9w3/DtHeLe6+Qc+/9xyolV98WqXa08wxIarsDtaFJ9hhBq9b2VSnb6OapaIeH4HLUWyA/rj+B3j6ngNIcefP10fZAaA8Bc1/lMaU9B6ZzZP6+S71LbNQVpI3J/5YPq45YlaYnQG2yxhNrCe6sIbPMrEK2uCoIXLyVApfRPEgaIv2IA4VpmgPzESI4z7IM0UxcQVKM+L7Qt6gYYlCD4SQ2bG5KFkcXRnQDkJcN8lIQdN0rvQHazTUIKJEZCmgOc1qUDSbE3oKpGknVcKHhzdFFa+kc1/khYGeVba6vTrbp9cMmxfjMY4AU+/nZrKOLQaWmpTD64BCzPWIkkr0mcpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSIkVE+ByIDXunG+a3pC2R+KFnEWdw9c+WFDZwsae/o=;
 b=hX5pB63npMzz7gWS3S0TJ5Fm2nWEFRDj6IbjiLGITlNEAOMfvUh5tivrx6fqfqhBgTH6Fml08ecoCuZ8MpYsDYrKUjhEYopVmFWFm+9iSsEhV9HFz93e8i9rgXP1R7AK0ekOXMrXbB3wXr/LmeB4AyS5Rnt6ynb9WYa5J9upQGY=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB2161.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:69::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Wed, 14 Jun
 2023 07:58:29 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ef5:364f:74e3:8522]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ef5:364f:74e3:8522%4]) with mapi id 15.20.6500.025; Wed, 14 Jun 2023
 07:58:28 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Thread-Topic: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Thread-Index: AQHZmMazG2PFLAis/0WnT3tapfBvdq+CYTAAgAZxuYCAASeLAA==
Date: Wed, 14 Jun 2023 07:58:28 +0000
Message-ID: <1cee380fb31e1a2f499e50e6b8771d86a68c1b16.camel@imgtec.com>
References: <20230606223130.6132-1-dakr@redhat.com>
 <f5723444623b41d58f93c3f0ab662e9b37105765.camel@imgtec.com>
 <67ffef18-fae4-cb84-ff75-c4eed92a8755@redhat.com>
In-Reply-To: <67ffef18-fae4-cb84-ff75-c4eed92a8755@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB2161:EE_
x-ms-office365-filtering-correlation-id: 7fa49949-8241-4ee3-9c6f-08db6cad23d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twLdS+YVdvXC3eLkxulc1SuCyOxWsP+JtzXhE2JV3ydm8mZW2gORR3lsuyXJTQtC214xLSa+an40U2Phn8Xq+6OKeNlVVASFlPa45jJ8mdIf62OERbhniz3VzLpiz4ATJd6rL1Z+qXMgQ0/A1X9cmY+qC6wtTy0QIvK1SjGMRyKjPVI16e314OWKizzM3NCri2V1dA3FX89kCnOtbS94p3G+NlGANkEsI0Ed7VhiqjLh0yyd5YEEgw/ZiAui8Wjn3gxzKYMW/TpMUq+lg+RXO4omY5EdsDXqGpmSCczsrs3+FZQ97AdI2BqOm6RXLJkTBoZGxfwEcvN+C/9qWoRH8W8XuatDdC8Ih5ZKc6qRTu5qBoI/ncGGzdfc/3bTFOoPEpmhXEEceffl7f8ZbwcffvDd5Gh1nJ94SsyiADo62R3r+N2AO16xdj0SAbMBHag3bADGVSMsRTRTHXfFPEYW45sDlZXUxxAz7N2S2+/rnqDvCVMKhTDHIvSagpi5KDy0LZfEMOUwQI3eXQodcnk+FjRmF1NXKGe4albPp3j/FWRiD/xUFlhrhGZbVh+WG6b3XZHWMNMbfDA7nVOIXKrWJRTdFDWGXQFs3LLU52GBQfpnh9iC1/bxGzdgMhCdZGt0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(396003)(39850400004)(376002)(451199021)(38070700005)(86362001)(66899021)(36756003)(2906002)(7416002)(6512007)(6506007)(26005)(5660300002)(186003)(2616005)(83380400001)(91956017)(76116006)(478600001)(54906003)(66946007)(8676002)(8936002)(71200400001)(4326008)(6916009)(66556008)(64756008)(66446008)(41300700001)(316002)(66476007)(6486002)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0dveEtHcmF6bWlOdS9FT2J0TUREeUFYY0RXRE9iOFJZVjBoL2w4TmI0eUd3?=
 =?utf-8?B?dzd1SlF2RUl4aUpqbjRCYU13bVBrU2hKTTJqNHZ5bmlrcmtLZythV2lNeEdM?=
 =?utf-8?B?NmtYUmlFZGRxK0o4dGpSRnovQVhhVmduNmNMaGJ4Wkw4UCtqaXFjUjVSdGFn?=
 =?utf-8?B?a0hJWWJhOE5UeWJrVUg2RGRCNHRUYXN1ang0c01EcjFOUGtiTjRscFdzUis0?=
 =?utf-8?B?Uld4aU5YbkYwbHdpQWdLNDVnUUtNWkdUY1I1TXY4dEFZRFZEZEJxdXp0U3p6?=
 =?utf-8?B?S0Z4YTZ2UHc1bEtDUC9xY2dnOWxxQkxDRlBQTjBkZDdBSm9EQjd6SG5kcmFz?=
 =?utf-8?B?dEhETGo1ZlVQWTM1VzdNSjRYZnEyUnFGTWthNCsvaVBZRXFzWmRZcXJMVmZv?=
 =?utf-8?B?VUtvMzA5MEorQ3NpVHNMdW04WmE1cmk2enY0KzJSK3hhYzVhdXp4NCtXTW1Q?=
 =?utf-8?B?NFNHdWV1cGgzSld0VVdEaXAvUlc1SDcwR0RpSFhjVXh2cGdQVHcvZVMxajVK?=
 =?utf-8?B?NEMyTVB6QWVBRXZqbXZHWHY1UW54M29Cb2hvYkJiYjY3OG9TZlhOTFdiUnJT?=
 =?utf-8?B?QlJaUHhvdTNaYnRudzdiYVJFSE1YQi9sZ2VLS2lQa3VPOHIrU2ZFRUJxWURY?=
 =?utf-8?B?YXZUWWkrNCs0dmpJREV6YXRLS2wyUVlaaVNPT0dYaU93RTRxbER4S0JwWWxk?=
 =?utf-8?B?S2J6eFgwK0ZwTjBxOVp5WWhQK2JkSnpqQW1pdTJ6UjBSN2FyaHdwTTJwMVZ1?=
 =?utf-8?B?dE9TbHNIZm1MSmUrdUU1NTMwTks2VytuOHMwcVRsczVTdFB0QytCRWR0K2Rw?=
 =?utf-8?B?QTJSQloxbWhFUWxRVVRFK2ZvZktXS0w0K1p4alAyMUMwd0JacktyYURDOUov?=
 =?utf-8?B?cHRnWXZrSnBFQUsvOURBbitJYi9uTXBoWG9aSFVRRGhWK1Fqb2NTN2RtdHFN?=
 =?utf-8?B?UGxZODlBSUFWT0xSclY5Rmd5aTk0U0NkejBOODd3TkpPKzJwUFFLOGhNdDlK?=
 =?utf-8?B?U0tXbmE4dUQ4VzgrK083dXFsWWZQdnN3VmFRV3pzQVZCWmZRM05xcDdrcXN6?=
 =?utf-8?B?MUVlZ1VuV3JrZnQra2ExZEpibWx1T0g2bVdMNjl6NGRuaUlwY1VZZkZ0eEdS?=
 =?utf-8?B?ck1RODc2L0s2eGtUbjE0Uk9JOGRqVXFGSkswWkViR1hsTzJFc21CZWNBUllq?=
 =?utf-8?B?WmN4SURqYW5yNGIrcHdNV1Q4WUpabDlkb3RUVWNKQ3RUOFVHN0hORzJIOWpa?=
 =?utf-8?B?NytjU1JmNTVxWUt6d00yTWlVaTZoNCtoRDU5bUQyWW03TENMd2g0cU8rbmdJ?=
 =?utf-8?B?VWZhTnhGRE9DQ3hCdEVXVEY2dGI0LzdFY296eGs1VDRjYXFpejVZZ1gwSHVa?=
 =?utf-8?B?SjFyc1d0TkF4TWdvblBFOUViQ3k0Q0V4ZDZQaEUzc3hUOVo0R1FidlBuV01Q?=
 =?utf-8?B?Z2E0OHFHUzJBb1J5UWF6RUZ0b3BKSVJwOWc2SVFoay9iUnZhS3FZQkxWRVFH?=
 =?utf-8?B?ZUpxTW9HS01ZS3RHdC9lRENhek1BNXBzZktZTGtHWHFocVdjRkRDZnBqckV3?=
 =?utf-8?B?a2U2ZjMvYkdjS1ZuS1hWS3JMcitwYVV3QXhiVDViYmFxT0hVeDd1TXc5NEFT?=
 =?utf-8?B?MEdQUkNXK04vT0RBYjBjbWhDYWE2dWZkUjRCRDhUZmUxL1hPZjYrc0Zlc1M1?=
 =?utf-8?B?TExlYWNJMlVLRk5tOURSeG91WDBaTEZvRWJnQm4wSU00a2MwR09jU1JEOTc0?=
 =?utf-8?B?VlJPd2hmNzkwdXhERmNScEpmN3ducWFQYkJSS2pPQk51TTVIQVJndnRtRjdI?=
 =?utf-8?B?MjJjemc2YWJNbThDcUthcjlBcmkxWEVtWHFIc1A3YU9TR3BDUE5ZWmdsemt3?=
 =?utf-8?B?WVFZZzlDbjRLZlpadmxnOFBSbS9nTzEzdDFaM0IxajVoaEhFZlBHT290RmJ3?=
 =?utf-8?B?VUxxOTUxR2ZPK2g2eTlxT1RIMEhJclVHVElSME9vWEdybGxVdkt6Q0ZzcDNY?=
 =?utf-8?B?VW5CUzdUaXczWjA5VjhkczZzTUMvZDRaVHRBUHlpanRINUQ3UzNud1dzQ0dm?=
 =?utf-8?B?bVZxTVd0VldKK3hKc1lkbitHWlR3S04wb3JibHBHcFNzUnZGR3Z1UEpnY1Rn?=
 =?utf-8?B?dUJIbGJ4OEU3a3RHSFpJVHI1Mmc5b3RwV0VnMzBBMGhEQzRaVFdqRk54V2E0?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <791DCF0BD7618841B6DFED92D6878311@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa49949-8241-4ee3-9c6f-08db6cad23d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 07:58:28.8495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6/iuK3LHrGBPwMTvpg2N/aFb7c+A3+te9oucCEmgS0HX+2yyDtsdODMSvR/gFOZz3I43oztWXqgvvJ6yknagb86xXwmSmifnW9NMahaQNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2161
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: qdmiVVgB7gvPkHU_o3PdouHxsG22s0iQ
X-Proofpoint-GUID: qdmiVVgB7gvPkHU_o3PdouHxsG22s0iQ
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
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA2LTEzIGF0IDE2OjIwICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KDQo+IEknbSBkZWZpbml0ZWx5IHVwIGltcHJvdmluZyB0aGUgZXhpc3RpbmcgZG9jdW1lbnRh
dGlvbi4gQW55dGhpbmcgaW4gDQo+IHBhcnRpY3VsYXIgeW91IHRoaW5rIHNob3VsZCBiZSBkZXNj
cmliZWQgaW4gbW9yZSBkZXRhaWw/DQo+IA0KPiAtIERhbmlsbw0KDQpIaSBEYW5pbG8sDQoNCkFz
IEkgc2FpZCwgd2l0aCBpbmV4cGVyaWVuY2UgaXQncyBwb3NzaWJsZSBJIG1pc3NlZCB3aGF0IEkg
d2FzDQpsb29raW5nIGZvciBpbiB0aGUgZXhpc3RpbmcgZG9jdW1lbnRhdGlvbiwgd2hpY2ggaXMg
aGlnaGx5IGRldGFpbGVkDQppbiByZWdhcmQgdG8gaG93IGl0IGRlYWxzIHdpdGggb3BlcmF0aW9u
cywgYnV0IHVzYWdlIHdhcyB3aGVyZSBJIGZlbGwNCmRvd24uDQoNCklmIEkgdW5kZXJzdGFuZCB0
aGVyZSBhcmUgdGhyZWUgd2F5cyB0byB1c2UgdGhpcywgd2hpY2ggYXJlOg0KMSkgVXNpbmcgZHJt
X2dwdXZhX2luc2VydCgpIGFuZCBkcm1fZ3B1dmFfcmVtb3ZlKCkgZGlyZWN0bHkgdXNpbmcNCiAg
IHN0YWNrIHZhIG9iamVjdHMuDQoyKSBVc2luZyBkcm1fZ3B1dmFfaW5zZXJ0KCkgYW5kIGRybV9n
cHV2YV9yZW1vdmUoKSBpbiBhIGNhbGxiYWNrDQogICBjb250ZXh0LCBhZnRlciBoYXZpbmcgY3Jl
YXRlZCBvcHMgbGlzdHMgdXNpbmcNCiAgIGRybV9ncHV2YV9zbV9bdW5dbWFwX29wc19jcmVhdGUo
KS4NCjMpIFVzaW5nIGRybV9ncHV2YV9bdW5dbWFwKCkgaW4gY2FsbGJhY2sgY29udGV4dCBhZnRl
ciBoYXZpbmcNCiAgIHByZWFsbG9jZWQgYSBub2RlIGFuZCB2YSBvYmplY3RzIGZvciBtYXAvcmVt
YXAgZnVuY3Rpb24gdXNlLA0KICAgd2hpY2ggbXVzdCBiZSBmb3J3YXJkZWQgaW4gYXMgdGhlICdw
cml2JyBhcmd1bWVudCB0bw0KICAgZHJtX2dwdXZhX3NtX1t1bl1tYXAoKS4NCg0KVGhlIGZpcnN0
IG9mIHRoZXNlIGlzIHByZXR0eSBzZWxmLWV4cGxhbmF0b3J5LiAgVGhlIHNlY29uZCB3YXMgYWxz
bw0KZmFpcmx5IGVhc3kgdG8gdW5kZXJzdGFuZCwgaXQgaGFzIGFuIGV4YW1wbGUgaW4geW91ciBv
d24gZHJpdmVyLCBhbmQNCnNpbmNlIGl0IHRha2VzIGNhcmUgb2YgYWxsb2NzIGluIGRybV9ncHV2
YV9zbV9tYXBfb3BzX2NyZWF0ZSgpIGl0DQpsZWFkcyB0byBwcmV0dHkgY2xlYW4gY29kZSB0b28u
DQoNClRoZSB0aGlyZCBjYXNlLCB3aGljaCBJIGFtIHVzaW5nIGluIHRoZSBuZXcgUG93ZXJWUiBk
cml2ZXIgZGlkIG5vdA0KaGF2ZSBhbiBleGFtcGxlIG9mIHVzYWdlIGFuZCB0aGUgYXBwcm9hY2gg
aXMgcXVpdGUgZGlmZmVyZW50IHRvIDIpDQppbiB0aGF0IHlvdSBoYXZlIHRvIHByZWFsbG9jIGV2
ZXJ5dGhpbmcgZXhwbGljaXRseS4gIEkgZGlkbid0IHJlYWxpc2UNCnRoaXMsIHNvIGl0IGxlZCB0
byBhIGZhaXIgYW1vdW50IG9mIGZydXN0cmF0aW9uLg0KDQpJIHRoaW5rIGlmIHlvdSdyZSB3aWxs
aW5nLCBpdCB3b3VsZCBoZWxwIGluZXhwZXJpZW5jZWQgaW1wbGVtZW50ZXJzIGENCmxvdCBpZiB0
aGVyZSB3ZXJlIHNvbWUgYnJpZWYgJ2hvdyB0bycgc25pcHBldHMgZm9yIGVhY2ggb2YgdGhlIHRo
cmVlDQp1c2UgY2FzZXMuDQoNClRoYW5rcywNCkRvbmFsZA0K
