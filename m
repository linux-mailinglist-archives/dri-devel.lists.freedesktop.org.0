Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD28780CE9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFC610E526;
	Fri, 18 Aug 2023 13:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFF410E526
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:49:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37ICSgKI032498; Fri, 18 Aug 2023 14:49:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=r7TCyw6T5Jq5GdyIvBgfi9/CTlndh1dO17UljCK/EOA=; b=
 mcK9yCEW6Ghh2hIB7fS82l74a+N2+ZE6qgpb4HD/bBuMdgHxTvrpSgxLqzK9lLDm
 By+gYfXPY33oUUBGi4Aqy6pCcxumrijAVbZqyLYih1IOusVPpJPgo89tCMHxIUeW
 HJlB4pLA1d65O+mtOiGE5KnVLpYKmmVFrhIpYj+GPZyfYjqYrrvINkdgaqrsNrud
 t+FR9ySpFd4OoF1ekzzAgn/xD0N3SFJarIq7LzlUcJKcevreA2vRu/OyA0c2Tkn0
 VdaKYnL3wthGHIwgN1wvsEgJXZOv8cw8i+O4cFeYRnokoVIoNU2onRPgjiJ+ql3g
 Kg5pWi77kWKx5OrbTCZxKA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brcpvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Aug 2023 14:49:30 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 14:49:30 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 14:49:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gnchx2GLg9bFNJM9wHbfqZyzx9/mRZMiV52tncuGKmx3REvg3/hf1GhcUrXQQ0iLiMWOsa1oVI+CUM9reKrxDBNRDR4OSoLe5Q/Awjxu/VAtK5/PABVnIkeOIJzPBKRvmXcNpk1t3JnnmM/TJKApGMjlPcOJuqhett3H9E21S62qcdSHUqUEU1rYbAo8H4xGOaxiSTRKs7meGZbk1a/IgzIjDel9d3L5tpEhlqY4pBFZiCwY5Aj/aErUYnoqEOR7ZhoUGaFq60x2coOI/QBWHkeah7YPXxds0/VfcG2Z10lGSDkbSu5t/planirjAFilxljuHm43Bn5OxBqPMi6Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7TCyw6T5Jq5GdyIvBgfi9/CTlndh1dO17UljCK/EOA=;
 b=IgXsz5a67PyPo3zAxmt8Lfw4MrIjpygCH5i2tJ/464sZufDqxh0VW/3tC78FB02y/KE30GXzQrGabJVQjVsEVXMjCI52TIhWTfp9rpyuLA9AtVpqq08KibFLbZsmCzHBLYYjk7TN2SVr0y9UeYTIvXrDYBabFJZ1NCnnUNsypqqrurcMfpB7XZ202k7kKZZ+Ajg2TBTRhmP6Um2iKzLDoNV3FRGhT0O1Z6O6hdZmMWw128jyLlSbjTgMjKW4FYhZMLJSdMyjQ2wcQ5fRMM0MCZQ0uuV8e8JEuiwj5OTFSGeVj/uZ6W0ZNy/EHLyN5pKuwdUbQooBfUrHKY0U1GndzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7TCyw6T5Jq5GdyIvBgfi9/CTlndh1dO17UljCK/EOA=;
 b=lKr2bLbT6aICD29UwB1mQ5DXQVCzK/HY68jZF+8DDEkotfYc3YUlN/ygL7oEGQm03lmowtG7YIOog05Fa6eeKv6cExb6Ou2oRHdP+DO5/29MBnManC63Mnz9zwoeoLTPYeBVMDfMBIadn4wEeNGQFlaiwBFjQp88cdXlAdAa6pk=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB7129.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 13:49:28 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 13:49:28 +0000
From: Sarah Walker <Sarah.Walker@imgtec.com>
To: "faith@gfxstrand.net" <faith@gfxstrand.net>
Subject: Re: [EXTERNAL] Re: [PATCH v5 03/17] drm/imagination/uapi: Add PowerVR
 driver UAPI
