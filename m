Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C38CC62C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 20:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB5710E313;
	Wed, 22 May 2024 18:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="trHqbORW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B13910E402
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 18:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLT0A0P9S7WhCq03fb9i4PjnvMgARsQ+nIrfLziruumt7ThEIopM1mnUmhc8z+JiNhrcw37dMcu21XDh7UT02ZHGCMn5ZmLnxpb48fBeTzfDUcPB+6QwCap9PdjbMIMRYzq+ZwQa+hyyb4Yt4tHScrQ9INCt7J+sYFvahc2cVNxv2bhwHq3ORSayIEQsMsqDwuDpXxXxEiAwQhOCXkixdgiNXjLDiPlwmS1lYk0bxMZc6eDNrfwsjIojMxFT/jYMDxlkCnAGu6SAg1vSJAhosrVmOmGJ5Pm5Pg3KB3lGDxngl/mCQncRqpMf6XHCt7hpJZ9AvaIEnoMLdEzlD1zesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLzF/pMl6Qbu1DNekyKzJ4UqSFcKtdN3bihYE1gVIuw=;
 b=W2h9G8jfhVRe7PVfhAZGkg8RUDWLebv2pcVu4NiUKNrw0U7T90EYJIKwMUcOOCtT0NsqFpeUgDRdeLZWClskcCp9eRhl1WTfDUI7yuHCJfyvIHdNVg8NlQTw4im7w3gUjfjPxZEtp0uO6yto0uVgJmOsYXscmDOtSqhfaHntIxhkSY2krYDQJ1T3vOvBu3teviYugT3IUpDNuIEf4JDaLnYV7yjwxTcnyQToIVEMrugSeRmCznmKCA6pyd1oB1QF7znD7Nxw5TD16lqxDTO9A0z+6uw64PbyTc2cCaDuEOCafWDaX4mNDiFIVTDqt2kMndFwGXZAcx/R6rM+KqnGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLzF/pMl6Qbu1DNekyKzJ4UqSFcKtdN3bihYE1gVIuw=;
 b=trHqbORWNyYk2MSB+U+jk4Q8m7JPBF+AI9erIPs3LXDktdciRMiNkFW1P7oA6s/Tesxj2rdhiXpeldhUxVnmxo9oRypZwYQRskTM3XSBsE33z8HLj+ZoOSiTLk2vNSCp9YzA6hTJx9evlg9d5m5nHrricd08yCMjZ3mIBVXGyM8=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 18:14:37 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::710d:5ae8:24f4:58dc]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::710d:5ae8:24f4:58dc%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 18:14:37 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Thread-Topic: [PATCH] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Thread-Index: AQHaqy46wofSkZ5xCUSkInz8cBYk47GjY/mAgAAhnFCAAArqgIAAAKRA
Date: Wed, 22 May 2024 18:14:37 +0000
Message-ID: <MW4PR12MB7165CF475E9E0DC775A6DAEEE6EB2@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240520-dp-layer-enable-v1-1-c9b481209115@amd.com>
 <20240522153151.GB9789@pendragon.ideasonboard.com>
 <MW4PR12MB71654EE394DFEBE7325E6DC1E6EB2@MW4PR12MB7165.namprd12.prod.outlook.com>
 <20240522181113.GD5164@pendragon.ideasonboard.com>
