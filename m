Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EB984365
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A380610E6AF;
	Tue, 24 Sep 2024 10:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="wJge0lZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2080.outbound.protection.outlook.com [40.107.212.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CD710E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTjIAgOzw+9lFFrLNPqZ87YChe1lHgTKuNQzg9f1HXc8r6rT20hI68p5HBd1oSNuOzExg505CD9i0hdrSQvkhlz+x4DeDmlgYCBqMfBfG2Tx0z0zn/ELcmfPbKDWgIalbyfEyZI1ClT4+Q2oQndVOx0BPTTmiHI9eTRne7K0pCDQquCkum4QvLJK0gCkqH2rTpySVXuJYj6lLNZKpsWyteShF4U5O5oSewFbEA6+AtgTNAyZ6W8Wkdob4QDt03iolTEnmXagJUW1cZ2Shnmb7rlXSSXjL+qFUq/hA/Hn4Hqf3X8yjPXmwQkDAAlEHFm8J3+VPWg8pzHNkpOvPxrUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocX/2/6melOcL7QDGklzC83508ZSInGjCa3XkYminWQ=;
 b=oXiMM03Hz0uZRTUb8TXzP/h+WaXN3LCG1C/JRunY8GyV0565+CIVoDnDPnJUr+XDs+FZjO/2hxP/BWubg3q9hKs/26LyZey21HKYaU0fa8BSDZ4zMk6kvRp2ZTRsgwMOT9xffuWuzhFjYyVsPWIHCMSZrhBh/VPMFQgoe9Datf9XgRNwxHZSi/Xu4zjx/MDqA6kFsMh1OWK8uo774vy4bwm7cRMslCOv/bmbwH0yqw0QNpmxHAzs7wDMLWS3M4X2hMeu6PEhHQ0AkmiCyhP9CD86FART073+Gk8lnVNJzjFLLJrwVoN+nxSGdXDb47Cck2otnuN0q3hY/aRjuZ9LIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocX/2/6melOcL7QDGklzC83508ZSInGjCa3XkYminWQ=;
 b=wJge0lZfKskbmh1ki1C7qdFm96TP0W2b0xQSEmS5tGOGSj00OspWgNg66oPNJdWLyeWXf6gWvYBdAwPhoPtDda0z6kjNp3/KFaaKXpgVYtCs+WH5LGTpoyD+XEXAZ7KiDFe+xXvxbXhJqz0es2Oy1I926mMldjhD95VbzAmd7Im12NvqTxRrg/j5Agizj5niIyKfQwVXJQPNDCssMrHq7JVPm7unH6QMA9K8XlBJAckxCfji0NcdmGyv1MgfeZ6V0fgYiEhlv1YY5YiE92fmR7ILBFO9Fa64fLMVCaJgv3CHfBe1MYrb8+ymgPlnpg74ZNoGWT8AgmFT3tPzuqguwA==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SA3PR11MB7980.namprd11.prod.outlook.com (2603:10b6:806:2fc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 10:16:55 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 10:16:54 +0000
From: <Manikandan.M@microchip.com>
To: <dmitry.baryshkov@linaro.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <Dharma.B@microchip.com>, <arnd@arndb.de>,
 <Hari.PrasathGE@microchip.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 2/4] drm/bridge: add Microchip DSI controller support
 for sam9x7 SoC series
Thread-Topic: [PATCH v4 2/4] drm/bridge: add Microchip DSI controller support
 for sam9x7 SoC series
Thread-Index: AQHbCbX5mCyG4KuV4EWq+87iEOhf4LJg3TKAgAXlIQA=
Date: Tue, 24 Sep 2024 10:16:54 +0000
Message-ID: <4cd72332-a718-42e0-8006-f589410c920f@microchip.com>
References: <20240918103119.385597-1-manikandan.m@microchip.com>
 <20240918103119.385597-3-manikandan.m@microchip.com>
 <pjc75xbvdn4n7tqzjx33st2lf6bzryrs7zixahbv7j4fi5xa7j@xujs6wx7qeqs>
