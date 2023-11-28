Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07277FB5F9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 10:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342410E46C;
	Tue, 28 Nov 2023 09:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114E910E46B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 09:38:40 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AS8i3wk020064; Tue, 28 Nov 2023 09:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=e7Vtt2p3+v7moRifjeC4F5whWKKGOl98D3DEzxEIu1E=; b=
 q1QfVXcVab1mA+D7z+UCjOJQyPb1l2ZuDSJvZORrH6I68wPo1ktuO71QMRnwgonO
 dwu615LpGX3ZPAvVm20ewdu5feBItwb4q8x6VAuGssW/RiCD9PIPOCTaBu4XQTKO
 XI+VXZrQGt5BK5ZUchecWfYS9PUVxtzuwBNxm1jjm9vPWf2aALdv4l93It6GNcKV
 hz6jAyi+GVxABgWfE4Qccuedr4epYn4LZbzj7jH+afdt2KcodSyAUV9T03gbhXeu
 C3H8zAU50g33ROhvXA3djN/dC4oewJuIgszkFBEgEF4bYX3tHAVARIp55Uh9yt9u
 IjhYk5papJ3bsbw39u1e0w==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uk9vwj6nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 09:38:15 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 09:38:14 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 09:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpVLuGrHjv2T+EQoij6rEUtp0We0kE1N99dvRwKXbimHZZ5biHiMsYa4PQ6nNHD+FaXoYw7LkJeNQN3U1u2MEBOkSzz2ujlR/h/mtLp4H1pEYMFNmCA3YRieC4O+NnymZIJXli4aIPoUYZiKG8LNT2Sc7kqwaCtPky2VIHkntyNjPeic/rmbpoVhjGYm0sOH8L6oe2wWriyoA5iKpSgn8FMVynzyIMUk9WafhXfVDc/vcEtAI/J8qnf/V8rmeRLRnSZNAbkqrKdfmoElnS5RTJfMfoJtt/d5res2Em6SderNf1pHnmir9FvlGLQxcMIOZPYBAt7gdzgZ3t7GGRyEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7Vtt2p3+v7moRifjeC4F5whWKKGOl98D3DEzxEIu1E=;
 b=leoTHCSx6rTIMqBtmCJmX8BxKydLRb/mDZckiU0HR64qxVsmYQTsYWlcd0PsiCym53AaVPCwz/cKujbbAsit3eYeMXWHj7FkRKtI9wNI4fXA8ILnwu3sWrqWeT0Q977Osf2CKyVg5aDaJZcYNHa4b/NooqAtrlwt8CHnuL33WvmId4sbfSfqC6eeFNMll5Hc4mXhpF3ROy0OBZaT0M+GXfSNabk8FdBkGELsC/k6g5CMbxFJ3u89aKrlmaggaDyDmEjlp2agLoFlUr7VU++GxdCW+HqdMUQu6LVV5bGUpIAFHswrHTLt3L6NigXpc90U/uk32ABsTPWkxXTXWgF1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7Vtt2p3+v7moRifjeC4F5whWKKGOl98D3DEzxEIu1E=;
 b=RLmicDvoV2OP5K5ceiYTi4yhgz3CefR3FzGGJJugLSS1APwFQOaYxtc6lo054EVHKitee6U1pHSwpUbLY5hw2ujZD9yUbUA5miZwl0mj+4T+zVbpvYPBDvZFcrAAgqrZ/+nSHdeiBmwF7RtW3z+VmrianlpeWY8+1nmp/YQg1X0=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6596.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 09:38:07 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 09:38:07 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "geert@linux-m68k.org" <geert@linux-m68k.org>
