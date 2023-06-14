Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAD730253
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 16:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B341B10E054;
	Wed, 14 Jun 2023 14:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 908 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 14:50:34 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7102510E054
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 14:50:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35ECi1i5032550; Wed, 14 Jun 2023 15:35:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=56z9jVsvBhv8g4s2+qohL/w5ehKuSkRaS1L6WafoOQU=; b=
 ISGYsq3NoG3kBs4DG6aH1cDem/l5ZQ+icxm+5yGUbnA5PqYWhvjA2WUxc5qfyjuU
 jc2ZWHySkKtj15DvGzpXVQIOKDgcih/nc8oVd15CwXKlxfLXr/zoBfDyjfbXf7Nw
 mHJZgftBPi5qdt1FFZXZNDLLyRNeXG0yoeLExMp8ODNDirtCJleNABqzSDY7o/ZZ
 +YrqOErBDqRpln215d17cgqguLfUG5eodOdghfFTdgN8GmJ2BSVHrVyJpPJjYhEb
 3FBOe8P2WNNdWFp2A42kZy4v/O9w0eAtEfbZbyCkIAfpqk1wq6lZfXdLKuu/Cu9p
 foKrPBlhztK+qWBxQxYQ1g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbtsrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Jun 2023 15:35:00 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 15:35:00 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 15:35:00 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTialDRwByPJgu6OiDCHY1DiOAAEkXuCTrxNfRUGHeb+ApcE9/jdyZFR12irsu6LKaBMscHXgT5GBVAiM+1UzaH/DUcRH5/WToq23fvetc/dUIbGFEAXs/iiNm9udMb+ZaiuB3NnYdmcTnP+0elyhTXfE7mLDU9tTtd5ax+NlYM8N4VdCMmPUwkaD9kbqWIN02S5EUzWJzHwpLYViaCNzp4p3WSeA+q6wIo4kHeGxHy+TCbbcO8QBW84maFkCQp7S5/ofZU2cpEgKiFBuuIiANahJya3VN2mTURu8uFDG/XGLdfXl3Dh3gaoo3d3TMFjKZwNXY2+bhvcKcUdbOUNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56z9jVsvBhv8g4s2+qohL/w5ehKuSkRaS1L6WafoOQU=;
 b=YpTfrWv3iLyr/L2ngIJY5/mYZ3iJi6plt5IDywD6NwMhrf3iLqUPcXyoUldgm5hLAQ4A8++ofikKxA7hwydmGi14RjMVi6m2m2KopQ3xvUpr8DQtMJZp0TQLJ57DfK6GbkWvOkySTbfrWQ8IhnJvHfLKM7ovJkAFVnPshgQXGZF1E3Z+5KWv2D4m+80RX+i+wmpnMD9a8yjwAZ+WyIMKJovRh3+asYSjGvmkn7u4Y/rqVWBwkSYTsSBnIDR7QTM0Pbtp/uWBdWVdwMFxu0nVh3tB0IbiTDK8ZesAex0pWkcp8MXApCuSJLOHFHBf42nh6pvIXDTK1pz/wpFmXSPebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56z9jVsvBhv8g4s2+qohL/w5ehKuSkRaS1L6WafoOQU=;
 b=ZG07abORq0CQeMFH4brIkfoH9RnyUNklCbdWeubDaGFFO1au8YeRgY1WoKXo5+LaEiMigkyyjCUElJUFNLjC/EzRxzWc4wK2CnLvAeMn6QsGCyUaflEkhuUm6V/WOt5jP3N1Wg9EVnphBeJ/IQ8SaQKDAehSVo/0suw1LxyMAoM=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB6948.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Wed, 14 Jun
 2023 14:34:53 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f976:8df8:e81:d5f4]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f976:8df8:e81:d5f4%3]) with mapi id 15.20.6500.025; Wed, 14 Jun 2023
 14:34:53 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Sarah Walker" <Sarah.Walker@imgtec.com>,
 "krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZngYUJoX1+qc/Fkehz30lNP0fw6+JDJSAgAFSIgA=
Date: Wed, 14 Jun 2023 14:34:53 +0000
Message-ID: <b6525b3f1d84926986ad1ee58bddb42166e8e3e1.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
 <07f8fc79-cdd8-4d21-5a91-0966abbb0eed@kernel.org>