In-Reply-To: <pjc75xbvdn4n7tqzjx33st2lf6bzryrs7zixahbv7j4fi5xa7j@xujs6wx7qeqs>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SA3PR11MB7980:EE_
x-ms-office365-filtering-correlation-id: c2a99b06-d82a-47e7-7b46-08dcdc8203d0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z0F4M0l0aFN5dkFhMTYvaXdXbXV3WThoM2xOVngzSzBONVRLWVFaalpTQ3Bj?=
 =?utf-8?B?N2JPNmlQT3VKT2hNTHFJbjlFZ3FWTjdGR3ArODI0RWZSbGQxZERrbWJwWVBx?=
 =?utf-8?B?YVRWVkR5ZC9KY21LcHdTWklTYmwvN1RLMHFJMVRiUWp4TmdnVlJvUThtbVRr?=
 =?utf-8?B?WDRnSFRTTmd5RlJnZjNoelVEQ1pjVmZObis4OGE0V2FVK0xCdHNPT3VFTUJZ?=
 =?utf-8?B?NzE5TXRTZzIxY21RSFRqZFVwOXFoUTJMOW1YMENOUjBPblRPdm5lL2UrUmJp?=
 =?utf-8?B?UWVvR2hwQk0xSzNKajB4RFRWNUp3V2RhQ0FGUFBFeFpWc2RoT0lRdUJVY0hC?=
 =?utf-8?B?TVV1TEJwM0dqL01RRzBxTG9wbnZBNjhmeEtjWlpQdy9TQ0l0cUV3WElzemtB?=
 =?utf-8?B?SFJLckVCckljL0M4V0VldUo4ZWRXOENOZisrRWc0azBYT25ORFVwZHVNOVFP?=
 =?utf-8?B?WFR6b2FScGpWWDVldXlTbU0wbjNpN2hTU1dob3NOcG9UY3ozZG1yaTRaNE5F?=
 =?utf-8?B?ZkNwMGVNYXQxbkxxTUtvVDU1bFk2TWRtMmVIUHpDbjlXMGxoSXhRZExvMUpo?=
 =?utf-8?B?bmtlTUg3M3I0YVAxUHlNdDdreW4rK0RaaUpwWmkrV3lzMW14TjVjZjEzQ2VC?=
 =?utf-8?B?ZGViek5DMGcxdmpoaFM4VlEraTIxUENra0lnWGJTYVFOYVVxODFmS2xYcFdh?=
 =?utf-8?B?SENSb09QeDVVZ01JZ2RyNGdON2k1dHpMSHZ5Ti8wRERFVTd6SXVEakIrY2o2?=
 =?utf-8?B?TmxwVkdjNFUyRG5QVWJ2aHZ5dDg2R1psQVRJZUpYSzVPQXhwTGFmT3JjTFRx?=
 =?utf-8?B?b3hGdEJ6dmo1L3VpYmxML3ZsSEE1dmttZWI1LzgrSy9ZQ1A1c1Q5MGJTUnlT?=
 =?utf-8?B?WjMvNmlJZmxrc3JIQmhpbXNTNjBSVmNadzFhUEIrQ0dGQjhFVnlHK0FpUy9I?=
 =?utf-8?B?bnlIdmllQTBEaGo2bWZnMERuZlRlaWVmc2V6V3hnRmtOWk5qejNBaWpna3BP?=
 =?utf-8?B?YnRoQ0tXNWx3TndTd2QvK1NFeUdzVkJ0SVVMUjUvZWozRnpUVUswZGVWcHZZ?=
 =?utf-8?B?TjllUWl5ZjlQcWxKM2w5VHVEeFNOR0ZPbXBWVWFaSmcwNTdDTm8yMytPeXVR?=
 =?utf-8?B?ZkNwaXhmeUplbTI5eGwrb2JxNE5TbjMveE9WNlE1aXgyZmxETldZRUVoNzFD?=
 =?utf-8?B?TlpsTWVDN2tMSTJoZUxRTlRMcjF0Z1RucFZla0gxWno1TTRuWlNtYzVFK3Nx?=
 =?utf-8?B?THVJUmNvL0NsNkwwTGlac1UxUElNY0hUaUV6enRGOWhTMDhrMTZJRSszeENK?=
 =?utf-8?B?Q0swZjV5UW05T1EreWgwU3Nzc0JCMENjb1RlMDFJOG9sd3NEUXQ1WGc2dmdW?=
 =?utf-8?B?ejZBY1FZNWd3U0hEYXRkSlhOUXZScnNUVlNKa05CSkxHQ2dSci9RSEFTMVpy?=
 =?utf-8?B?L0k3YWhOMUwyS0RQT1N2V3d2MklaZkxXaHhvemh5VzQrcTZJUDJFaUxwdkpn?=
 =?utf-8?B?ZkxKU3h1T1V4NUt6MW16ZUJpbmVRVFc5QmNKRmp5SDhLWmRwbWNjcllzODBY?=
 =?utf-8?B?Q1FnSktISjlhM1pLN1gwYUNscTl2ZlBCQlpzbjlXaHZSajFCcHRuZ3czZ1A5?=
 =?utf-8?B?b000bVNzMU1RUEtjNCtaY24yZTdlK1ppTjkxODZySWszOFFac1h1cjZDclpn?=
 =?utf-8?B?LzRBbXVCYWxpenZ2cXlMaENBVHFkTmhlUzdwZFhFS3dwVjkwN0o1bVJlbUtJ?=
 =?utf-8?B?QjY3THYxS2c3N3RrQU4wYjhuaDNDV2hFUGJTZVJDR2NRL2VFdGNGRUMrdnFC?=
 =?utf-8?B?b1A0eGpjSkRrbVNGQWZFQT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmY5amlwanpuUE9rbXo3ZjVxTzhBZVlqa28zeTMrRkFZck1lSGdjRTFORHcy?=
 =?utf-8?B?ZmZncUpEQVovczF1c3FaK3IwTDFjWG94N254cnBiR3hJZGlJU3ZXQXB4NkZN?=
 =?utf-8?B?d0lZZGJlR21pazdnbmJZZWpaRzBCUGhiemdzUUpBRU5BdVZXWjd0bHJQeldI?=
 =?utf-8?B?WnEvVFhvS2Q2RkpXelNaWEdWYVFGZEpVM29hNFg1UHdzRVdCTDlxTUNqNUla?=
 =?utf-8?B?emVjV3J6NUM4d1cvMzM1MmFXVVVQS1dFYVdMYVFKTlFNRFJMOU5kbGwrVkli?=
 =?utf-8?B?VERVV3BPcTBkdE9oenc1dkNoNlZtbEFzcmNpbmhYRzlwR1l2eThFZWV6STg1?=
 =?utf-8?B?aEZFNmZ5K3BuL3F3M3lGeDVsYUd4aGRUUk5xbUZPdERTQjBRaFpUZ1d3aWZW?=
 =?utf-8?B?V3c0K1JEZVlGVVZqYTRTWVVhNlR1RkR0aUdSdTRIZVFWU3p3OVJoSWgrL0xv?=
 =?utf-8?B?OC8rSG9aOXdEcWo3R0RxcTA5L3N6ekphcktlOTVseXIzY3YzY0lZSWJQLzN1?=
 =?utf-8?B?QUpGbUNnWllhTExvbEtlUXdoQ0I0b3VKM3VnTWU4a2RRNVpmWER0M01aM3RS?=
 =?utf-8?B?UkJsQkNQbXZWMWRPSTlBZGpDSndQaHBkZXhhOFp5T244ekpVSnV1czRwVU00?=
 =?utf-8?B?QzllekxjR012Y3A3eUNQWWs5bDBmNW1RN0ZWNVdsVTRTTE5HMU1XdVpIQ2Zq?=
 =?utf-8?B?OGhMTGk4NTJqOWZSTFgyMzFCUXBPcnN0NjczaEdzV1pXcmsrcTJ4NXNrdE01?=
 =?utf-8?B?bkQrUUk0dW9RY2VwRzNGTTh1ME14cWRHQVlQRXZCckFGeHpEcTlpRkk5T1Ev?=
 =?utf-8?B?ekhtb0Fzc2NBeUN1dEp3YWQ1NHV5THkvRXExY29XRnpDemc2VHhpaTZ3RkVQ?=
 =?utf-8?B?R1JHS2xZdFczNVJKOFZ2dXA4R1VUaUgxR2EyYnVLZ0lQdnVDQVJNTlVJZk9P?=
 =?utf-8?B?eS9YMzN2LythUjdDM2xiOXlOVStoNzBtOTA5YkE2MG5Qd0g3amxYUDc1a1g3?=
 =?utf-8?B?N2VlWStkQzNMTTFZK3UxLzNZc2p2THdZRWl2a1NaZEhSTEFWeUJHSkJRcG9J?=
 =?utf-8?B?RE8rWGlnRHV1ejVRK1FVZ0NCZldGN0o2T2piSWVLeGdrRUZ1TDBrOHdvZXU4?=
 =?utf-8?B?KzFneEJldStiVFZvRW1MSVNva0FGMjIvOTMzdTRSLzlKNGtWdmNRMjM1REU1?=
 =?utf-8?B?MkxmdTBTQlE0ZlNNSWhta1hqK3VUdXRWMHBRVWg3RjAvK1RZZG53bUFpRk1Q?=
 =?utf-8?B?Q0J5MzkxNTJmaEsyY3diMjhYKzhhTXkwMk9aUUlCb0hQUkJWUTMxcGtDTWpD?=
 =?utf-8?B?eDRSejB3VzQ5bjdYbmQzQjE5dHgzTm45Mi9vY0QxejZ2Qnp3S1U1MHlxUkhZ?=
 =?utf-8?B?NE1jWFp4Z3NWKy84TnVyTmh2aWY1QldyeFkwNzA4UGZnT3ZKcUUyMXd0ZGd2?=
 =?utf-8?B?Q0czelZnN2pONzh2QVJuODBOUWRUa3RKWGJNMXkvTG5wMTcwQjY3cE1CYmIr?=
 =?utf-8?B?d0hHOWs1LzNqYXJETU1MTjFVc2grTVJEMEdETXhXWHVseW1yZmRFUE9ITGZ1?=
 =?utf-8?B?WUdlMy9TNEJ5TlErcVhnU0swb1dGUy9HYzdIaEhqUzl6ZVlKZmJrVHpQWUNV?=
 =?utf-8?B?eGFVSDM4UmRXV005c3YxQm9CRm5qMFFna1UwMFRKazBoemdWOE51SFZEZFd3?=
 =?utf-8?B?Q0l2eVNQcGtqbEJxcjZWVEsybzV0UU8wNHhDVDR3ZnJ1WXUvOW1UT1FxRU9n?=
 =?utf-8?B?aDZSTGVjeTAxczNvVHdYVGNNcXZCRmNaaVZ5SlUvWlh6YWNRcDVQWVFyUW16?=
 =?utf-8?B?a05VS2lpUXI5MTF5MnVjQ2FNNk5qSlNhTEZBeUR1MzU5VERkZlZrMGpjNWdx?=
 =?utf-8?B?UHJsVFBpKzdUb01SQWJrRnBGRitPSkZCMXVEdmlESGowVzNqSXhacmFQMVFS?=
 =?utf-8?B?YkE4SElvSDdEeUJuM0srcjZLOUpBdHFSS1JVMEZ4blZQdEl0RmJFM1JnNXI1?=
 =?utf-8?B?VExLUjRvdXhDRmZHWlB6UnhoVVFJYjVNQWlia2hBcnFTTFIybFZwRWd2NExB?=
 =?utf-8?B?b3llSEsyc20wSTM4U3hReDZXVk00bFFTdUJ0N2NjaDNYZDd2R2x1T1k1TjFO?=
 =?utf-8?Q?klgUyN+ZVj+K4RG6bqhf1Z7gs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86FE2DEB27ABBE4092AB05953D489FD4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a99b06-d82a-47e7-7b46-08dcdc8203d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2024 10:16:54.7203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SINUi/795Fp2YSKh73e6uW6cLLHwzsPOIDokmUDclM9o0WyQdnZQlOGfp/4wK9rCVH8ipMkJFJX5ZSEQWKa7qFaGUb5tptlB6eA9MZf+yl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7980
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