Thread-Topic: [EXTERNAL] Re: [PATCH v5 03/17] drm/imagination/uapi: Add
 PowerVR driver UAPI
Thread-Index: AQHZ0BtUOqWSV6MQe0yyvSFcG2kz2a/vOdWAgADbkQA=
Date: Fri, 18 Aug 2023 13:49:28 +0000
Message-ID: <eef53f6b6ac4405cf26320390eef6c62aadacdda.camel@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-4-sarah.walker@imgtec.com>
 <CAOFGe94OtnfKY+ZWzWOGz8kjKQhihzSOrLKrB_M=JE-i4cEMVg@mail.gmail.com>
In-Reply-To: <CAOFGe94OtnfKY+ZWzWOGz8kjKQhihzSOrLKrB_M=JE-i4cEMVg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|CWLP265MB7129:EE_
x-ms-office365-filtering-correlation-id: 1c517722-c6ed-45af-07e9-08db9ff1f147
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qvO6yprV3jCqVWSpOrbdzG0brVDwdnEUX7J2g1sfE8FYwigiVTKvvGClLOOhjCUfp99xr+Vpm9FzMGCiHTn2RWI/n3S9FNe0jzfRg93JaOZfXWKE6SxMR2xceN5YKPipGRyLNZj9mVg/Q/DLn2+KICFeTIy8FnPkKgConFaU7D5uvad/W9LcX5TA49A0V5x7W3JELgSJEUMQs+CNnQJfn3z746kJoKKIQmxkkj1bYmr4Q3EabJnDODPCcyTXZlJlU7wAzxpGN18FyqRh2GTKQNoWwSX6yvpflMgF6Vm0zZowN/OBTwrc1IKruCj+9xxuRxpMSg1mnLKFoDrIsM5NoW2MvZWob+dIMpNREm+zVeu75H3ntRudtFk1daTAUDIDcGcoOMRitUx5mOVUkgrwbbsvzEJO9uxCwwAd6VHcRSV1xbl76kEyYOQXwK+Pk3wlEOoRlAY5j9OPEkrrFiz/QINOsESANyV9IW/LBHlsp2Cd/94CctefdCpk5oOJIbXDegn5YcKo4HPco4lEeK0ovQmeMm3R5Der0i/7ZPC404p+7ubrMue6WdBILJb/Nv1Kf4C5JN5vBdXnxGgjekytuwSdViJ56QToaFJ9NMy7N/zl6mt5/OcrKAtiAl1qn8GV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39850400004)(396003)(136003)(451199024)(1800799009)(186009)(316002)(2616005)(71200400001)(26005)(6486002)(6506007)(53546011)(6512007)(83380400001)(4326008)(5660300002)(8936002)(8676002)(2906002)(7416002)(478600001)(41300700001)(76116006)(6916009)(54906003)(64756008)(66446008)(91956017)(66476007)(66556008)(66946007)(38100700002)(38070700005)(122000001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVNaVy9RNHFJOUsvZE1zT1VJMFczYUZrdlVFR0xvZFpjak5zdHFXcHRQZG0x?=
 =?utf-8?B?cEVjMjh3RHF2dzFGUUJhUXVkRGZ1dDcwUk90QmhXaERoL1RIR3IreUt2cFJY?=
 =?utf-8?B?VXFrSWxpVGV1Y3FZaVVqQUZOSU9oNERTVVUzWWNPekZaU3dBdUpIRWwzKzVQ?=
 =?utf-8?B?d2w3V1FOZ09OWHRtdFF1SzVOdGl4OWE5RjZicUtac0ZLSFM3RVlqQThxbjRG?=
 =?utf-8?B?Sk54cHE0WFJNYWM2Y08wa0tPbHloLzNjcWFkR0R4akxCZysvSDNtQ2N6SVM3?=
 =?utf-8?B?dXBIbWNYWWxkZXphUjd1V3M4bHpEVzVPSzZjbTZsemtMSklOUnY5bkpxSEZJ?=
 =?utf-8?B?c3RNRzhsajc1RE1KTlArWTE0SkM1SUZPU293d3hCeUE2WWZGU3RNb09peDgx?=
 =?utf-8?B?VG9wZkExZFdtT3BWRnJHRWJrZEh4N0I1QW1UR1ptRUgwNjVsS3NORzFjWHph?=
 =?utf-8?B?emc0MS9EZXBYODZFc3k4RDd2dU1MMS9SbGljZTRZRklUVFczVFB5L01hVUxo?=
 =?utf-8?B?c3M3SWRaL1VmQnJRbVBSZzR4MS93RDZxdXZkdExxTFBPa2k5K0g4d3BUT2xM?=
 =?utf-8?B?a1VVSWtuREpVV2tYVkhEdlZMb2xVaUhzblFoY0UvZzJuVWplRENDbW85bzV1?=
 =?utf-8?B?djJVaDkzaVZOL0hiQlBrSitSMWlFeUVKRmtld1l5V1h6T0VyZlp1clFmdk83?=
 =?utf-8?B?TExST0tGckpWV1Z6NS8xd3dHcWNpRWNTbk5LWUNFOE9lTW5Bd1JiWHA3VGk2?=
 =?utf-8?B?LzlwQ01LdUVoT1cvcHdCMVZIeTVKendSTVVROXFUK2JXSzhYZmtrRE5NWEt0?=
 =?utf-8?B?M0Fpd3ZCSGRVSitRYnhYWmZmNTJ6Y1BXQXFZd2dBdWc1ZzQyT1lTanc1K0Fi?=
 =?utf-8?B?Y0FjY3cvSEhpeGdtZzZ5R0NacnNNTERtU2Z2K0JzejNGREdxTStLc2ZUYUpL?=
 =?utf-8?B?L2I1WkxVTEJyOFNWWXZNSS9TU25rbHhQeVR4QTd1bWdSWGdPK3FQdk52ZDNW?=
 =?utf-8?B?MElxMmdZSWluVWRLVitTck9jdUZ3dDFVZW81cndwU0xEaG9LcitGRkdzM0V4?=
 =?utf-8?B?YXpBZmZxdTdQS1FwcjFqQzduTTVBVzBjbU4xdjkrK2tacGRQbXo2Uzl1UnRm?=
 =?utf-8?B?Vit1Zy9TOE1zRU9TZHBSbEhPa21qOThURDVtaXlUVk9WQ2VCWUk2dStpZDFz?=
 =?utf-8?B?VGRCU3VQQ3M0UFlhS0N2bkF0TzlpQm9oRjVMdkp5YmVJTjdlNmVpNFR0YTlB?=
 =?utf-8?B?ZEtQTzZqVVpsZ1I5NlR6K2NWdWZLUmNFQ3ZyWTEvT0k5L0ZHZjgzaldaQUd5?=
 =?utf-8?B?S2ZhM2lmL0ZUUXRwVUZuZjlmQXUyN3VsMkEzYm5nUzloTG5MSHBGN01jYU9F?=
 =?utf-8?B?aktjcUc3RmNnRGlpMHgwRXpXaDMwL3BxL0VLREZVbFdjdE1Ud3gwR1NiY08r?=
 =?utf-8?B?RlVaZm1BKzJoTVR2YTRpSVZ6VTJJY01NYXVZWlZ0VndzUC9iTTA0dW5nMWgz?=
 =?utf-8?B?OG9FNnFZY2xmYlB6bDI2anZ5Mmd5ZlYwQVNEVGRmRk5aaDV2a0ZweWZMa2NJ?=
 =?utf-8?B?REdFM3RxRGo5VEpod1hoSW5rYmU4cUkxdTQzTGRDenhIdXdncjAwQm5vbEFG?=
 =?utf-8?B?SUxvdlB4QVlDZ3ZRcHhOZElZYkttYzdXZ1RyMEsvT2RTR3g1Mm04UGVqRldz?=
 =?utf-8?B?dDN5TWJTRXlsLzAxckYvQmlVdEJLeHI2ME11aUZyZjltUDBvWDJKZVF0WnVh?=
 =?utf-8?B?VWRCaEZlZ2hvbWp2dm1RZzlHZ05sR2NuSDdhcnpiTGJ2Y0JIb2FxQkNvOXFk?=
 =?utf-8?B?N3M0OHhLNUVneDA2RXJ4RjdtcjIwWS81T1lOZkNLeGxQc3pEYXc2SXJFbmEz?=
 =?utf-8?B?dDY2bjNZd29HSHNyVG5EWk9GQjJWck5wQnhRYXJIQWVFQWNua016WlJGMEx5?=
 =?utf-8?B?TU0vSjBZNjFzZGZSN3RvRFZ6MWx2bXIySUdPMW84QmlpZUdTNm1FaWJzNEJT?=
 =?utf-8?B?NWhSUFdmY0tKcWNWVU9EcXdUOFBkWnhOQnZFQ1hTaE80S2U0MlFuYVNNR3NO?=
 =?utf-8?B?VVRwOXVPcHlMUkdtVFNIOCtESk90UHltZUdHeFdlZGVJUjRsUS8xNlEvQTVV?=
 =?utf-8?B?bjNIdi9GazFmaXJLVW4xNEYxMlcwendwUmg2NSs5OUt0NHFNU2REeVZqMUlx?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23A2D8228E0D064DA7DF31C0F1DEFF82@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c517722-c6ed-45af-07e9-08db9ff1f147
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 13:49:28.6685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NK5N91iasEWEooG6J4F1T8dOVDEEzLakoDAmsiQ2wPNmmO/VcGMmpT+QYa+pPb7MNt+JSXkmcVT1LrP4kppYsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7129
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: cTWIMwV-Q1Zob-i_pdtTSp5OYlT3spiI
X-Proofpoint-GUID: cTWIMwV-Q1Zob-i_pdtTSp5OYlT3spiI
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA4LTE3IGF0IDE5OjQzIC0wNTAwLCBGYWl0aCBFa3N0cmFuZCB3cm90ZToN
Cj4gT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMzoyNuKAr0FNIFNhcmFoIFdhbGtlciA8c2FyYWgu
d2Fsa2VyQGltZ3RlYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+ICsvKioNCj4gPiArICogc3RydWN0
IGRybV9wdnJfZGV2X3F1ZXJ5X3J1bnRpbWVfaW5mbyAtIENvbnRhaW5lciB1c2VkIHRvIGZldGNo
IGluZm9ybWF0aW9uDQo+ID4gKyAqIGFib3V0IHRoZSBncmFwaGljcyBydW50aW1lLg0KPiA+ICsg
Kg0KPiA+ICsgKiBXaGVuIGZldGNoaW5nIHRoaXMgdHlwZSAmc3RydWN0IGRybV9wdnJfaW9jdGxf
ZGV2X3F1ZXJ5X2FyZ3MudHlwZSBtdXN0IGJlIHNldA0KPiA+ICsgKiB0byAlRFJNX1BWUl9ERVZf
UVVFUllfUlVOVElNRV9JTkZPX0dFVC4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBkcm1fcHZyX2Rl
dl9xdWVyeV9ydW50aW1lX2luZm8gew0KPiA+ICsgICAgICAgLyoqDQo+ID4gKyAgICAgICAgKiBA
ZnJlZV9saXN0X21pbl9wYWdlczogTWluaW11bSBhbGxvd2VkIGZyZWUgbGlzdCBzaXplLA0KPiA+
ICsgICAgICAgICogaW4gUE0gcGh5c2ljYWwgcGFnZXMuDQo+ID4gKyAgICAgICAgKi8NCj4gPiAr
ICAgICAgIF9fdTY0IGZyZWVfbGlzdF9taW5fcGFnZXM7DQo+ID4gKw0KPiA+ICsgICAgICAgLyoq
DQo+ID4gKyAgICAgICAgKiBAZnJlZV9saXN0X21heF9wYWdlczogTWF4aW11bSBhbGxvd2VkIGZy
ZWUgbGlzdCBzaXplLA0KPiA+ICsgICAgICAgICogaW4gUE0gcGh5c2ljYWwgcGFnZXMuDQo+ID4g
KyAgICAgICAgKi8NCj4gPiArICAgICAgIF9fdTY0IGZyZWVfbGlzdF9tYXhfcGFnZXM7DQo+ID4g
Kw0KPiA+ICsgICAgICAgLyoqDQo+ID4gKyAgICAgICAgKiBAY29tbW9uX3N0b3JlX2FsbG9jX3Jl
Z2lvbl9zaXplOiBTaXplIG9mIHRoZSBBbGxvY2F0aW9uDQo+ID4gKyAgICAgICAgKiBSZWdpb24g
d2l0aGluIHRoZSBDb21tb24gU3RvcmUgdXNlZCBmb3IgY29lZmZpY2llbnQgYW5kIHNoYXJlZA0K
PiA+ICsgICAgICAgICogcmVnaXN0ZXJzLCBpbiBkd29yZHMuDQo+ID4gKyAgICAgICAgKi8NCj4g
PiArICAgICAgIF9fdTMyIGNvbW1vbl9zdG9yZV9hbGxvY19yZWdpb25fc2l6ZTsNCj4gDQo+IEFu
eSByZWFzb24gd2h5IHRoaXMgaXMgaW4gZHdvcmRzPyAgSXQncyBub3QgcmVhbGx5IG15IHBsYWNl
IHRvIGhhdmUgYW4gb3BpbmlvbiBidXQgdGhhdCBzZWVtcyBsaWtlIGtpbmQtb2YgYSBmdW5ueSB1
bml0IGZvciB0aGUgc2l6ZSBvZiBhbiBhbGxvY2F0aW9uIHJlZ2lvbi4gV2h5IG5vdCBqdXN0IGJ5
dGVzPw0KDQpUaGlzIGlzIGEgaG9sZG92ZXIgZnJvbSB0aGUgY2xvc2VkIHNvdXJjZSBkcml2ZXIu
IEl0IGNhbiBiZSBjaGFuZ2VkIHRvIGJ5dGVzIGlmDQp0aGF0IGlzIHBhcnRpY3VsYXJseSBkZXNp
cmVkPw0KDQo+ICsvKioNCj4gPiArICogc3RydWN0IGRybV9wdnJfZGV2X3F1ZXJ5X3F1aXJrcyAt
IENvbnRhaW5lciB1c2VkIHRvIGZldGNoIGluZm9ybWF0aW9uIGFib3V0DQo+ID4gKyAqIGhhcmR3
YXJlIGZpeGVzIGZvciB3aGljaCB0aGUgZGV2aWNlIG1heSByZXF1aXJlIHN1cHBvcnQgaW4gdGhl
IHVzZXIgbW9kZQ0KPiA+ICsgKiBkcml2ZXIuDQo+ID4gKyAqDQo+ID4gKyAqIFdoZW4gZmV0Y2hp
bmcgdGhpcyB0eXBlICZzdHJ1Y3QgZHJtX3B2cl9pb2N0bF9kZXZfcXVlcnlfYXJncy50eXBlIG11
c3QgYmUgc2V0DQo+ID4gKyAqIHRvICVEUk1fUFZSX0RFVl9RVUVSWV9RVUlSS1NfR0VULg0KPiA+
ICsgKi8NCj4gPiArc3RydWN0IGRybV9wdnJfZGV2X3F1ZXJ5X3F1aXJrcyB7DQo+ID4gKyAgICAg
ICAvKioNCj4gPiArICAgICAgICAqIEBxdWlya3M6IEEgdXNlcnNwYWNlIGFkZHJlc3MgZm9yIHRo
ZSBoYXJkd2FyZSBxdWlya3MgX191MzIgYXJyYXkuDQo+ID4gKyAgICAgICAgKg0KPiA+ICsgICAg
ICAgICogVGhlIGZpcnN0IEBtdXN0aGF2ZV9jb3VudCBpdGVtcyBpbiB0aGUgbGlzdCBhcmUgcXVp
cmtzIHRoYXQgdGhlDQo+ID4gKyAgICAgICAgKiBjbGllbnQgbXVzdCBzdXBwb3J0IGZvciB0aGlz
IGRldmljZS4gSWYgdXNlcnNwYWNlIGRvZXMgbm90IHN1cHBvcnQNCj4gPiArICAgICAgICAqIGFs
bCB0aGVzZSBxdWlya3MgdGhlbiBmdW5jdGlvbmFsaXR5IGlzIG5vdCBndWFyYW50ZWVkIGFuZCBj
bGllbnQNCj4gPiArICAgICAgICAqIGluaXRpYWxpc2F0aW9uIG11c3QgZmFpbC4NCj4gPiArICAg
ICAgICAqIFRoZSByZW1haW5pbmcgcXVpcmtzIGluIHRoZSBsaXN0IGFmZmVjdCB1c2Vyc3BhY2Ug
YW5kIHRoZSBrZXJuZWwgb3INCj4gPiArICAgICAgICAqIGZpcm13YXJlLiBUaGV5IGFyZSBkaXNh
YmxlZCBieSBkZWZhdWx0IGFuZCByZXF1aXJlIHVzZXJzcGFjZSB0bw0KPiA+ICsgICAgICAgICog
b3B0LWluLiBUaGUgb3B0LWluIG1lY2hhbmlzbSBkZXBlbmRzIG9uIHRoZSBxdWlyay4NCj4gPiAr
ICAgICAgICAqLw0KPiA+ICsgICAgICAgX191NjQgcXVpcmtzOw0KPiANCj4gV2hlcmUgYXJlIHRo
ZXNlIHF1aXJrIElEcyBkZWZpbmVkIGFuZCB3aGVyZSBkbyB0aGV5IGNvbWUgZnJvbT8gSWYgdGhl
eSdyZSBlZmZlY3RpdmVseSBjb21pbmcgZnJvbSBoYXJkd2FyZSwgcG9zc2libHkgdmlhIGZpcm13
YXJlLCB0aGF0J3MgcHJvYmFibHkgb2theS4gIFRoZSBpbXBvcnRhbnQgdGhpbmcgaXMgdGhhdCBx
dWlya3Mgc2hvdWxkIG9ubHkgZXZlciBnZXQgcmVtb3ZlZCBmb3IgYW55IGdpdmVuIHBpZWNlIG9m
IGhhcmR3YXJlIG90aGVyd2lzZSB5b3UgcmlzayBicmVha2luZyB1c2Vyc3BhY2UuDQoNClF1aXJr
cyBhcmUgZGVmaW5lZCBpbiB0aGUgZmlybXdhcmUgaGVhZGVyLiBUaGUgYWN0dWFsIElEcyBhcmUg
ZnJvbSBvdXIgaXNzdWUNCnRyYWNraW5nIHN5c3RlbTsgdGhleSdyZSBzaGFyZWQgd2l0aCB0aGUg
Y2xvc2VkIHNvdXJjZSBkcml2ZXIuIFdlIGFyZSBhd2FyZSBvZg0KdGhlIG5lZWQgdG8gbm90IHJl
bW92ZSBxdWlya3MgZm9yIGEgZ2l2ZW4gR1BVLg0KDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3Qg
ZHJtX3B2cl9kZXZfcXVlcnlfZW5oYW5jZW1lbnRzIC0gQ29udGFpbmVyIHVzZWQgdG8gZmV0Y2gg
aW5mb3JtYXRpb24NCj4gPiArICogYWJvdXQgb3B0aW9uYWwgZW5oYW5jZW1lbnRzIHN1cHBvcnRl
ZCBieSB0aGUgZGV2aWNlIHRoYXQgcmVxdWlyZSBzdXBwb3J0IGluDQo+ID4gKyAqIHRoZSB1c2Vy
IG1vZGUgZHJpdmVyLg0KPiA+ICsgKg0KPiA+ICsgKiBXaGVuIGZldGNoaW5nIHRoaXMgdHlwZSAm
c3RydWN0IGRybV9wdnJfaW9jdGxfZGV2X3F1ZXJ5X2FyZ3MudHlwZSBtdXN0IGJlIHNldA0KPiA+
ICsgKiB0byAlRFJNX1BWUl9ERVZfRU5IQU5DRU1FTlRTX0dFVC4NCj4gPiArICovDQo+ID4gK3N0
cnVjdCBkcm1fcHZyX2Rldl9xdWVyeV9lbmhhbmNlbWVudHMgew0KPiA+ICsgICAgICAgLyoqDQo+
ID4gKyAgICAgICAgKiBAZW5oYW5jZW1lbnRzOiBBIHVzZXJzcGFjZSBhZGRyZXNzIGZvciB0aGUg
aGFyZHdhcmUgZW5oYW5jZW1lbnRzDQo+ID4gKyAgICAgICAgKiBfX3UzMiBhcnJheS4NCj4gPiAr
ICAgICAgICAqDQo+ID4gKyAgICAgICAgKiBUaGVzZSBlbmhhbmNlbWVudHMgYWZmZWN0IHVzZXJz
cGFjZSBhbmQgdGhlIGtlcm5lbCBvciBmaXJtd2FyZS4gVGhleQ0KPiA+ICsgICAgICAgICogYXJl
IGRpc2FibGVkIGJ5IGRlZmF1bHQgYW5kIHJlcXVpcmUgdXNlcnNwYWNlIHRvIG9wdC1pbi4gVGhl
IG9wdC1pbg0KPiA+ICsgICAgICAgICogbWVjaGFuaXNtIGRlcGVuZHMgb24gdGhlIHF1aXJrLg0K
PiA+ICsgICAgICAgICovDQo+ID4gKyAgICAgICBfX3U2NCBlbmhhbmNlbWVudHM7DQo+IA0KPiBD
YW4geW91IHByb3ZpZGUgc29tZSBleGFtcGxlcyBvZiAiZW5oYW5jZW1lbnRzIj8gTm90IHRoYXQg
eW91IG5lZWQgdG8gcHV0IGl0IGluIHRoZSBkb2NzLiBJJ20ganVzdCB0cnlpbmcgdG8gdW5kZXJz
dGFuZCB3aGF0IHRoaXMgQVBJIGlzIGRvaW5nIHNvIEkgY2FuIGJldHRlciByZXZpZXcuIEFnYWlu
LCB3aGVyZSBkbyB0aGVzZSBjb21lIGZyb20/IEFsc28sIGhvdyBpcyBhbiBlbmhhbmNlbWVudCBk
aWZmZXJlbnQgZnJvbSBhIHF1aXJrPw0KDQpFbmhhbmNlbWVudHMgYXJlIGNvbXBhcmF0aXZlbHkg
bWlub3IgaW1wcm92ZW1lbnRzIGluIEdQVSBzdWJyZXZpc2lvbnMgdGhhdCBkb24ndA0KcXVhbGlm
eSBhcyBhIGZ1bGwgInByb2R1Y3QgZmVhdHVyZSIuIEEgY291cGxlIG9mIGV4YW1wbGVzIHdvdWxk
IGJlIDM1NDIxLCB3aGljaA0KaW1wcm92ZXMgY29tcHV0ZSB0aHJlYWQgYmFycmllciBzdXBwb3J0
LCBhbmQgNDIwNjQsIHdoaWNoIGFkZHMgbWFzayBzdXBwb3J0IGZvcg0KdGhlIHBpeGVsIGJhY2tl
bmQuIEFzIHdpdGggcXVpcmtzLCBlbmhhbmNlbWVudHMgYXJlIGRlZmluZWQgaW4gdGhlIGZpcm13
YXJlDQpoZWFkZXIsIHdpdGggdGhlIElEcyBjb21pbmcgZnJvbSBvdXIgaXNzdWUgdHJhY2tlci4N
Cg0KVGhhbmtzLA0KU2FyYWgNCg0K
