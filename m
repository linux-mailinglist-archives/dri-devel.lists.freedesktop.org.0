Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456D509078
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 21:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8AD10F1CD;
	Wed, 20 Apr 2022 19:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4955110F1BF;
 Wed, 20 Apr 2022 19:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzYI3UwVE5KceTfrZJCC0sPiIUQOIEvTBceagjBmhRVs/If3jAkgBYRZfMpl3wlODFY9LItWMCymNHLwNYMVesqeOfITWRrrIiMKNfXd7a5IOr4mPPzmbwV5kaiHxJBi1yB97JRlkCT2B5NjF2oYxBR+VGymRcx357+xL1lELgLkGO5fAcTk1nlO8F0KZlgHj2ok0RHj3AQfc7ynTZbwYanyyYhHWLHztGAfj1OqwXlKmAmFcpnrUR2Ng39kWtNii69w+BzhAM5D9HrQLh9gj6fzCP8z9fyrRUGtiJhJBAaOqvPy9uBqcqYRIVSP3aKtnmTzjHUfHNA2Ks20cVzTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWL8P3mdr38OJ7SbtrOt8UaibS6ZfV3odrntJD8orDA=;
 b=WF7t7enOP//MOupt0JkmOf1DlYs3EEgralfJDXrwFLaV9U9rzF4Uuk3pUSMdwAZ8kvZNyqgN5eswzT58Kwb9mn9KqX82/ZLqgYqy5B8hEyXpE46n5C+u+m2IFf1DA7hC70Mwx91vueh/jbSIF3quC9Z4DPiDj8KLNLJ/cTQk0hLqmyfPhXatrzH6hv8jJV/cfdG1sAEbfrCP0W6y/NeF/U09gqpLm7XPTaXW/sZrZKNE6i9rbqBinK9XSwCiSo3R9WBzZZ1S0KJF6ZTsGZsAc3jc85wLAL3b0SC5xDckI0rS+fKljSGb2jRqbY0uJPPBQAal7AldmW4HlfsRCpj/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWL8P3mdr38OJ7SbtrOt8UaibS6ZfV3odrntJD8orDA=;
 b=0hNBpzFpetRoIoW1aG6I5yIiqTbHMwggWx6aobd6YYL34TimhEn/NHqbgKm4p6eyeIagPBAdVJooePWvYaQT0VpWLmRZSJsPys1/6cvKCVwS+0HxXsDMRb/T7PGEQT58ZEX9q/kSrVONC471QdermRj9j/odyJiiWYOq/mjFilc=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BL0PR05MB4962.namprd05.prod.outlook.com (2603:10b6:208:89::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.6; Wed, 20 Apr
 2022 19:28:54 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 19:28:51 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Topic: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Index: AQHYSl3exfVYH/xFlEu2kvqVBiXOdKz4QIGAgAA93oCAAKfqAIAAAGQAgAARGQCAAAJVgIAAAeMAgAAI/wA=
Date: Wed, 20 Apr 2022 19:28:51 +0000
Message-ID: <5d699ffa903b5e54e8660367c3b46f07c86f4c55.camel@vmware.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
 <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
 <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
 <e1c60e2a1478c406f515d51608a751fdc9feff3a.camel@vmware.com>
 <baa19a2d-6ad9-63ea-20f4-284a794f8998@amd.com>
 <ac12f900-fb47-37d6-9a1c-ac44bc711069@gmail.com>
In-Reply-To: <ac12f900-fb47-37d6-9a1c-ac44bc711069@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7d92c6d-418e-41c3-7dd3-08da2303ffef
x-ms-traffictypediagnostic: BL0PR05MB4962:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BL0PR05MB4962664BE9ED882329726CFECEF59@BL0PR05MB4962.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGHeVFqtxJ+RG9WLQdt9dQWpt/+cGQIKFDkbabujA7WnLPu/CoPcRld81dbRWuRw+hYDYlgOxhTGS/UEM3laRzmLWupGwXjFRGun1tDM6IcgwpK78Mj4qj42FiTsoqNSjlO2wrlYLMP3PESR4Y7hWNWPuag0GMpBN/u0rHf2NG5Zwq+EEynQUAtublFspWCOYHIEe+nrEXNg6qlbob8H4BvVJj6DB/kqet9o5f6lAFiRfK1ny7cNNSD7iqkqTJc/ZBlh8N0vliYsz3SxyWvy6XGchb8qBQMcN6yU6SFmKNnVKZ3jdNY7bMIsLTJrUQmMJTnKdTybMy+tL568ZqQdsRkaveQaJg11vifF+5aVoxp8n4EIWgYiilLaCG8vKlrmZziQKfLTbI4RvG2ckJgiM6tCPjGa6ofvgQiYlee2fD3EXnpeUSj04i/LcJdFisZs9gjxu1R1d92IlXp/ubN9wsOVwiILJq4xDtJLKvY1Fz8eXgH1+ohh3+C8jpTXLLTVX/A9tEcCexzOGTZlk1M7H7Tro07dy+3O+URMgwALZFagE2es7r5NUeEGVGhpUtuYCq7MY//GsZm7sBxf25F+jdwRNwZNZb5ZYLbgzsC86o8dqV42Ywan8OQQ/S8UVCNDHVLhZTVFqau2x4pJZvcDa8SgEbGwdEXK4UXtAW8JqNWnPlimMJp98PcwOfdOssFV5kI6LMaC0j3fSOD2LeJZCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(508600001)(4326008)(26005)(6512007)(6506007)(186003)(76116006)(6486002)(66946007)(71200400001)(110136005)(91956017)(8676002)(316002)(36756003)(64756008)(66556008)(86362001)(38070700005)(66446008)(122000001)(66476007)(5660300002)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTdIWVc2MUdoT2h4WG5MVXlJcHA5cDdQYWxqNVBMYnVYS1EyVmt1aHBRQzB0?=
 =?utf-8?B?YStIRFc5M1VtRUI2bDJOZmx6TWdmQUF0RVNNZlNPam9lbWVLZ0RjbU56MmdC?=
 =?utf-8?B?VW12ZmJ5ZWdnK01jcjRsazBBbVN6UWhhaktsWFJxWEVhazcwSTRBTFU1ZzZR?=
 =?utf-8?B?Q2dWMEtyS1gwbU43WFF3Z2ZOclZyakZJd0R3eWtOQXJlYmlCUytVUkhnK1Jr?=
 =?utf-8?B?RkpjYkl0SnlSLzN5NkFUQkVCV1ovUkpXcy9RcGhMTlFNbk5pQkJJRENrbVdl?=
 =?utf-8?B?dnJXWWxhL2xCcHMwT3NpYkZTb3kveVVQSmxocEIvQzVvWHhleHlCQTJHMXlY?=
 =?utf-8?B?MnlLdmVSTmt5S2JlSmV1d28xNkRkL0ROSnljdVBadDl3eFYwVVZJckYxUjhP?=
 =?utf-8?B?WW9zTDAwWExiNWErR1BxYXAvWStVYmRHK1BUa21vR1AvUk5KbUtUaDVKTWZn?=
 =?utf-8?B?bnpyMEZmSVdxbk8rcXB2Nyt6MXpYd0Z1UEFrWTJ2VkNvOTRSWWprQitYT2Zm?=
 =?utf-8?B?cW5KN3IvdHNxNGVZT3VEZURvNDUzRFVZd05CSmdHMlFscUw1bENoaEZQV2FR?=
 =?utf-8?B?ZSsxMzRyb0tSbytPMEQwUjFnN05Wc1JhK1RmMEtlZjd3WGwrcjV6ZzBIb0Vi?=
 =?utf-8?B?dWFPdzBoUmxTeGFnM1JTSmV5NHRzTWU3U1F0ZlJwMlRNNEwySHJiVUJGeVVx?=
 =?utf-8?B?YmM4aGVTR3F2eHowa1h2MUc5UnhHdnRxREJIcVNmMzVZY25EeGRxTFBPMFlK?=
 =?utf-8?B?Y2puQVNWcGlFY3JRQ3ZtR2w4R3pHTGdhbmxQcEZpWTF6VUxmaTN0TTlmSmlJ?=
 =?utf-8?B?bDdEK0VZdXpIdHVPNU50VldEVjFBSytpWTdVdEJybjROWkxZck9aSFpNQzN0?=
 =?utf-8?B?SWY2bVhrUTUyaWJjL21QWU9pYTYxcnpvWEcrdkp2bDEyQVRpVjVodGRHdXdx?=
 =?utf-8?B?QXZzRWkrTzR2Mld2c2NMa1REMWN5NmtlMFE3SGtKVWlQMHpFVjR3ZWM4YnZS?=
 =?utf-8?B?N0lFNVlVWUNVN2d3SkpoU3JWdEt2L3VEU2dDc2lzeHBUbmYxVUVMUjNzSGp2?=
 =?utf-8?B?UFVpdE5yT29pck9YR3VSbFVYZHJma3gwSmJQN3lMV0Q0T1VXOXorNC9lWmtv?=
 =?utf-8?B?bDZEd0dwbVNnNllWa2VHVUxkQ3lGd3QxQ09rbGFDenRPeEdsZWlMV1ZOdFpQ?=
 =?utf-8?B?RjMxUEd5TVdkMGZobTArZEYvY1dYTFlZWmZJelIrMVE1MjRJRktneFEwY1JP?=
 =?utf-8?B?ZzNLS0NkaW4wcnI4RGw5M2F4eExoL29VS3I1czBSK0tMU3hXUzFTQUh3REo1?=
 =?utf-8?B?UUxrLzA5RjRSZ0RQMithalBOMkdRRzk5ZWhiRW9vZUhLTXczcS90VGEwSHVV?=
 =?utf-8?B?MHFMZjVZVjEzSVdpNmI0aG9GUFNFRmR1bXlZN1A0REJyWlpud3FPYlk5dmRs?=
 =?utf-8?B?MERzdjdYZjgzb2NjUWd0U0FDMFRMbVNsRWVvekV4d2tFSFh3dkplQjlJelZD?=
 =?utf-8?B?bWcrcURiQkZPcGw1dzNmVGQ0TkJGTy80TC9wNDFlWGw5U3orMGtXVllEbmdM?=
 =?utf-8?B?Wmt5VkIva2N4dnBYdFNlZGhBSXl6RFBYZlVXZWNVaWJhU3VaRE1QMEtLOHNo?=
 =?utf-8?B?aGo2STFTVHRIVU1SUVNoYjJmdGRvNE43UXR0WVdoTWVrT3QwTkw2NmduRXJG?=
 =?utf-8?B?YnQ3SnZWaHJFK0dqS0ZROHBRNGt2elI2WXowTldGMEw0aWVJNjRKZDRuMW1V?=
 =?utf-8?B?MGFBeUoyTUhlcGV4TkdkRTRFRVRNU2NkNERXSjc4VjlGNkFDU2psUkkvUCtC?=
 =?utf-8?B?VzZ5U3diSWNTYjVsUHlneTVaWVZURzgzWUlNQzFpanFsdjRBN2VSWDhCSDlD?=
 =?utf-8?B?dmdZU25rbHo2UnpLUDY0blBpakdQdnVRcmNiMXhySzVXcmRld0UrNWwxeVhs?=
 =?utf-8?B?cENLWk9lcit5aHNGOHBBbDQ5SGVUWHBsUHp4NDdHdXM3Y1RuYzBObEdSZzVX?=
 =?utf-8?B?b2N5ZDVlNUZUUUhKdVk1bUY3Rmx1UHBVSDUvR2tuVjg2Ykp6ZFV1emhVWkJG?=
 =?utf-8?B?WHJ4WUVzaDJ3R1QrL21XMmtLWDFFZUI3MmgrVi9uYjJmWHU0c0xXSmVKQ1hY?=
 =?utf-8?B?ZUtQV3dVY2F6dkhaZEVOUTh0SmdpZE1CV3ppMUtwbkhmZzJQOTRLZzBIZHNo?=
 =?utf-8?B?VDNwNWNIWGZYUGZmcDRySDdaQ01keVVQbmhIaXdTRE1aQ2hpbWJUS2dsQ1pB?=
 =?utf-8?B?c0N0TnZ0bFhQZVhFK2xQa0VtNFFyWFp1MGU1ZnN4dm1SRGlXVlhIQkJmWDV0?=
 =?utf-8?B?Z1ZhVFh0cGQyYS8xL0xQOGlicGJYTTNySm1FbVFZREovS2FnTy9DUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79977C98FE6AE74B8070C82BDDA71719@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d92c6d-418e-41c3-7dd3-08da2303ffef
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 19:28:51.1949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAv3mfUPOQNz5cUN/RHESoeYkObXl6mbiHY04/+Sg0AsGJqdQ2DCzZsZqNGln3wdB/ioBlScx+bAQKUuFwvqBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB4962
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA0LTIwIGF0IDIwOjU2ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiDimqAgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IEFtIDIwLjA0LjIyIHVtIDIwOjQ5IHNjaHJp
ZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4gPiBBbSAyMC4wNC4yMiB1bSAyMDo0MSBzY2hyaWViIFph
Y2sgUnVzaW46DQo+ID4gPiBPbiBXZWQsIDIwMjItMDQtMjAgYXQgMTk6NDAgKzAyMDAsIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6DQo+ID4gPiA+IEFtIDIwLjA0LjIyIHVtIDE5OjM4IHNjaHJpZWIg
WmFjayBSdXNpbjoNCj4gPiA+ID4gPiBPbiBXZWQsIDIwMjItMDQtMjAgYXQgMDk6MzcgKzAyMDAs
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+ID4gPiA+ID4gPiDimqAgRXh0ZXJuYWwgRW1haWwN
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSGkgWmFjaywNCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gQW0gMjAuMDQuMjIgdW0gMDU6NTYgc2NocmllYiBaYWNrIFJ1c2luOg0KPiA+ID4gPiA+
ID4gPiBPbiBUaHUsIDIwMjItMDQtMDcgYXQgMTA6NTkgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gUmV3b3JrIHRoZSBpbnRlcm5hbHMgb2YgdGhlIGRtYV9y
ZXN2IG9iamVjdCB0byBhbGxvdw0KPiA+ID4gPiA+ID4gPiA+IGFkZGluZw0KPiA+ID4gPiA+ID4g
PiA+IG1vcmUNCj4gPiA+ID4gPiA+ID4gPiB0aGFuDQo+ID4gPiA+ID4gPiA+ID4gb25lDQo+ID4g
PiA+ID4gPiA+ID4gd3JpdGUgZmVuY2UgYW5kIHJlbWVtYmVyIGZvciBlYWNoIGZlbmNlIHdoYXQg
cHVycG9zZSBpdA0KPiA+ID4gPiA+ID4gPiA+IGhhZC4NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiBUaGlzIGFsbG93cyByZW1vdmluZyB0aGUgd29ya2Fyb3VuZCBmcm9tIGFtZGdw
dSB3aGljaA0KPiA+ID4gPiA+ID4gPiA+IHVzZWQgYQ0KPiA+ID4gPiA+ID4gPiA+IGNvbnRhaW5l
cg0KPiA+ID4gPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4gPiA+IHRoaXMgaW5zdGVhZC4NCj4g
PiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnDQo+ID4gPiA+ID4gPiA+ID4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPiA+
ID4gPiA+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4NCj4gPiA+ID4gPiA+ID4gPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gPiA+ID4gPiA+ID4gYWZhaWN0IHRoaXMgY2hhbmdlIGJyb2tlIHZtd2dmeCB3aGljaCBub3cg
a2VybmVsIG9vcHMNCj4gPiA+ID4gPiA+ID4gcmlnaHQNCj4gPiA+ID4gPiA+ID4gYWZ0ZXINCj4g
PiA+ID4gPiA+ID4gYm9vdC4NCj4gPiA+ID4gPiA+ID4gSSBoYXZlbid0IGhhZCB0aGUgdGltZSB0
byBsb29rIGludG8gaXQgeWV0LCBzbyBJJ20gbm90DQo+ID4gPiA+ID4gPiA+IHN1cmUNCj4gPiA+
ID4gPiA+ID4gd2hhdCdzDQo+ID4gPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gPiBwcm9ibGVt
LiBJJ2xsIGxvb2sgYXQgdGhpcyB0b21vcnJvdywgYnV0IGp1c3QgaW4gY2FzZSB5b3UNCj4gPiA+
ID4gPiA+ID4gaGF2ZQ0KPiA+ID4gPiA+ID4gPiBzb21lDQo+ID4gPiA+ID4gPiA+IGNsdWVzLCB0
aGUgYmFja3RyYWNlIGZvbGxvd3M6DQo+ID4gPiA+ID4gPiB0aGF0J3MgYSBrbm93biBpc3N1ZSBh
bmQgc2hvdWxkIGFscmVhZHkgYmUgZml4ZWQgd2l0aDoNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gY29tbWl0IGQ3MmRjYmU5ZmNlNTA1MjI4ZGFlNDNiZWY5ZGE4ZjJiNzA3ZDFiM2QNCj4gPiA+
ID4gPiA+IEF1dGhvcjogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPiA+ID4gPiA+ID4gRGF0ZTrCoMKgIE1vbiBBcHIgMTEgMTU6MjE6NTkgMjAyMiArMDIwMA0K
PiA+ID4gPiA+IFVuZm9ydHVuYXRlbHkgdGhhdCBkb2Vzbid0IHNlZW0gdG8gYmUgaXQuIFRoZSBi
YWNrdHJhY2UgaXMNCj4gPiA+ID4gPiBmcm9tIHRoZQ0KPiA+ID4gPiA+IGN1cnJlbnQgKGFzIG9m
IHRoZSB0aW1lIG9mIHNlbmRpbmcgb2YgdGhpcyBlbWFpbCkgZHJtLW1pc2MtDQo+ID4gPiA+ID4g
bmV4dCwNCj4gPiA+ID4gPiB3aGljaA0KPiA+ID4gPiA+IGhhcyB0aGlzIGNoYW5nZSwgc28gaXQn
cyBzb21ldGhpbmcgZWxzZS4NCj4gPiA+ID4gT2ssIHRoYXQncyBzdHJhbmdlLiBJbiB0aGlzIGNh
c2UgSSBuZWVkIHRvIGludmVzdGlnYXRlIGZ1cnRoZXIuDQo+ID4gPiA+IA0KPiA+ID4gPiBNYXli
ZSBWTVdHRlggaXMgYWRkaW5nIG1vcmUgdGhhbiBvbmUgZmVuY2UgYW5kIHdlIGFjdHVhbGx5IG5l
ZWQNCj4gPiA+ID4gdG8NCj4gPiA+ID4gcmVzZXJ2ZSBtdWx0aXBsZSBzbG90cy4NCj4gPiA+IFRo
aXMgbWlnaHQgYmUgaGVscGVyIGNvZGUgaXNzdWUgd2l0aCBDT05GSUdfREVCVUdfTVVURVhFUyBz
ZXQuIE9uDQo+ID4gPiB0aGF0IGNvbmZpZw0KPiA+ID4gZG1hX3Jlc3ZfcmVzZXRfbWF4X2ZlbmNl
cyBkb2VzOg0KPiA+ID4gwqDCoMKgIGZlbmNlcy0+bWF4X2ZlbmNlcyA9IGZlbmNlcy0+bnVtX2Zl
bmNlczsNCj4gPiA+IEZvciBzb21lIG9iamVjdHMgbnVtX2ZlbmNlcyBpcyAwIGFuZCBzbyBhZnRl
ciBtYXhfZmVuY2VzIGFuZA0KPiA+ID4gbnVtX2ZlbmNlcyBhcmUgYm90aCAwLg0KPiA+ID4gQW5k
IHRoZW4gQlVHX09OKG51bV9mZW5jZXMgPj0gbWF4X2ZlbmNlcykgaXMgdHJpZ2dlcmVkLg0KPiA+
IA0KPiA+IFllYWgsIGJ1dCB0aGF0J3MgZXhwZWN0ZWQgYmVoYXZpb3IuDQo+ID4gDQo+ID4gV2hh
dCdzIG5vdCBleHBlY3RlZCBpcyB0aGF0IG1heF9mZW5jZXMgaXMgc3RpbGwgMCAob3IgZXF1YWwg
dG8gb2xkDQo+ID4gbnVtX2ZlbmNlcykgd2hlbiBWTVdHRlggdHJpZXMgdG8gYWRkIGEgbmV3IGZl
bmNlLiBUaGUgZnVuY3Rpb24NCj4gPiB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCkgc2hvdWxkIGhh
dmUgcmVzZXJ2ZWQgYXQgbGVhc3Qgb25lIGZlbmNlDQo+ID4gc2xvdC4NCj4gPiANCj4gPiBTbyB0
aGUgdW5kZXJseWluZyBwcm9ibGVtIGlzIHRoYXQgZWl0aGVyIHR0bV9ldV9yZXNlcnZlX2J1ZmZl
cnMoKQ0KPiA+IHdhcw0KPiA+IG5ldmVyIGNhbGxlZCBvciBWTVdHRlggdHJpZWQgdG8gYWRkIG1v
cmUgdGhhbiBvbmUgZmVuY2UuDQo+IA0KPiANCj4gVG8gZmlndXJlIG91dCB3aGF0IGl0IGlzIGNv
dWxkIHlvdSB0cnkgdGhlIGZvbGxvd2luZyBjb2RlIGZyYWdtZW50Og0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb24uYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb24uYw0KPiBpbmRleCBmNDY4OTEwMTJi
ZTMuLmEzNmY4OWQzZjM2ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdmFsaWRhdGlvbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X3ZhbGlkYXRpb24uYw0KPiBAQCAtMjg4LDcgKzI4OCw3IEBAIGludCB2bXdfdmFsaWRhdGlvbl9h
ZGRfYm8oc3RydWN0DQo+IHZtd192YWxpZGF0aW9uX2NvbnRleHQgKmN0eCwNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsX2J1Zi0+Ym8gPSB0dG1fYm9fZ2V0X3VubGVzc196
ZXJvKCZ2Ym8tPmJhc2UpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IXZhbF9idWYtPmJvKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FU1JDSDsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dmFsX2J1Zi0+bnVtX3NoYXJlZCA9IDA7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZhbF9idWYtPm51bV9zaGFyZWQgPSAxNjsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGlzdF9hZGRfdGFpbCgmdmFsX2J1Zi0+aGVhZCwgJmN0eC0+Ym9fbGlzdCk7DQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvX25vZGUtPmFzX21vYiA9IGFzX21vYjsN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9fbm9kZS0+Y3B1X2JsaXQgPSBj
cHVfYmxpdDsNCg0KRmFpbHMgdGhlIHNhbWUgQlVHX09OIHdpdGggbnVtX2ZlbmNlcyBhbmQgbWF4
X2ZlbmNlcyA9PSAwLg0KDQp6DQo=