SGkgRG1pdHJ5LA0KDQpPbiAyMC8wOS8yNCA5OjQ1IHBtLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFdlZCwgU2Vw
IDE4LCAyMDI0IGF0IDA0OjAxOjE3UE0gR01ULCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90
ZToNCj4+IEFkZCB0aGUgTWljcm9jaGlwJ3MgRFNJIGNvbnRyb2xsZXIgd3JhcHBlciBkcml2ZXIg
dGhhdCB1c2VzDQo+PiB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBNSVBJIERTSSBob3N0IGNvbnRy
b2xsZXIgYnJpZGdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhh
cmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gY2hhbmdlcyBpbiB2
NDoNCj4+IC0gRml4ZWQgaXNzdWVzIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90DQo+PiAt
IHJlcGxhY2VkIHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUgd2l0aA0KPj4gc3lzY29u
X3JlZ21hcF9sb29rdXBfYnlfY29tcGF0aWJsZQ0KPj4NCj4+IGNoYW5nZXMgaW4gdjM6DQo+PiAt
IG1ha2UgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkDQo+Pg0KPj4gY2hhbmdlcyBpbiB2MjoN
Cj4+IC0gdXNlIHN0YXRpYyBjb25zdCB3aXRoIGdsb2JhbCB2YXJpYWJsZXMNCj4+IC0gcmVwbGFj
ZSBkZXZfZXJyIHdpdGggZGV2X2Vycl9wcm9iZQ0KPj4gLSBtb3ZlIGNsa19wcmVwYXJlX2VuYWJs
ZSB0byBzaW1wbGlmeSB0aGUgZXJyb3IgcGF0aA0KPj4gLSB1c2UgRklFTERfUFJFUCBjYWxscw0K
Pj4gLSByZW1vdmUgdW51c2VkIG1hY3JvcyBhbmQgdW51c2VkIGZ1bmN0aW9ucw0KPj4gLSByZW5h
bWUgZnVuY3Rpb24gbmFtZSB3aXRoIG1jaHBfIHN1ZmZpeA0KPj4gLSBhZGQgc3VzcGVuZCBhbmQg
cmVzdW1lIHBtIGNhbGxzIHRvIGhhbmRsZSBwbGxyZWZfY2xrDQo+PiAtLS0NCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAgICAgICAgfCAgIDggKw0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArDQo+PiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvZHctbWlwaS1kc2ktbWNocC5jIHwgNTQ1ICsrKysrKysrKysrKysrKysr
KysrKysNCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1NTQgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdy1taXBpLWRzaS1tY2hwLmMN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnDQo+PiBpbmRleCA2ODNjYjMzODA1YjIuLjMxNzI0
NjUwOTYwMSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnDQo+PiBAQCAtMTk2LDYgKzE5
NiwxNCBAQCBjb25maWcgRFJNX01JQ1JPQ0hJUF9MVkRTX1NFUklBTElaRVINCj4+ICAgICAgICBo
ZWxwDQo+PiAgICAgICAgICBTdXBwb3J0IGZvciBNaWNyb2NoaXAncyBMVkRTIHNlcmlhbGl6ZXIu
DQo+Pg0KPj4gK2NvbmZpZyBEUk1fTUlDUk9DSElQX0RXX01JUElfRFNJDQo+PiArICAgICB0cmlz
dGF0ZSAiTWljcm9jaGlwIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIFN5bm9wc3lzIERXIE1JUEkg
RFNJIg0KPj4gKyAgICAgZGVwZW5kcyBvbiBEUk1fQVRNRUxfSExDREMNCj4+ICsgICAgIHNlbGVj
dCBEUk1fRFdfTUlQSV9EU0kNCj4+ICsgICAgIGhlbHANCj4+ICsgICAgICAgVGhpcyBzZWxlY3Rz
IHN1cHBvcnQgZm9yIE1pY3JvY2hpcCdzIFNvQyBzcGVjaWZpYyBleHRlbnNpb25zDQo+PiArICAg
ICAgIGZvciB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBkc2kgZHJpdmVyLg0KPj4gKw0KPj4gICBj
b25maWcgRFJNX05XTF9NSVBJX0RTSQ0KPj4gICAgICAgIHRyaXN0YXRlICJOb3J0aHdlc3QgTG9n
aWMgTUlQSSBEU0kgSG9zdCBjb250cm9sbGVyIg0KPj4gICAgICAgIGRlcGVuZHMgb24gRFJNDQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvTWFrZWZpbGUNCj4+IGluZGV4IDNkYWY4MDNjZTgwYi4uMzJlNDIzM2U2
YjVlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZQ0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZQ0KPj4gQEAgLTE0LDYgKzE0LDcg
QEAgb2JqLSQoQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMVVYQykgKz0gbG9udGl1bS1sdDk2MTF1
eGMubw0KPj4gICBvYmotJChDT05GSUdfRFJNX0xWRFNfQ09ERUMpICs9IGx2ZHMtY29kZWMubw0K
Pj4gICBvYmotJChDT05GSUdfRFJNX01FR0FDSElQU19TVERQWFhYWF9HRV9CODUwVjNfRlcpICs9
IG1lZ2FjaGlwcy1zdGRweHh4eC1nZS1iODUwdjMtZncubw0KPj4gICBvYmotJChDT05GSUdfRFJN
X01JQ1JPQ0hJUF9MVkRTX1NFUklBTElaRVIpICs9IG1pY3JvY2hpcC1sdmRzLm8NCj4+ICtvYmot
JChDT05GSUdfRFJNX01JQ1JPQ0hJUF9EV19NSVBJX0RTSSkgKz0gZHctbWlwaS1kc2ktbWNocC5v
DQo+PiAgIG9iai0kKENPTkZJR19EUk1fTlhQX1BUTjM0NjApICs9IG54cC1wdG4zNDYwLm8NCj4+
ICAgb2JqLSQoQ09ORklHX0RSTV9QQVJBREVfUFM4NjIyKSArPSBwYXJhZGUtcHM4NjIyLm8NCj4+
ICAgb2JqLSQoQ09ORklHX0RSTV9QQVJBREVfUFM4NjQwKSArPSBwYXJhZGUtcHM4NjQwLm8NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R3LW1pcGktZHNpLW1jaHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHctbWlwaS1kc2ktbWNocC5jDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNWNmY2ExZmYwMDANCj4+IC0tLSAv
ZGV2L251bGwNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHctbWlwaS1kc2ktbWNo
cC5jDQo+PiBAQCAtMCwwICsxLDU0NSBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkNCj4+ICsvKg0KPj4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBNaWNyb2No
aXAgVGVjaG5vbG9neSBJbmMuIGFuZCBpdHMgc3Vic2lkaWFyaWVzDQo+PiArICoNCj4+ICsgKiBB
dXRob3I6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNv
bT4NCj4+ICsgKg0KPj4gKyAqLw0KPj4gKw0KPiANCj4gWy4uLl0NCj4gDQo+PiArDQo+PiArc3Rh
dGljIGludCBkd19taXBpX2RzaV9tY2hwX2dldF9sYW5lX21icHModm9pZCAqcHJpdl9kYXRhLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICptb2RlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbW9kZV9mbGFncywgdTMyIGxhbmVzLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBmb3JtYXQsIHVuc2lnbmVkIGlu
dCAqbGFuZV9tYnBzKQ0KPj4gK3sNCj4+ICsgICAgIHN0cnVjdCBkd19taXBpX2RzaV9tY2hwICpk
c2kgPSBwcml2X2RhdGE7DQo+PiArICAgICB1bnNpZ25lZCBsb25nIGJlc3RfZnJlcSwgZnZjb19t
aW4sIGZ2Y29fbWF4LCBmaW4sIGZvdXQ7DQo+PiArICAgICB1bnNpZ25lZCBsb25nIG1pbl9kZWx0
YSA9IFVMT05HX01BWCwgZGVsdGE7DQo+PiArICAgICB1bnNpZ25lZCBpbnQgdGFyZ2V0X21icHMg
PSAwLCBtcGNsaywgZGVzaXJlZF9tYnBzOw0KPj4gKyAgICAgdW5zaWduZWQgaW50IG1heF9tYnBz
ID0gZHBwYV9tYXBbQVJSQVlfU0laRShkcHBhX21hcCkgLSAxXS5tYXhfbWJwczsNCj4+ICsgICAg
IHVuc2lnbmVkIGludCBtaW5fcHJlZGl2LCBtYXhfcHJlZGl2Ow0KPj4gKyAgICAgdW5zaWduZWQg
aW50IF9mYmRpdiwgYmVzdF9mYmRpdiwgX3ByZWRpdiwgYmVzdF9wcmVkaXY7DQo+PiArICAgICBp
bnQgYnBwOw0KPj4gKyAgICAgdTY0IGZyZXFfZmFjdG9yOw0KPiANCj4gVGhpcyBmdW5jdGlvbiBp
cyBzaWduaWZpY2FudGx5IG92ZXJsYXBwaW5nIHdpdGggZHdfbWlwaV9kc2lfZ2V0X2xhbmVfbWJw
cygpLg0KPiBQbGVhc2UgZXh0cmFjdCBhIGNvbW1vbiBoZWxwZXIgYW5kIGFkZCBpdCB0byBkdy1t
aXBpLWRzaS5jLiBPdGhlciB0aGFuDQo+IHRoYXQsIExHVE0uDQo+IA0KSSBmaW5kIGl0IGRpZmZp
Y3VsdCB0byB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4NClRoZSBkd19taXBpX2RzaV9tY2hwX2dl
dF9sYW5lX21icHMoKSBpcyB0aGUgLmdldF9sYW5lX21icHMgcGh5X29wIA0Kc3BlY2lmaWMgdG8g
TWljcm9jaGlwIERTSSB3cmFwcGVyLiBUaGUgZHdfbWlwaV9kc2lfZ2V0X2xhbmVfbWJwcyANCmZ1
bmN0aW9uYWxpdGllcyBhY3Jvc3MgZGlmZmVyZW50IFNvQyB3cmFwcGVyIGlzIG5vdCB0aGUgc2Ft
ZSB0byBleHRyYWN0IA0KYSBjb21tb24gaGVscGVyLg0KPj4gKw0KPj4gKyAgICAgZHNpLT5mb3Jt
YXQgPSBmb3JtYXQ7DQo+PiArICAgICBicHAgPSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBw
KGRzaS0+Zm9ybWF0KTsNCj4+ICsgICAgIGlmIChicHAgPCAwKSB7DQo+PiArICAgICAgICAgICAg
IGRldl9lcnIoZHNpLT5kZXYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byBn
ZXQgYnBwIGZvciBwaXhlbCBmb3JtYXQgJWRcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ZHNpLT5mb3JtYXQpOw0KPj4gKyAgICAgICAgICAgICByZXR1cm4gYnBwOw0KPj4gKyAgICAgfQ0K
Pj4gKw0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KDQotLSANClRoYW5rcyBh
bmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
