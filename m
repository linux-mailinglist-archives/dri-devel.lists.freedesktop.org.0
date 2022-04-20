Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C0508EA4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6C710E1FF;
	Wed, 20 Apr 2022 17:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D40D10E20B;
 Wed, 20 Apr 2022 17:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI4TdyJH/VUBElI9x+x58tdsjRlSwIHNu7D6AzlhcZ48EXsWoUOvOwpC4k00Ex3lYX8RDhc+izoI3cc62aD4BgNTngsSCSQzS+NjxS2r93XPYvMwvRsGPnXc9kxm3Rr8i1jMWOcc15ZLjmX5U0FS56434UfZ2TXcSlRAkREamd61sygHCfPHX1USwsIzzQPDeHycDLyiT35wlZhw4IZnh/5Tknivz4dOKXexRj17FC2vN4qGg8drULp9n9/tIhRbaB/T6uQEys06q/gkx4Hvnc48lHhgc8URjT69f3G53zHM3kP9FtTUwKUP4xR8uVJaO0u/FQHHiFwyOI+WZfdvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlJZLGmhgzgAo76EGaRdYkuS9dVmeRIcquxnRqwBOAE=;
 b=MbZ4iLuG84VmAyQX3OVUd6e3MOdbD+wgwz5Zuh8BY5QeQPuP8zD0XCqtV9f3IDA5ZlL7p2HVTpJWDw833zjmaDLzwLxbbbNWNyfURU0jiL1j17jOCMB+hvrJdOfZnZeUnLv64IGPYNI97hMeXwwvWyvNE3IduEJ/RpGmtLEkr0Rl5s14gjfH7/cFCDktW1qSXpPQ758aeYKkV85QGtp28qS0wn+3ocxgQPf+NKd4qZT26Fyfae4goFgPdnJ/C/ecNxdNQ5IB2u6ZlKgJya3951mNhKwhUKeYLdFVmPTQe5LNO3tWb0sYHaCoUVqPgQ9UnF79DckuObXnA5Gi+Kl+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlJZLGmhgzgAo76EGaRdYkuS9dVmeRIcquxnRqwBOAE=;
 b=VlLDi1+l4pxtGgCVcRhxhw9bQqyveqpYtivOMq8leXUq04LLmD/J9OJHBazxnD6zKgyZeDmdIpUjObcLsmLkQKSoB9MQldWPoea716PX8+3imyzPeX8m3QnWb2FsglTtoVCqQwXhGsYIBiRTx7rmeXRLyXQenow15dtQ1dVEFOU=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN8PR05MB6690.namprd05.prod.outlook.com (2603:10b6:408:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 17:38:57 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 17:38:57 +0000
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
Thread-Index: AQHYSl3exfVYH/xFlEu2kvqVBiXOdKz4QIGAgAA93oCAAKfqAA==
Date: Wed, 20 Apr 2022 17:38:57 +0000
Message-ID: <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
In-Reply-To: <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c124cce0-8895-4707-b2dd-08da22f4a5c2
x-ms-traffictypediagnostic: BN8PR05MB6690:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BN8PR05MB669009361D9D56EF58CB5967CEF59@BN8PR05MB6690.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vGfaAZ7p/Tp6kBR/9q5hDBrdvRN5QF58a6KdvvOT+SHOSmMaH3KKATP02RjhbacAQm6ML/tldpOY6O/VvxQ0xbIqRzx5/3W7P6Awv1NqTdev+d0se8S723oFSN1/36WTabmQxE9KhaLfzW0OWHsVm7xvkAg7kPzTPPJpRTCKi6gEjg8tZGl9nCVi7n03+rowuLS0aNPptX/9thA5J5a3HVt4Jv9jXo2qq5FPzbdixv1eOPTOs7vzWLXheFRZ1hc5q/d7R1Tf3IhU7Y0oOnt0LPWBjFUvSjkqWVd1S9N1W6kJRZhSNQAne4ncQcNdbcMj/6d7/QkWvWHmqvgLY2w+jtPQnnb5c+yGLKx6MRF8KPpOM+JALtPR8JWelDvnNmBPvBtWYwuvReYeaWP4ot6UeEb3Je0BCb1I58uMOcoLujZHO5j/d4W4V+gqKRhxTvLOLqgXpBcBEbKNWKfCZXArJE1RRVLv5AJ4NoluWlDb+N2/8pgO76QXUY+d2bZjP/ymxpco8CS9EqBpJj1HL2fC93xAcocze2fEmK3bXIsUxbr15CdUdNEqs7Toe4Ox5aLEhxniYHCxiNtBGbflnB00u9mWVupXqaamLV/T+mw0JvSKkxbShOV6eTzse13v12B5z/1Enhdz9mcsW9y63+0xWF4/6qH217mTwM1Jvkze64WrqUCIszd8J7qcMeHhj3ttYEakpeplIaCVRNewEMoNbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(2616005)(2906002)(5660300002)(508600001)(8936002)(38070700005)(66476007)(66556008)(64756008)(66446008)(6486002)(86362001)(186003)(26005)(122000001)(316002)(8676002)(38100700002)(76116006)(66946007)(71200400001)(91956017)(83380400001)(36756003)(4326008)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmIra3hRcXgvc1JhWlpIMnR3ODRHRHJ2WUdnbUYwaXVzcWdHVzJyWDZqOFZw?=
 =?utf-8?B?bnV5UExab0RSRzZyNndQcXQxUGQ3MFU3d1cxVHVjMU4wa29EVDBoa0ZlQkNu?=
 =?utf-8?B?QklZMkhFc01aL3VWQ09DY0ZMQlQrOWRSd3A4OW1rMjVTVUIxZkZpL1krR2pV?=
 =?utf-8?B?ZHY1dnFXcjVUK1ZWZ3lMTXg5N2d4ai95L2dJTnFkNE4vamNSZkgvdmVVVUF4?=
 =?utf-8?B?NTJ4emswK0xraUpzanhta0kzTEx4S0lzaFpHL1RmdzArdjJrcnJLaGFLbEpi?=
 =?utf-8?B?MTE0RlN0K2NqNXBySzhIdjRHM2NGRzZpSElUUWU1bnFWMHU4QXVSc3QrRlpV?=
 =?utf-8?B?K2FIbW0xdUFOcld0OXRtazNwWUdwVWpoYTNSYTB0TmRoZ1F3LzNTTjFrdTNJ?=
 =?utf-8?B?Zmt2bEZwbXhHT3F1L1BiV2VwLzlTOWdLNExDVXc5UngyY0ZjSVVISEpzMVZm?=
 =?utf-8?B?d3R4UHp5KzZtVUhpRkY3RGtEZTJyT1hSa2JkQ3Z3WUNPZFNEVXFFeGViUVN4?=
 =?utf-8?B?NVVkR1hKRWk0WVl5cG9yTlFVWmpVaTUzV1pSamxBcXRwOFRxWUxkMFBIWE1m?=
 =?utf-8?B?M1BWNEtYdWlnSm9qZ0g0M1JENmVmdk1pZ3NVTWh1Nm1iNlpSM1RSTkZJTmhC?=
 =?utf-8?B?Q1htNThyTHBnL293aW1kdlFxQTd4Ty85RVgxd0hmaEo2TjdHRWVIRTJ4eURG?=
 =?utf-8?B?SGM2N1E1bmRlNmNLY0t1YkIwZXNOVHdsQlpodXA5S3RPVFRSOGpWd0srUkNl?=
 =?utf-8?B?d0o0MXdiWHU2TVhuNS9qMk9uUXhhRWhnQ2pvV3I4bll1L1dTczg3SUUzYTVR?=
 =?utf-8?B?dldJSWpaNy8vOHhwWnRvQ2J1SzNLSWRGQ1QxZW5SUmN5N3BKcUxWWXV3WlR1?=
 =?utf-8?B?aVRGaUxwY0poUDBXc0MwbzdjUXE1bzFFTGpPdkNuVkc0QlJCc29STEREOXZJ?=
 =?utf-8?B?dGtXcXlUenZqbHBVR0U5dWsxaVl1cFhCUjBRcWdVOWU2ZzdkTlExT2ZxSWpT?=
 =?utf-8?B?SFoyV0dHMkV4WWM5cGppTmh5V1Jtbm1KRDVXckNwaFk5bnZ5R2pjM0FZMEpU?=
 =?utf-8?B?NzU4TVNUbGoyeUlTRmVrbmJOKzdEdGVLd2dhYmdnL0R6emFyRWhrVU9Jb3dm?=
 =?utf-8?B?dVFBM0dGclFyRmVZTDlSN1N1QjVRWFRvZDBYMm96eXBHRVdBa1VQR0NXZHZo?=
 =?utf-8?B?RnBYS3RVODFoNThKUDVxeDRZb2lIQldpZWY5ZjR2UWJlRk9TUG1BZ0V6eHVr?=
 =?utf-8?B?Y1EwQmFvb3AwMnAvZnJvdTUvT3B2MEVoc1NUN2F5L2syVk1DOG9SVmlLTEly?=
 =?utf-8?B?ZTZteHcwSFNtMHB4WWhiaEtNSGlqVVJoaE4rOXpuV1RyQXBzTnRBZjZVTWpw?=
 =?utf-8?B?UERFbFFLZmFUTEJ3Q1FxYTgyMnB5TFhLZGFkVE96RUpvZURWNmgrQWdjeVVx?=
 =?utf-8?B?dXpodG5oZnZIYlArbGEzWm1mVmFNNUNHblFlWWtXRmFrU2xoYm1hUmJ2TXJs?=
 =?utf-8?B?UW90VTZsOVZCdmt1WW4xSDVMZWpiakswQjNIeWVCWnNiNGM3d2Q3bG5CUWU1?=
 =?utf-8?B?OHVUU2tvV1Z6Yjg3Wm1pVWl1bzJHTjQrbzl0WGRTeU02WEVxRUxTdTNIUG9P?=
 =?utf-8?B?VFBRT3luY0FVSFZraTNhd0pwdy9jNnVlalZ0N0F2cDhNeS9LTkVoS2JGRkZQ?=
 =?utf-8?B?cllWRmF4Z3JsYkhvbmFiV1pjdXdXVFRvUEg1cFROTXphSTBNeEtPeWFQZVBt?=
 =?utf-8?B?M3pVbS9mb2ZvaXVmam56N2JJNW1tUFZBVk14ZzlUY0l1V1NIcEZNWHNVTUg4?=
 =?utf-8?B?MEVNRjRJM2lrcXRsSklseHFtQ0x1RVdjUnArT2pOa1FmT0pWRkcwZGRqdEN2?=
 =?utf-8?B?dTM1WER0M2RvS1BwVEszUUpvMG1VMFFYUDVtdTN0WU5lYmdveDRIUTBmbFNH?=
 =?utf-8?B?OHRLaXhDazVyVnI4MHVtd21mNTRidFhPZXRlblQ4ODNwTWM0QXF4Y1o0VS94?=
 =?utf-8?B?WkRnMCsrTUp5azl3RlNBN1FBUmV2dEpLUzI5WHBHaHpwQ3g4RGtKZU5MV3Fh?=
 =?utf-8?B?YlR5Zk9lcUN6MHNzTHRvZ2xEUDh3a2FXdUZNaEhUL1ExYlpUQXdRR0ltS2E4?=
 =?utf-8?B?eC9QSThveGpHKzFldC9RdGtVeWwreGtnUHRiQXpqR3NZcjJ0MVF0dm9IeWJo?=
 =?utf-8?B?VHFsVmNZdHF6TUNqM0I4MkdqSS83U0M0cFpCQXZlQVN4VnVIY0RYbUE4Smxw?=
 =?utf-8?B?S2tlcG9rWjUxcnJrclQ1c1BIMFhpSDZXcThabE9BYVMyNDdhVjV4M3Y1Zzhn?=
 =?utf-8?B?QkY1NDZ0Ti9XaU1pZWdjNFlaVkw1WHVNQ0ZCWmdwajh4ZzlPMVRSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B53827E78F71440A2BF8963B5B993D1@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c124cce0-8895-4707-b2dd-08da22f4a5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 17:38:57.4086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YdTy1X6VtEy91uh8bVMWYx3EYMxo8TAPVmYAYITUaztLRb6m1i9p9sw3J2EWr0wyah04XgdQZOVeBcyJaqUbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR05MB6690
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

T24gV2VkLCAyMDIyLTA0LTIwIGF0IDA5OjM3ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiDimqAgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IEhpIFphY2ssDQo+IA0KPiBBbSAyMC4wNC4y
MiB1bSAwNTo1NiBzY2hyaWViIFphY2sgUnVzaW46DQo+ID4gT24gVGh1LCAyMDIyLTA0LTA3IGF0
IDEwOjU5ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiA+ID4gUmV3b3JrIHRoZSBp
bnRlcm5hbHMgb2YgdGhlIGRtYV9yZXN2IG9iamVjdCB0byBhbGxvdyBhZGRpbmcgbW9yZQ0KPiA+
ID4gdGhhbg0KPiA+ID4gb25lDQo+ID4gPiB3cml0ZSBmZW5jZSBhbmQgcmVtZW1iZXIgZm9yIGVh
Y2ggZmVuY2Ugd2hhdCBwdXJwb3NlIGl0IGhhZC4NCj4gPiA+IA0KPiA+ID4gVGhpcyBhbGxvd3Mg
cmVtb3ZpbmcgdGhlIHdvcmthcm91bmQgZnJvbSBhbWRncHUgd2hpY2ggdXNlZCBhDQo+ID4gPiBj
b250YWluZXINCj4gPiA+IGZvcg0KPiA+ID4gdGhpcyBpbnN0ZWFkLg0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4NCj4gPiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IA0KPiA+IGFm
YWljdCB0aGlzIGNoYW5nZSBicm9rZSB2bXdnZnggd2hpY2ggbm93IGtlcm5lbCBvb3BzIHJpZ2h0
IGFmdGVyDQo+ID4gYm9vdC4NCj4gPiBJIGhhdmVuJ3QgaGFkIHRoZSB0aW1lIHRvIGxvb2sgaW50
byBpdCB5ZXQsIHNvIEknbSBub3Qgc3VyZSB3aGF0J3MNCj4gPiB0aGUNCj4gPiBwcm9ibGVtLiBJ
J2xsIGxvb2sgYXQgdGhpcyB0b21vcnJvdywgYnV0IGp1c3QgaW4gY2FzZSB5b3UgaGF2ZSBzb21l
DQo+ID4gY2x1ZXMsIHRoZSBiYWNrdHJhY2UgZm9sbG93czoNCj4gDQo+IHRoYXQncyBhIGtub3du
IGlzc3VlIGFuZCBzaG91bGQgYWxyZWFkeSBiZSBmaXhlZCB3aXRoOg0KPiANCj4gY29tbWl0IGQ3
MmRjYmU5ZmNlNTA1MjI4ZGFlNDNiZWY5ZGE4ZjJiNzA3ZDFiM2QNCj4gQXV0aG9yOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IERhdGU6wqDCoCBNb24gQXBy
IDExIDE1OjIxOjU5IDIwMjIgKzAyMDANCg0KVW5mb3J0dW5hdGVseSB0aGF0IGRvZXNuJ3Qgc2Vl
bSB0byBiZSBpdC4gVGhlIGJhY2t0cmFjZSBpcyBmcm9tIHRoZQ0KY3VycmVudCAoYXMgb2YgdGhl
IHRpbWUgb2Ygc2VuZGluZyBvZiB0aGlzIGVtYWlsKSBkcm0tbWlzYy1uZXh0LCB3aGljaA0KaGFz
IHRoaXMgY2hhbmdlLCBzbyBpdCdzIHNvbWV0aGluZyBlbHNlLg0KDQp6DQo=