In-Reply-To: <07f8fc79-cdd8-4d21-5a91-0966abbb0eed@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB6948:EE_
x-ms-office365-filtering-correlation-id: 76b46813-f0b4-4d0d-8eac-08db6ce48477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VfFx1x2dHphdd4fpau0QUC9Oq26vU+AmbCYcZsaS0mLBH4U0tto7gycXMqXn+SfwvJonr9XKockEafWcoG85V5uHIDf4/UwYg4WXXcIDX4yIjS7XVFTVeubKeuS/q4Qfrz7H/9lp2GJ8JoThRw42V8HhycEBy9HHJAWY/2kWUB9VoS6MfU3j+tDUI34/zwPk3Tdiz4HYZBJ3dDgwNsnuxZptoDwkxCXNl7ER3Dsn6OsRZEiA3pbWSorWNp9Se7hcg/nnrXNg2i6Q4gUwYtmDUzkMgnnBhGP38Uz5Ymwas6eFDCF0Jn7h2M0SMLob4gL52Kv5QD1yRT4OH4ZZat4i6v5OzHwylm9zogBpZltzXE8TQtC3NQGP3ul9yhg2JaASLqE1cwrMZZcaKDGFaaKD80zHkbHnNP2hMccTiyfkYMuSM5G1ROW3Mj7Sqm2ttyE539fOtsFdqkBlUanGwR53nr28jY8ri7pOni970lr5+ic2Z7niBGxveCKTNMv7DrIc0WgCjzgZ8+BRajKCIRO7GhFvY17cMI6C7GpxCiDoj31i7MfsfctTedoSv8yL3HNE4MIf165SsGhuAufHqNLl8Ne0UerWuq+DdJRZgl3hM8aUPXou+JL9nKDmk6wGGHjk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199021)(122000001)(38100700002)(86362001)(38070700005)(8676002)(5660300002)(316002)(8936002)(41300700001)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(4326008)(83380400001)(110136005)(54906003)(2616005)(186003)(478600001)(53546011)(26005)(6512007)(36756003)(6506007)(71200400001)(2906002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUhpaG1tUklGRjhxVjdJRTdhS2VJQXJyQW9wT3dpY2EyMGEyRVZhcTE4RE9U?=
 =?utf-8?B?VFh0bnVxU3o1Vjg1VzJsZThlaDN4cEVMNkFVQ1pIeUg2TnB1dE0xTVZPajVr?=
 =?utf-8?B?S0hFY1ZFTXAvQ3c0dTlyU24yK2Y4b0s0bTZjSkZLUnhpT0lndmQ5VFFlU3I1?=
 =?utf-8?B?bThZMmlyK1BISUsvLzh2blczSFhoOTI2czNkVnhoWGxwSnRxb2VVQlNOR2c5?=
 =?utf-8?B?RmNpU0ZOL3c2Y2JLSG1Gdk5ZZGVyRTB5UzVycXdPZEp0bHRwdm1sQlJWS3h3?=
 =?utf-8?B?Q2wyNCtkanRueGI3V2FubG1naVZ0dmxDM0JlNXBQN2lqaUQ2SmJiK2RBaDVK?=
 =?utf-8?B?VzNONjZ2UlhVaHBINmFGZ1BDYXJGeThoY3BnYVN6TDhYUkI0aFQwWSsybHFw?=
 =?utf-8?B?aHlPSTYzbVZzMDMvaTZmTkZkMk15SzVEdi8vbGJ3Q1p6bEJhM3J1djN6Nm5G?=
 =?utf-8?B?Y3c5RXRLYmFMVXRZb2M4aUU2QmM0bU5qSXV6eCtPTlo3UVJTQWhSODVoWVB6?=
 =?utf-8?B?R3lEalpsbnBldTJJZEtYalRmbnFFTmkvbXNKdnV1U1Y2Qk80K2Y2Q3hRVkFa?=
 =?utf-8?B?V051ZXQ3TEU1QmV1d2ZKRzdpRm9NSmFCTmR4WU82QW9hYWxQb1VnUW0yRTFa?=
 =?utf-8?B?ZEU3bkNZOUhGYjZHV3hTc0hvbmZ5dEpsMTZJUENIZkZ1TmMrZkJpNm05TDJx?=
 =?utf-8?B?amxQdk5zZm9Mbmthemc0dWdKQ2lwUmp3NGtDVVZGZkJJbzF1SDY1emtScDZ6?=
 =?utf-8?B?MkRmNWlPeThCaERnTmhkODNPVXFDc1hwd0twV1FBSUwvaTN0aFFqeStRU2k2?=
 =?utf-8?B?R0JXQ0x4SldvSkFZbytSUXpWL0RRejZrSDdTeklmVFNqcCswZkZpMlhBY1lj?=
 =?utf-8?B?MjhlRWZwOVpBZ3BrYTJLWGJrTmRtSmg5TnBsWUlJMldra2tmWUk3U3ZUbGQ5?=
 =?utf-8?B?M1VuazhPNDF4d2k5VlVpclpEaEhydVBoNjdGSWN1dFY5Nkk2dXJReWdINlJZ?=
 =?utf-8?B?eFl5NlhGWGpCYVBkNkxLUVNIbTd6bGdJZzVZNTdBaE9qMkNJeGs0N3dKckRS?=
 =?utf-8?B?djhWZnM3WGpDQTdlb2J0ajlQcWE1akFFWUgrblUxL1REb2dJaGMyUndpUC9q?=
 =?utf-8?B?YU1IaHU4T0ZOam9hRXltQ0UvSTlsMGNTM0J4OEFLNHdoNUdsUTQ1K2l0Mm1s?=
 =?utf-8?B?cFBOSmFwdGVvYlRZUmYxbkNiR2RCSjFValhvNVZiVG1CTHJaa3dPN0FmNURS?=
 =?utf-8?B?NlQzb0ZPcFZrSlFXeDlEN0x4aEgrQ0RhaFpad3oyOE9KNU45QmtFaGwwSFNG?=
 =?utf-8?B?dWxoNVY1UzZucVQ1MU4wdldzbkQrVXNoU0Q4QkFoc0lFc3RxdkZ1TzVNZEFW?=
 =?utf-8?B?N1lYbzZ1RVlGQkY0N1Y1NTVPb0NrcFRqQ242RmFZNmpiaENoblZlaExOZ3dx?=
 =?utf-8?B?SXZ1cXRnNDJvL09EbGYyNmx4M2Q1b2ZGbXFIVUxtMUhaWEhTU09vVnRjVU82?=
 =?utf-8?B?dkpKK2djMThvS3RyUkRiSC9sNThTVDdWQ0NLbHdodXpPYmRibkw5akFRSENu?=
 =?utf-8?B?eXpXdTQvUEZVeHgxbG9UTVlWVHd5UXhMUjd1dTZzd0xXNXMzUHZGc3psWjN6?=
 =?utf-8?B?RVM0MEdyRGxIVmEwaWRrbXd1MjFSRkVVc2t4VWl1MmtJMHNpRlpjUkU2Si9r?=
 =?utf-8?B?NnhmMk9qNERaMy96bG9mQ0FVYUNTRnVzU095a1BFLzR1Q0QxaWRpRXZpVllm?=
 =?utf-8?B?U2s2Q2hvaDVsZ2F6eGQ4dnUyZnFML2dyNFRMTXFrTGVKVStLNHVHdW5OdW9v?=
 =?utf-8?B?TDNjWXp0NEdNL1B4S1JwR0MvOGRTVk1tVlJuRThRTkFLN1hXWlNHSEdiTU9p?=
 =?utf-8?B?OWJoR3JUNXc2T2FPb1E3NWRjK0VLbUpNNExvUDQ4VTI2VFBDbUhCOWg0b01V?=
 =?utf-8?B?aHBtdlNtTVkvTzFBRHdsRWQyaXM3Z1YyaHliNlZZdkJkZGdmQjJoRWJwckxJ?=
 =?utf-8?B?U1dUS0ptQVdCMHA2TWFDR2NRZWQrdUNpN0V2QTM5SkU3alo5RU03K2FiY1R0?=
 =?utf-8?B?OHZseGZvUVJZb2UyVDI4ZU9jRDNCR1hweFVvS0hIdUVuaHc3eGpzWWh0b1JE?=
 =?utf-8?B?VzluNC9JY1MwOXRsQk03WlBxWGVjYS94MVhEUGZKOXZLakZYYzhOUzJKcE5l?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD8AF09861E9004F963D2885B17F3808@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b46813-f0b4-4d0d-8eac-08db6ce48477
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 14:34:53.3648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NyvL7IN29K3EmJdNzlzxC3YqIFzDuM67OF8mwA9f93bGv0fxmnKxqc07b9vY4T9LHXsem7YncttetOFg9YwpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6948
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: ccXQlMUy-b2sGpyxl8n2JLRme8pfWoSZ
X-Proofpoint-GUID: ccXQlMUy-b2sGpyxl8n2JLRme8pfWoSZ
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
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjMtMDYtMTMgYXQgMjA6MjQgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDEzLzA2LzIwMjMgMTY6NDcsIFNhcmFoIFdhbGtl
ciB3cm90ZToNCj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIFNlcmllcyBBWEUgR1BVIHVzZWQgaW4NCj4gPiBUSSBBTTYyIFNvQ3MuDQo+ID4gDQo+
IA0KPiBJIGRvbid0IHNlZSBpbXByb3ZlbWVudHMuIFRoYXQncyBhIE5BSyA6KA0KPiANCj4gVGhp
cyBpcyBhIGZyaWVuZGx5IHJlbWluZGVyIGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuDQo+IA0K
PiBJdCBzZWVtcyBteSBwcmV2aW91cyBjb21tZW50cyB3ZXJlIG5vdCBmdWxseSBhZGRyZXNzZWQu
IE1heWJlIG15DQo+IGZlZWRiYWNrIGdvdCBsb3N0IGJldHdlZW4gdGhlIHF1b3RlcywgbWF5YmUg
eW91IGp1c3QgZm9yZ290IHRvIGFwcGx5IGl0Lg0KPiBQbGVhc2UgZ28gYmFjayB0byB0aGUgcHJl
dmlvdXMgZGlzY3Vzc2lvbiBhbmQgZWl0aGVyIGltcGxlbWVudCBhbGwNCj4gcmVxdWVzdGVkIGNo
YW5nZXMgb3Iga2VlcCBkaXNjdXNzaW5nIHRoZW0uDQo+IA0KDQpBcG9sb2dpZXMgZm9yIG5vdCBp
bmNsdWRpbmcgYSBjaGFuZ2UgbG9nIGZvciB0aGlzIHBhdGNoIGFuZCBmb3Igbm90IGhpZ2hsaWdo
dGluZw0KdGhhdCB3ZSdkIG1hZGUgY2hhbmdlcyBpbiB0aGlzIGFyZWEgaW4gdGhlIGNvdmVyaW5n
IGxldHRlciBhcyB3ZWxsLiBUaGlzIHdhcyBhbg0Kb3ZlcnNpZ2h0IG9uIG91ciBwYXJ0Lg0KDQpU
aGUgY2hhbmdlIGxvZyBmb3IgdGhpcyBwYXRjaCBpcyBhcyBmb2xsb3dzOg0KKiBBZGRlZCBjb21t
aXQgbWVzc2FnZSBkZXNjcmlwdGlvbg0KKiBEcm9wcGVkIHF1b3RlcyBmcm9tICRpZCBhbmQgJHNj
aGVtYQ0KKiBEcm9wcGVkIHJlZyBtaW5JdGVtcw0KKiBEcm9wcGVkIF9jbGsgc3VmZml4ZXMgZnJv
bSBjbG9jay1uYW1lcw0KKiBEcm9wcGVkIG9wZXJhdGluZy1wb2ludHMtdjIgcHJvcGVydHkNCiog
QWRkZWQgbWlzc2luZyBhZGRpdGlvbmFsUHJvcGVydGllczpmYWxzZQ0KKiBSZW1vdmVkIHN0cmF5
IGJsYW5rIGxpbmUgYXQgZW5kIG9mIGZpbGUNCg0KV2UnbGwgYmUgc3VyZSB0byBpbmNsdWRlIHRo
aXMgaW5mb3JtYXRpb24gZ29pbmcgZm9yd2FyZHMuDQoNCldlJ3ZlIGFsc28gcnVuICdtYWtlIGR0
X2JpbmRpbmdfY2hlY2snIGFuZCB0aGVyZSBhcmUgbm8gcmVwb3J0ZWQgaXNzdWVzIHRoYXQgd2UN
CmNhbiBzZWUuDQoNCkFzIGZhciBhcyBJJ20gYXdhcmUsIHRoaXMgc2hvdWxkIGNvdmVyIGFsbCB5
b3VyIGZlZWRiYWNrIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uDQpvZiB0aGUgcGF0Y2guIE9mIGNv
dXJzZSwgd2UgbWF5IGhhdmUgbWlzc2VkIHNvbWV0aGluZyBvciB1bmludGVudGlvbmFsbHkNCmlu
dHJvZHVjZWQgbW9yZSBpc3N1ZXMuIFdlJ2QgcmVhbGx5IGFwcHJlY2lhdGUgaWYgeW91IGNhbiBo
aWdobGlnaHQgYW55dGhpbmcNCmVsc2UgdGhhdCBuZWVkcyBmaXhpbmcgYW5kIHdlJ2xsIG1ha2Ug
c3VyZSB3ZSBhZGRyZXNzIGl0IGluIHRoZSBuZXh0IGl0ZXJhdGlvbg0KYW5kL29yIHJlc3BvbmQg
dG8gaW5kaXZpZHVhbCBwb2ludHMgd2hlcmUgbmVjZXNzYXJ5Lg0KDQpUaGFuayB5b3UgZm9yIHlv
dXIgZmVlZGJhY2sgc28gZmFyLg0KDQpCZXN0IHJlZ2FyZHMsDQpGcmFuaw0KDQo+IFRoYW5rIHlv
dS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K