In-Reply-To: <20240522181113.GD5164@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|BY5PR12MB4146:EE_
x-ms-office365-filtering-correlation-id: 38d64878-09f5-4869-df16-08dc7a8b0a7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|7416005|366007|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?c2ZFaDVEMVRxcnJaaGlEWTI3WGpUb3ZYYWh0QmlLTG9hUEgzd2JSbmR6VStF?=
 =?utf-8?B?aGFGZXd6cHBuU1FQOGxTZTc4V3VWc0toSWJlRGREaUhjUVEvMnVWSDV0K2Zx?=
 =?utf-8?B?ZnNVNEtyMHZVRjNQVTU4QnZjUnp6ajFpbVhMYlpIbzlYSXdrWFJxQi9VMnhR?=
 =?utf-8?B?NVBqc2RLNThxQzA4a25WeTcyWjZxczgvb1hjMzJnOVFNWFVGOHRIUW13OXky?=
 =?utf-8?B?S2ZyWU9PcllaUzZTaXZHMUhtOExybWl4T0R2Ti9Fc0ppNnh3U2dDODhIeUk5?=
 =?utf-8?B?UkNTM1A3NFpERmxUejYwYXg4SGpQQ2lRNEZ2MzhvN0pwd1k5NGhZc3Urd0VH?=
 =?utf-8?B?Tk5KVHo1a1piZG5QWHpGQVhzYVVKSTZEOXd4RFBaTDlCblJzMVJHaE1tWkg2?=
 =?utf-8?B?UUJrak1ZWG5BTXBoZ3V1QW0wK0Q4RjdBaE5wcms5ZmJpczdRVEk4MSt0RW1o?=
 =?utf-8?B?bks0aVA5SnRtcExKVlFqODAwYVlqd1VZbUtNd3ZtQzZ0U1dqb3RxWjRGak4y?=
 =?utf-8?B?My9ZUmIwS1l2eG4rMVM2OVY4NmZHN3VLRytSbzBpcnFKT2w1dk9TTjBRRWJu?=
 =?utf-8?B?L00ycGY5ZmNiV2VTRHlFelllWGx2M3ZKRnMzNXJMaVp0Vk94aEFUbjZJdkox?=
 =?utf-8?B?S000L3FEVFJTbWxOeVI5QVQ5SWZna3VHajFMcVJYQ2xSZ0syb3pBNy81cWph?=
 =?utf-8?B?d3lZV2FUN2V4T3RKMzJUYS9WdG9aY1dSekp6RURuTjY4aVVRYWorNkZ0VDQw?=
 =?utf-8?B?RUdOUGlORk93b3Avck1xTE4xVW44djYrWW9YWHppa1oyU05XeUZTQi9LYzBL?=
 =?utf-8?B?WGZWT0pwWTZ3aUQyK1JLNmNtVEcvWUpiQ1hORW1PU1JKd0Z1anYwWlduQ216?=
 =?utf-8?B?REk3Y3JUVWVtelhQeWU1QTNBQmJUemFFS3lJMFZzbW8yV2JzaTNhWWVZVklk?=
 =?utf-8?B?M2d2aVZRWkk1U2xRME1rM1Y1RDJpOGJvd3Q3aHl5QTAxRGJEQVFWWHliSFVj?=
 =?utf-8?B?eWZzanZ6d3g2NjhBejlOYmRVUEMrRkM4cmVZUHNjRHhTZW9iVEhNQ0dBM0pW?=
 =?utf-8?B?b0trSzk4RzYwMTBBYlViUmxybytmV2EyRElud2ZJc0tlZTZGUk9wVERkWXNC?=
 =?utf-8?B?MnNobUdhc0g2a2UvUDRXVm1SR3hiOUh1dmlFd0Ixd2FNNTNNMmpEeTd3RHdl?=
 =?utf-8?B?aUFsK2hVdkxxT3lvM2tsTkp0TlJkZEQ5ck1FWnU4czNja05HOXlJaUNyWVI0?=
 =?utf-8?B?cFpFb3lMNDJZMG5MK2ZxdHVld0hVTHB5RjA2VlkxUVdLOHNZKzh6UkFTb09i?=
 =?utf-8?B?VkhhOUdNSkJqY2theWF4NWNBNis2cC9GdDVITHUzdXNPS2VrbjdIa3g5aThz?=
 =?utf-8?B?cWZlQ0xZTmRWQzJFT1JXT1doRUlBTWgySUw2VEM5aCtGUjRSM1RPNGY1dDZF?=
 =?utf-8?B?eEo5ZTM5TTZJdzNVeC82djlVSmNWR282TVFNem5FWHVrOWpBbVF3M2ZCaUpm?=
 =?utf-8?B?eGdCbkZ0S0hKMm1naTU0M2l4dWxGTDVJZUNsQkxsOGUwZG5GWko3WUxhSHdJ?=
 =?utf-8?B?ZEo0REtMRzN6SGRiaVc4NWZoMVUwaG00SDBQMjZxQlQ2enRZaDhzLzBHdkFL?=
 =?utf-8?B?NW5IcVRQY3RnMWVRY2EyL3g1MWNJQThVdldXVmhjd1VHclg0bzBrbHZ3eVNx?=
 =?utf-8?B?aC9MSzJLWUE4c3k3U29UalAwN3Z4QU5BNXBFZ1ZKZFViekFaTEtZZGVJd29j?=
 =?utf-8?B?dU9PMzk1MVY0bERUdkVZUUo0Yjd3UUJSRkFEcUtKTEJUOTFlM1FQY3JhU2Ns?=
 =?utf-8?B?VEF6ejk2NUFuNTMrVUMzZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eklXMlVlQlpsREdFVkEzSTFwQ2VZNWg0Z2duTnU0RngvazJvNlozT1BUOUh0?=
 =?utf-8?B?dW9iSkFYWWZ2amJXZFo0WmFoTDQxQXhKT1ZIQ2Y3NVl4Z2doZkdnZWdUNVdS?=
 =?utf-8?B?WDdKallqemNkemNzRDdVUGgwVVhvUkNtVmF5N2VMMytVWGhweXhNREhic1lC?=
 =?utf-8?B?dzZIakJXYzNzR1NVc0RsYjdHaWozb21UaWd1QThhazhQNkxZUzNKRks3RTNM?=
 =?utf-8?B?UHNJV2FDSnhFK1llL3lLZmVQYkFFaS9qUXNna1puWFF3QTVjWU1STEY5S0tP?=
 =?utf-8?B?aFV3ZUNpTyt2dDZlSUtUc2dKYnBseVI1VEg0R2NrdzdtOFg4dFdST2dRa0pm?=
 =?utf-8?B?R0ZkL3BlOExLK0FVdFRFQjM0MmsvQVA0RzFpbGkrMGtmMnBIekw3VjRGYUlU?=
 =?utf-8?B?SnVhM0NscG9NaFpFWm1vWEdTMGpDa2U3eXBVVVVDMHV1QVJKTEpDM2RjT2Zp?=
 =?utf-8?B?TmF4U0I1YkkySUhaVERLNmpVV0p5UTlEY2c4eWs1bms2ZklQbUwwR3ptZk8z?=
 =?utf-8?B?T2o3UDVYbksyU3ZiS0Y0NjVOZ0lSTyt5Z1VTMzVoMytmanJhK1dqNVlhUHhI?=
 =?utf-8?B?Qlcxc1pjT01DMEhCbzlpQzBoK2ErZFBiMmRyQWh4UC8xTVpKbGRacmF6WS9Z?=
 =?utf-8?B?bkgvcmxJSmRpMWw4OFlKb01nSkVlN0NoVkJyOWdIM0pyZXJRTExlZXFsVUY5?=
 =?utf-8?B?UWttSXpMVHNCRjFFOWRxeW82eG9oU2N1RFJXSWJkNWRwL0RGblNsZGdZeGRP?=
 =?utf-8?B?U2UrakJ4eHA5cnBLcUlFL1l0ZEY1NThtWHdwdDh5NDlYek5KSmsxWmpaRUVh?=
 =?utf-8?B?SXpSZUl6UFMrQ2ZmTzY5am94OWVrTTh4VjFPWW1UQ1pQWnJITEFDbFRIcURQ?=
 =?utf-8?B?WFR5dWVmQ2VXbFFWaFRPSlJVNkhDSTBtQTcvbHREVUZKWmQ4K1FTZUs4Tk1V?=
 =?utf-8?B?S0Nsc0JERTZxL20rS1NaSCtJTUl1MTE4R1RlMkQxNkphVXVJdTFHRUcwQno4?=
 =?utf-8?B?akVpaHVzSW1lZ3UxbDJkUTZVMWs2aGF5UWtkaGFZUVpWSG05UVRrT3ZJZXM4?=
 =?utf-8?B?TDBDb3crdXd0ZGVFaG5QM1owT3hVazljS0ZNdlBkQlZ1RVhuek1NZWxRU2xt?=
 =?utf-8?B?UmFRZXZ4ZGlPUEhzY3VlRzkrd1FsRDg3SnMxM2JiOEFnT2xrYkE4OFkxOGdh?=
 =?utf-8?B?c0VZRXBmRktaTWRpMGZoY3I1TUJDNGhCcnlxdCt0d3RKaVRTa3pJZGE3N3dl?=
 =?utf-8?B?QmltdlpYemdMN1U4cGRyWk1TYm9qL1ZXTU9zNHpGaStmU2d0QUFiOXhHK2t6?=
 =?utf-8?B?RDZESXZWMkxsYWJRcjBJMElVdDU5OHB4SXh1YzY1REZaVTBGbGdTQWxvQk9p?=
 =?utf-8?B?R3NMb2hHbk1xV1RBWENLQlFFN3V6R2srZlFPWDdEenVyOXdKRW1RQ0xWY1Mx?=
 =?utf-8?B?T0xWeVdsVUl2RWVXTjFySnczOEJGajV3MTFNL09uOXQxRXBQeTNNWmI1ajZu?=
 =?utf-8?B?dFc5cFgzUGFyRE45MFhrdFVleDJrMEU3SCtNWkJzcTF2U2ZoQkExN2dSdlBs?=
 =?utf-8?B?SG9DK1Ziek8rV2Y2UStsMkJFZzRaNnRuTDJrMFI1Z1hJK1UzbmhBb3o5cTY2?=
 =?utf-8?B?TFhkaXcwVmNhR0czdmVHb1hLRUM5VXdmUWlKRkZzK1Q0WEg3b2hCNUJ3TDV3?=
 =?utf-8?B?WFFPYkN6VlZtbUhhSVppZUNlYUdmRk5SVk10RXBiSEVMay9PL1BWWGljaTJS?=
 =?utf-8?B?L3VhaDJzTTZ0NzdvTjZKSTZ5a1RzT0UvMUNVdThQMDZSRjY4RlJNMXgwQm4r?=
 =?utf-8?B?Y1cxelJPeFRYNXFtYkFDUDBBc1hZVDVGSjBoRmhrRE8rVDE0bHdmTnRiRi9M?=
 =?utf-8?B?TDI4QVY1dmF3TEF2b3QzL2tnVW5kcDhVb2FUaWRyQWVkWjZ3ZGRlK1Fjbnd5?=
 =?utf-8?B?WmFKekVOTjdwcUkzVGJ1b2d6NHp3Qy8zRHJSOExNLzJoQlF6U3RNdHJ3Q25j?=
 =?utf-8?B?VmtEcG42eXRkZnNjL0xDWG1iNlYrZ2ZPODFEVzY4T3pwbERnZW1qSnJEaEtq?=
 =?utf-8?B?aE5MMHgvYnJ4VnRtSUpKVVRzdzFNRkJ2bzJhUC9ZYnc4Y3dBNDJBelZyaUdM?=
 =?utf-8?Q?o3kU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d64878-09f5-4869-df16-08dc7a8b0a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 18:14:37.4237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXKh08P2WP7v4wszf0Oxaye2SkU1jfDDGJma+7jUoKU52yg6HrdTLJ7+HKjoB5X6GMhwYIvTJp62NiIScYNLkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IE1heSAyMiwgMjAyNCAxMToxMSBBTQ0KPiBUbzogS2x5bWVua28sIEFuYXRvbGl5IDxBbmF0b2xp