Subject: Re: [PATCH v9 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Thread-Topic: [PATCH v9 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Thread-Index: AQHaHWHaw0DfxtYhGUG0WHYej+01CLCN35qAgAGi0YA=
Date: Tue, 28 Nov 2023 09:38:07 +0000
Message-ID: <b2bfb0f127a4e63617b9b4492454223a5d57bfcd.camel@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
 <deb0a4659423a3b8a74addee7178b6df7679575d.1700668843.git.donald.robson@imgtec.com>
 <CAMuHMdWkQeJzmJhHcOsXRUGQjFmJJvSd_6=tvmPp1edh8oXdpw@mail.gmail.com>
In-Reply-To: <CAMuHMdWkQeJzmJhHcOsXRUGQjFmJJvSd_6=tvmPp1edh8oXdpw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB6596:EE_
x-ms-office365-filtering-correlation-id: 319d119c-ef45-4308-dec9-08dbeff5ba77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tjgVH+rFTpH1X9ym2rfK9Wy1st9eguUNgVap1DX4Ikv70nNmCdSENcfhe9Iv5W7FYpHKrCGzbsBRSd9um1eNY3pZ0nfU+dqIZaY/D4vBP29qVXP0sZQCLVWlwpdhdIEEOkYwjPFTxvDBn8ri4BlhHn7nIFem0oQRWIEFtw4brLf/EFYz/vW2S1QRMeJ0ANyqTZ7RuBA0LieAABjyEvK748zt968OR/RcDf7CkidksmzUYt/ZMhKxm6x6JfjjNxCzY1Oj8yO4SmdqKPTPs6dfhGg7N9koadHqGVoTUqgVo9h0r4CyoeYC+QjXxfdPR3CIKWRtWmy5Wq7bVkLAmJm/jWnP1GR6N3IPpSsvCrS+ig5QdP0KnbZGAo26VYBJsuawLm/Q35sd89F84Y/lA0kUACaUu/FUl73QHzFWOHqNR0OoOlzgx39QDXU3zWfP/nw0+vB3DT6ZMYK3JcuQi2IF039SJJvQ7r8AZr4W1nomswHfpi2BNpoK00ri6vMBA9+vTF7SwnfMa5Brr7T706/9tHFMW30c1UJ2W7ZYo2O7aOX/xhnAiPB+uIUNjPZ6F6+czKCZ/RuBlEGj5d1Zy2AxTIq+09H6+SsyQMmf2Z0/CAK6uhFmIzjq5GyjBHWTPIjU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39850400004)(396003)(366004)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(38100700002)(4326008)(8676002)(8936002)(2906002)(86362001)(38070700009)(7416002)(4001150100001)(26005)(5660300002)(122000001)(36756003)(6512007)(2616005)(53546011)(6506007)(91956017)(71200400001)(76116006)(6486002)(478600001)(6916009)(54906003)(66556008)(66476007)(66446008)(66946007)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUN1NWVVZDA5ajhwUTB3a1V5YWdWMjJCWFh0bXRtUjNmb2hMMW5xT1VaVytM?=
 =?utf-8?B?b0V1dUJmZDZEUlRZQmdsUkF1UWxtUWhmd0E0L05GUGRKelpZc1VxVy9QYWNr?=
 =?utf-8?B?RTJBSkRIQStYYVpYTWc1WkJpSWpqNmwyT1RjYkp2RFdSQXg2dDRneHN2dDZu?=
 =?utf-8?B?VWRPR3NRR3FHWTI3NHJhNHc3bTcyL2xkVTlaeXpkWjU3VDRFVUxZTWgzZWQr?=
 =?utf-8?B?M1IzcTlTUTF5bmJHRHplQ2xEcjdVQUZiWkZoMHBaY1FXWG9xOVhqNk4rbS9n?=
 =?utf-8?B?VDJaclNFSVJSMUVSek55S2JwQXZUUFh5b3ErWUJUMXRDK1VHb3gxTVVJYjgx?=
 =?utf-8?B?VFpDV0tmdEU4b25IdjJ2S1lJSmxHNkc5WUhhQ29HUFJGV3E5NGxoRENabmhs?=
 =?utf-8?B?WjFvaVJSY1NkM2hSU1BnWjR5UkdoRHQ2TXl4dXBIUEd2UW1YaFRNOFNtdFJV?=
 =?utf-8?B?NkFkeE81eSswQjBtVkR3cElTRk9vRDQ4aE9oWXcxbGdFcU9zSVVGTlQwOXZC?=
 =?utf-8?B?dmdyMEg0M29wQXc1T0dNNDZxU3liZUZ3dEhKY296NnZneUsyUVZrOHJHbVBW?=
 =?utf-8?B?YjFCL3dvWGZaK0d2L2lCOU5zTlpzVU9XNHlTdVFmV1E3MFlremM1Zk82amNE?=
 =?utf-8?B?cTFOUlVlK2VKZlgzRDdsdkxjOEVRR1N0SDRQcWlPc2poNXdWTmNlWEdJSURQ?=
 =?utf-8?B?OENVYUw4eU05aXJjM3oybHBFUUIyOGZDc0ZxTXZtRFk4VUs2UndPKzlxNWd0?=
 =?utf-8?B?bWptVWNlNjhjd2dDWlplK0tGZ0lqYWlkb1dPZGxoZEF3Mm5rQ1Z1YUJXSldY?=
 =?utf-8?B?dzBIM0RtSTJpc0x5eGNaN0gvZUFRSWRXT3VFNmxpODJ3STZaQW43dW5TNG9q?=
 =?utf-8?B?UmViYVc1ZTBlQnVxVWhmUUtpM1BrUVdWQTBaVjdoTzdaSW16YlFVZkZOa05n?=
 =?utf-8?B?aXQ2endWcUpIeWVEOWxFYTZ2SUhqeHgrNHQ4TTl0NHpTNFZCTkQxSmpPSUlH?=
 =?utf-8?B?NCtJbklzRnllaFhmVnlmRjZIVDk2WEpHSkZiRnJFUU1mTFFXTHo2SExyRVFJ?=
 =?utf-8?B?QkdjSTJaN3hSaHYvdzQ4d0hRRjNnRjBTWEZ1QWEwM1NlQkYzRG1tUWZ4Zm8r?=
 =?utf-8?B?YzZ5S2hNdnlMWmx0NU13NUh6T1V3MlhnWTlTMjA0NkNKQkdNM2QxMW9DWjF4?=
 =?utf-8?B?MXRrOVI4MVpYM2w1aXgzYVhybE1tTjREeVArM2NFNWQ2eEQ5cGxpLzZUYklW?=
 =?utf-8?B?ZDF1WWJOMWxGU1FFVVhrS0lMN0xlcTBjRlZob1VFU3F6VExzL0JDOFFRLytl?=
 =?utf-8?B?TUlWbk1xMG82OUdDbUFkOUJwRTdVTHpFQWRkODhUaHh6VTA3ODJ2YmZQTVdK?=
 =?utf-8?B?R1JieERLSU12Q0VSUXc4TGtBc1hXQnZ3bVE1NTFxQ29xa1F2R0tESk15YW5t?=
 =?utf-8?B?cDBFZEQwTndGU0ZiMmg0UWdOUHQ3bzE2anhMdWZSTmcrTDhGWEk4NXpUbmM2?=
 =?utf-8?B?b0VNQXFCWmNDMzEzMVlnbGwzRzhzY0xFTHRKKzBWSGlmaEduVDNZNTdiWDBB?=
 =?utf-8?B?LzZNbUxXMmdISmZZUTV2em1lQ1hML2VNNWxRTjdsMkZwbVIvejVHSGdxWDNH?=
 =?utf-8?B?a3ByNC9FSk1SMGlMVUtRL0F2K3N5ajNhNFJkZC9vUzhDdXZZVXRKMEF4cTNo?=
 =?utf-8?B?U0VhUEFXOU5zOVRYQUs1RXZHdnRYNUY5dEFROWYwc1hOc0FvcFArMllIejJ2?=
 =?utf-8?B?bUhHMUJORmprTnhVdXRSUmlqWVpXTmJMcmhDZ0NtM1VDWFZZRGNhYi9FSkt3?=
 =?utf-8?B?RWVKK2E0emRHbWprV0JrTzJvVzVwbk90ejV3Z0F1RzFrclNwQWZzeFRMU01t?=
 =?utf-8?B?MzI5MkNwU0JVN3Awc1pRQ1VSZmVmTkE5QTAzMVI4ZFV4RVhDVlFEbExxRk05?=
 =?utf-8?B?emZwWFhvQ2JCNWNSQm9sSE1ieUM5aVdJOXhHeWF0RG9nS21QMDl2bUlCa3BC?=
 =?utf-8?B?L0JHdnBnUEMwQm90OElYMkVteTRoQ21xbjZxcHY1Yi8reWhzVUxYOVhMWkhD?=
 =?utf-8?B?eW4ySyt0V1ZXSHRKVVJCTjFJM1U0cW5yNHpRa1pVa1FQcjFWMjJZOTdIanlx?=
 =?utf-8?B?ZXNyTFFOK1ozbjg1cjFXeUI4ekhCdFFqYnl3UjI4U1ZrS3h0VXoxMnBaZjlD?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A368AC6FBB2FC459627845AA5E487DB@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 319d119c-ef45-4308-dec9-08dbeff5ba77
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 09:38:07.7432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0XHTX9/fM/9o6ENmWv2ESWuAwHPX0oi8H20cuYM/KwuYAE3m6F5BRAku9vZ/6mxNRhP793rYryGVO3mKiRMi6WhD2f9UfYRSv7NdIWMyVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6596
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: svV9zJu2ZwgitZFL7WOCNoy3mstpB3Ni
X-Proofpoint-ORIG-GUID: svV9zJu2ZwgitZFL7WOCNoy3mstpB3Ni
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "hns@goldelico.com" <hns@goldelico.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "afd@ti.com" <afd@ti.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNCk9uIE1vbiwgMjAyMy0xMS0yNyBhdCAwOTozOSArMDEwMCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBEb25hbGQsDQo+IA0KPiBPbiBXZWQsIE5vdiAyMiwgMjAy
MyBhdCA1OjM24oCvUE0gRG9uYWxkIFJvYnNvbiA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMuY29tPiB3
cm90ZToNCj4gPiBGcm9tOiBTYXJhaCBXYWxrZXIgPHNhcmFoLndhbGtlckBpbWd0ZWMuY29tPg0K
PiA+IA0KPiA+IEFkZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0
aGUgSU1HIEFYRSBHUFUgdXNlZCBpbg0KPiA+IFRJIEFNNjIgU29Dcy4NCj4gPiANCj4gPiBDby1k
ZXZlbG9wZWQtYnk6IEZyYW5rIEJpbm5zIDxmcmFuay5iaW5uc0BpbWd0ZWMuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEZyYW5rIEJpbm5zIDxmcmFuay5iaW5uc0BpbWd0ZWMuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFNhcmFoIFdhbGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogRG9uYWxkIFJvYnNvbiA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMuY29tPg0K
PiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDZhODVjM2Ix
NDcyOGYwZDUNCj4gKCJkdC1iaW5kaW5nczogZ3B1OiBBZGQgSW1hZ2luYXRpb24gVGVjaG5vbG9n
aWVzIFBvd2VyVlIvSU1HIEdQVSIpIGluDQo+IGRybS1taXNjL2Zvci1saW51eC1uZXh0Lg0KPiAN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9pbWcscG93ZXJ2ci55YW1sDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29t
cGF0aWJsZToNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAg
ICAgICAtIHRpLGFtNjItZ3B1DQo+ID4gKyAgICAgIC0gY29uc3Q6IGltZyxpbWctYXhlICMgSU1H
IEFYRSBHUFUgbW9kZWwvcmV2aXNpb24gaXMgZnVsbHkgZGlzY292ZXJhYmxlDQo+IA0KPiBXaHkg
dGhlIGRvdWJsZSAiaW1nIiwgYW5kIG5vdCBqdXN0ICJpbWcsYXhlIj8NCj4gDQoNCldoaWxlIHRo
ZSBmaXJzdCAnaW1nJyBpcyBqdXN0IHNob3J0IGZvciAnSW1hZ2luYXRpb24nLCB0aGUgc2Vjb25k
IGlzIHRoZSBwcm9kdWN0DQpzZXJpZXMgbmFtZSAnSU1HLUF4ZScgaW4gbG93ZXIgY2FzZS4gIEEg
cXVpcmsgb2YgdGhlIG5ld2VyIHByb2R1Y3QgbmFtZXMsIHJlYWxseS4NCklmIHdlIGFkZCBvbGRl
ciBzZXJpZXMgdGhleSB3b3VsZCBiZSAnaW1nLHBvd2VydnItc2VyaWVzWy4uLl0nLg0KDQpUaGFu
a3MgZm9yIGFwcGx5aW5nIQ0KRG9uYWxkDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCg==