eS5LbHltZW5rb0BhbWQuY29tPg0KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QGlkZWFzb25ib2FyZC5jb20+OyBNYWFydGVuDQo+IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3Jn
PjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsN
Cj4gU2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBkcmktDQo+IGRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm06IHhsbng6IHp5bnFtcF9kcHN1YjogRW5hYmxlIHBsYW5lIGluIGF0b21pYw0KPiB1cGRh
dGUNCj4gDQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJu
YWwgU291cmNlLiBVc2UgcHJvcGVyDQo+IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRz
LCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4gDQo+IA0KPiBPbiBXZWQsIE1heSAy
MiwgMjAyNCBhdCAwNTo1Mjo1NlBNICswMDAwLCBLbHltZW5rbywgQW5hdG9saXkgd3JvdGU6DQo+
ID4gT24gV2VkbmVzZGF5LCBNYXkgMjIsIDIwMjQgODozMiBBTSwgTGF1cmVudCBQaW5jaGFydCB3
cm90ZToNCj4gPiA+IE9uIE1vbiwgTWF5IDIwLCAyMDI0IGF0IDA4OjIyOjMxUE0gLTA3MDAsIEFu
YXRvbGl5IEtseW1lbmtvDQo+IHdyb3RlOg0KPiA+ID4gPiBVbmNvbmRpdGlvbmFsbHkgZW5hYmxl
IHRoZSBEUFNVQiBsYXllciBpbiB0aGUgY29ycmVzcG9uZGluZw0KPiBhdG9taWMgcGxhbmUNCj4g
PiA+ID4gdXBkYXRlIGNhbGxiYWNrLiBTZXR0aW5nIHRoZSBuZXcgZGlzcGxheSBtb2RlIG1heSBy
ZXF1aXJlDQo+IGRpc2FibGluZyBhbmQNCj4gPiA+ID4gcmUtZW5hYmxpbmcgdGhlIENSVEMuIFRo
aXMgZWZmZWN0aXZlbHkgcmVzZXRzIERQU1VCIHRvIHRoZSBkZWZhdWx0DQo+IHN0YXRlDQo+ID4g
PiA+IHdpdGggYWxsIGxheWVycyBkaXNhYmxlZC4NCj4gPiA+DQo+ID4gPiBBaCwgSSB3ZW50IHRo
cm91Z2ggdGhlIGNvZGUgYW5kIEkgc2VlIHRoYXQuIE9vcHMuDQo+ID4gPg0KPiA+ID4gPiBUaGUg
b3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YgdGhlIHBsYW5lIGF0b21pYw0KPiA+ID4gPiB1cGRh
dGUgZW5hYmxlcyB0aGUgY29ycmVzcG9uZGluZyBEUFNVQiBsYXllciBvbmx5IGlmIHRoZQ0KPiBm
cmFtZWJ1ZmZlcg0KPiA+ID4gPiBmb3JtYXQgaGFzIGNoYW5nZWQuIFRoaXMgd291bGQgbGVhdmUg
dGhlIGxheWVyIGRpc2FibGVkIGFmdGVyDQo+IHN3aXRjaGluZyB0bw0KPiA+ID4gPiBhIGRpZmZl
cmVudCBkaXNwbGF5IG1vZGUgd2l0aCB0aGUgc2FtZSBmcmFtZWJ1ZmZlciBmb3JtYXQuDQo+ID4g
Pg0KPiA+ID4gRG8gd2UgbmVlZCBhIEZpeGVzOiB0YWcgb3IgaGFzIHRoaXMgaXNzdWUgYmVlbiB0
aGVyZSBzaW5jZSB0aGUNCj4gYmVnaW5uaW5nDQo+ID4gPiA/DQo+ID4NCj4gPiBZZXMsIHRoaXMg
d2FzIGludHJvZHVjZWQgaW4gdGhlIGluaXRpYWwgZHJpdmVyIGNvbW1pdC4NCj4gPg0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmF0b2xpeSBLbHltZW5rbyA8YW5hdG9saXkua2x5bWVua29AYW1k
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBf
a21zLmMgfCA1ICsrLS0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1w
X2ttcy5jDQo+ID4gPiA+IGluZGV4IDQzYmY0MTZiMzNkNS4uYzRmMDM4ZTM0ODE0IDEwMDY0NA0K
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfa21zLmMNCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+ID4gPiA+IEBAIC0xMjAs
OSArMTIwLDggQEAgc3RhdGljIHZvaWQNCj4gPiA+IHp5bnFtcF9kcHN1Yl9wbGFuZV9hdG9taWNf
dXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiA+ID4gPiAgICAgICAgICAgICAgIHp5
bnFtcF9kaXNwX2JsZW5kX3NldF9nbG9iYWxfYWxwaGEoZHBzdWItPmRpc3AsIHRydWUsDQo+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGFu
ZS0+c3RhdGUtPmFscGhhID4+IDgpOw0KPiA+ID4gPg0KPiA+ID4gPiAtICAgICAvKiBFbmFibGUg
b3IgcmUtZW5hYmxlIHRoZSBwbGFuZSBpZiB0aGUgZm9ybWF0IGhhcyBjaGFuZ2VkLiAqLw0KPiA+
ID4gPiAtICAgICBpZiAoZm9ybWF0X2NoYW5nZWQpDQo+ID4gPiA+IC0gICAgICAgICAgICAgenlu
cW1wX2Rpc3BfbGF5ZXJfZW5hYmxlKGxheWVyKTsNCj4gPiA+ID4gKyAgICAgLyogRW5hYmxlIG9y
IHJlLWVuYWJsZSB0aGUgcGxhbmUuICovDQo+ID4gPiA+ICsgICAgIHp5bnFtcF9kaXNwX2xheWVy
X2VuYWJsZShsYXllcik7DQo+ID4gPg0KPiA+ID4gVGhpcyBzaG91bGQgYmUgc2FmZSBmb3Igbm93
LCBhcyB0aGUgZnVuY3Rpb24gd2lsbCBqdXN0IHdyaXRlIHRoZSBwbGFuZQ0KPiA+ID4gcmVnaXN0
ZXJzIHdpdGggaWRlbnRpY2FsIHZhbHVlcy4gVGhlIHdhc3RlIG9mIENQVSBjeWNsZXMgbWF5IG5v
dCBiZSBhDQo+ID4gPiBiaWcgaXNzdWUsIGV2ZW4gaWYgaXQgd291bGQgYmUgYmVzdCB0byBhdm9p
ZCBpdC4NCj4gPg0KPiA+IFRoZSBDUFUgdGltZSB3YXN0ZWQgb24gZG91YmxpbmcgZG93biBsYXll
ciBlbmFibGVtZW50IGlzDQo+IG5lZ2xlY3RhYmxlDQo+ID4gY29tcGFyZWQgdG8gRFAgbGluayB0
cmFpbmluZyB0aW1lLg0KPiANCj4gR29vZCBwb2ludC4NCj4gDQo+ID4gPiBXaGF0IGJvdGhlcnMg
bWUgbW9yZSBpcyB0aGF0IHdlIG1heSBiZSB3b3JraW5nIGFyb3VuZCBhIGxhcmdlcg0KPiA+ID4g
cHJvYmxlbS4NCj4gPiA+IFJlc2V0dGluZyB0aGUgQ1JUQyB3aGVuIGRpc2FibGluZyBpdCBhZmZl
Y3RzIHRoZSBoYXJkd2FyZSBzdGF0ZSBvZiB0aGUNCj4gPiA+IHdob2xlIGRldmljZSwgYW5kIHRo
dXMgdGhlIHN0YXRlIG9mIGFsbCBzb2Z0d2FyZSBEUk0gb2JqZWN0cy4gVGhlDQo+ID4gPiBoYXJk
d2FyZSBhbmQgc29mdHdhcmUgc3RhdGVzIGxvc2Ugc3luYy4gTWF5YmUgdGhpcyBwYXRjaCBpcyBh
bGwgdGhhdCBpcw0KPiA+ID4gbmVlZGVkIGZvciBub3csIGJ1dCBvdGhlciBzaW1pbGFyIGlzc3Vl
cyBjb3VsZCBwb3AgdXAgaW4gdGhlIGZ1dHVyZS4NCj4gPg0KPiA+IEkgaGFkIHNpbWlsYXIgdGhv
dWdodHMgYWJvdXQgcHJvcGVyIEhXIHN0YXRlIHRyYWNraW5nLCBidXQgdGhhdCB3b3VsZA0KPiBi
ZQ0KPiA+IHJhdGhlciBsYXJnZSByZXdvcmsuDQo+ID4NCj4gPiA+IFdvdWxkIGl0IGJlIHBvc3Np
YmxlLCBhdCBhdG9taWMgY2hlY2sgdGltZSwgdG8gZGV0ZWN0IHRoZSBvYmplY3RzDQo+IHdob3Nl
DQo+ID4gPiBoYXJkd2FyZSBzdGF0ZSB3aWxsIG5lZWQgdG8gYmUgc3luY2VkLCBhbmQgbWFya2Vk
IHRoYXQgaW4gdGhlaXIgc3RhdGUNCj4gPw0KPiA+ID4gVGhlbiBpbiB6eW5xbXBfZHBzdWJfcGxh
bmVfYXRvbWljX3VwZGF0ZSgpIHlvdSBjb3VsZCByZS1lbmFibGUNCj4gdGhlDQo+ID4gPiBsYXll
cg0KPiA+ID4gYmFzZWQgb24gdGhhdC4gWW91IG1heSBuZWVkIHRvIHN1YmNsYXNzIHRoZSBkcm1f
cGxhbmVfc3RhdGUgaWYNCj4gdGhlcmUncw0KPiA+ID4gbm8gZmllbGQgaW4gdGhhdCBzdHJ1Y3R1
cmUgdGhhdCBpcyBzdWl0YWJsZSB0byBzdG9yZSB0aGUgaW5mb3JtYXRpb24uDQo+ID4gPiBUaGUg
Zm9ybWF0X2NoYW5nZWQgbG9jYWwgdmFyaWFibGUgd291bGQgbW92ZSB0aGVyZS4NCj4gPg0KPiA+
IFRoYW5rIHlvdSBmb3IgdGhlIGlkZWEhIEknbGwgY2hlY2sgaXQgb3V0Lg0KPiANCj4gSWYgaXQg
ZW5kcyB1cCBiZWluZyBvdmVya2lsbCBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgcHJvYmFibHkgT0su
IEENCj4gY29tbWVudCB0byBleHBsYWluIHRoZSByZWFzb25pbmcgaW4gdGhlIGNvZGUgd291bGQg
YmUgbmljZSB0aG91Z2guDQo+IA0KDQpTdXJlLCBJJ2xsIGFkZCB0aGlzLg0KDQo+ID4gPiA+ICB9
DQo+ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJf
ZnVuY3MNCj4gPiA+IHp5bnFtcF9kcHN1Yl9wbGFuZV9oZWxwZXJfZnVuY3MgPSB7DQo+ID4gPiA+
DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBiYXNlLWNvbW1pdDogNjczMDg3ZDhiMDIzZmFmMzRiODRl
OGZhZjYzYmJlZWEzZGE4N2JhYg0KPiA+ID4gPiBjaGFuZ2UtaWQ6IDIwMjQwNTIwLWRwLWxheWVy
LWVuYWJsZS03YjU2MWFmMjljYTgNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQotLQ0KVGhhbmsgeW91LA0KQW5hdG9saXkNCg==
