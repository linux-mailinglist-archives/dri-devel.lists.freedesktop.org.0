Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BC780CD7C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 15:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5684210E449;
	Mon, 11 Dec 2023 14:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F59A10E449;
 Mon, 11 Dec 2023 14:10:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l595GWeM6OvdmzS/qc+Q/lVBM7wIgJzrWi/vf3XX9En960sd7bjoM8uDn5j5NzX/4szNbTiS6bBPmwK1QLs1JA8Pde05wDWAWO9Nal0AQmtSZINmS2ZInVBgiWYXh9QzPmts6lRxNUoZbhbUtQ3WdNNldKV+zChuW0pkryRjip4EuIc9a1eXRO0kXtcy5/Wg76lvQSIeQoKQCilxCff6P4nfqFYXYtQ6zj9hfLN7MePXvwm2DfIY0daZrqC02NQgduI9HAGpMBCu5S6vQ+SMvZHDRQn84epUjccA3kOdaD8xOlMO+KDCNGNeatNNTRHJkRWy1opdyhUBKQmYPsid3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGTAUAgOe2Rxv3MFUplY+t4wsfsD6GkJp6/grvz+4Ss=;
 b=dPd2xPea0+2N09Mwjo8w9aAg/uqfCHlO7EqTWiksFrjIbvFNbcwAd0yNqZsal8dZ4M+VjMXEBb+oLFyyjtN973ahtIG+NpK0JWGHHfWSA1KvDiNGSiDy3IdFpinl/zIOINXoK0apNDVqDiFzHpN/9CQxYqM6lhuwaVtZcHANCI5aZX3zBaIaG4DLxyLqRyqhYmN7LOJCQcuxslo1d28VxXsC9PZesxrXcZg9QPWIOUfCZwSZggLYw+UDS+xgwWNm/9CN+1x51oY7U5dr7vXmqRF2l3F4GJc+hkVBiLSZDM0qaizJnDriBSkxtVUFZCuBJIuM0/ly/cxcPKhgi2XQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGTAUAgOe2Rxv3MFUplY+t4wsfsD6GkJp6/grvz+4Ss=;
 b=SeH+G4BMCUodKdFdIo67e7UnFyrEViFntky8xtlK+LEG4ePAgQ8WLOw2v+JNsMJpHQZinNLHoX5DWZuK6XZH25P4Ps0LdMt1hJWs1G4RJ8MYU3BdUUJq20Bt1bQ9p3nZRnwGIryLLYjz4CL8DswOQPSqyxf7VWQYwh4veLVIZbPaqIi+VTKWJj+hSh7Sr1KzSjDJOWj+YKR+I2cCGS+AQXhYQpIilYLf0MjL/RaXrD+H0Yd9vjOcDytWIhfm+UPklapEVbwnZZxgAwU0A9fX1JsN5RaagszOxyYM2NEEbueodxF4rWIaElhTmBBPf+N42CdbYZa9lqz+aOw8XkV4Rw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DM4PR12MB5358.namprd12.prod.outlook.com (2603:10b6:5:39c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 14:10:09 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 14:10:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "sashal@kernel.org" <sashal@kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.1 13/29] nouveau/tu102: flush all pdbs on vmm
 flush
Thread-Topic: [PATCH AUTOSEL 6.1 13/29] nouveau/tu102: flush all pdbs on vmm
 flush
Thread-Index: AQHaLDnCvEoDgGsEwkG7/twRQkzGerCkHwoA
Date: Mon, 11 Dec 2023 14:10:09 +0000
Message-ID: <bd8a3db62ccf91d980fb2124d6002868b6224423.camel@nvidia.com>
References: <20231211135457.381397-1-sashal@kernel.org>
 <20231211135457.381397-13-sashal@kernel.org>
In-Reply-To: <20231211135457.381397-13-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DM4PR12MB5358:EE_
x-ms-office365-filtering-correlation-id: 49a5a033-f4f6-4122-1187-08dbfa52e271
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N4ONE66Sw2xH+ijlPd83IJ8vQDkOyQ2y5ek70sh8HlqIjCxRIYmbcXUjbVY64EulyHKKwjiCtjSbq2t77Ek702o6PJGj9xkL+7KPXxTKA9fmAUbpNeX1g2ELGd1gBI5Oc7oVbYkVQDP2h/RSS4f5sTwUwPF8VVLHCq5Q6dqrUINDNquyB8EwiHmqEHyJToZ9Ik4AGU4YfDOUbjfLNko3fCjh8a9CWgHa8fw2rZV9Q77Skz/iS335Clmj8nhj5w7gtRHbwA80lNbc5E4isKDm+udnHJrhYyM5otExJsNFXVc3bUuHBo5vaoLNN248vyzOYrJqhInDHKAmuHUdEAQfOW4HCthhT48oxIwMyUKo0nMAaO/YSycZQOVJExeOOhwFVXEQgyDf5QX2YagFULBHUE+n5rAzCNww/q8yBHEesjUV7kAG1XOvWaMcuiYn9gxNoF8GxI/UOa1tqOgW8ak/3/1R3pG7Gjd94iC4Ok7hUaYNeF7A3Pk4XAXlJkMtLgH2YJFF2Oq7BAVXXukcA0F/NystxT42eoz3BFq59Zjgj8AMqsje51HQEG+4jOcM+aPrX+guwzfigBX5nfyFS052JUPQzsFh5+DTYc33RTf4WHMMblc/+HkkEVt/q34U7qV4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(2616005)(122000001)(66556008)(36756003)(38100700002)(38070700009)(86362001)(66446008)(5660300002)(6512007)(6506007)(71200400001)(8936002)(8676002)(110136005)(91956017)(76116006)(6486002)(66946007)(54906003)(66476007)(316002)(64756008)(2906002)(4326008)(4001150100001)(4744005)(41300700001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFkwUVVrMUNPK1JKajNSV2J4QVhWZ3VIUTEycWVxaG1WYUxHYm9oUkt0M2Ji?=
 =?utf-8?B?d0xQYUordGdEcThmeWpncDZjOUFORlZpTmFzOUVKQXIxazlJNS8zN2w5RVFR?=
 =?utf-8?B?TnNaN2VzdC9EY2lyZThrYUQ0N0V4WndrY0RONHB6eVZZald0VW1oRHVpZUkr?=
 =?utf-8?B?ZTQzNzZ5RUVuNEg0RzdVd3pkS09CYjBReUl3TDBVWmhtR3NEaVhZTVdpR0tL?=
 =?utf-8?B?Z294L200VnBCMGZGUDdVTklOSVZZaU1IeDFTbVhqM0tHUElwV1VRREZIQjVH?=
 =?utf-8?B?RjZoeVI5VjlqamdONkFKUWo4YkhOOG00dDBSaS9HQk5wNFNzQmI1RGNQQXZs?=
 =?utf-8?B?Q1VBYTFLMDRFd3ZGNlFRcFIzMjVnS2I5Skt4dWdrbUVtUnp2YUtldUxlQTZy?=
 =?utf-8?B?SnhuQ2E1K2lNSVA1dTBQbTdsdGFYbDAzRTBPVXJXNFZaaEpSZ3p1VlVlZkdP?=
 =?utf-8?B?S2I2eG9lbEhSSXdZd0VpOFdyZU83YUZtY0gxWjhCZlowZExmVE1WeTZFYllp?=
 =?utf-8?B?SkN4Mmh2VGtzWktRSGZXV0JGdmM2cFFHalFRUmRMOTlMWFZyVFdYa2FRUnR6?=
 =?utf-8?B?UTB0bFVvUDgzeGV4dTI2NDBMaE1xR3hxVmdtMW5udWNYMG5uQTNHVFJZUE0r?=
 =?utf-8?B?YjlHL1lmbEE4SVpVZ1RsMlI4YncybG9UWWJXaTh4bGxuUlAvUEZmTzlDS2tF?=
 =?utf-8?B?VExYZ3FiNDFxRUpNSkYvNlVYQ1V3eFVEYmlqbE5iSkxOdEVkUFFDVHhpVlVq?=
 =?utf-8?B?ejk4OUZVdHc1SEZNd3p1aE1OZGZuMWJwZ2tISEhDYWszZDhlOGVpd2FXNW9T?=
 =?utf-8?B?MkFNdysxVml4Y2dnOWpiR0VkVXZEYkdGSzlrOGxTMU9udHVXZUdYMDZ4MGg4?=
 =?utf-8?B?OXUwL0JaRUVVc002Tmc3RG5yZy9iVENFUVR1NThzdERsM3Q2cjM2eDhxSU9p?=
 =?utf-8?B?bUJxanljOVkxSzhFdmExTU5kYjNzTGRhZnZSb1RZS3o1d3pxTGVaN3JPNHVx?=
 =?utf-8?B?YVM4c0IzWjdMbnpBbGY0d1VwdUpyalM0OVpIS3VIRytLYzlxUk1SSGpMWHJ2?=
 =?utf-8?B?R2laN0d4ZVFZQVQ3ZkVGQk5qQk1ETG92NGpkSHB1L0ZtT3U1dXBrVmJQV0k2?=
 =?utf-8?B?MC9KdlM1S1ZZbDBMbExVbWJFbFFUcElhU2xCQUI4aUVuRmtoOUJKTWZpOS9J?=
 =?utf-8?B?VWpSU3ZYSE9QUWNaaEQxWWxSVGVvVitpQ3pwWmFMYXpncnNlbDdkc0pKNENk?=
 =?utf-8?B?VUlPcjk2RVR2em5URUVqMFZsbisxWHhiNW1GdzZrWC9kS1ZyR1A1YndzbHpD?=
 =?utf-8?B?cTNEYUxRNVVmUjlwMWs4T0xxOHNIb0EwZ3hPek40SzJuNDhnYkpOYktIaEpa?=
 =?utf-8?B?Z3BnMlM4ZEZJL1FheWphSk5LcGF3RWVET3NnT0VlUHhpQVFwbkx6OVdCaHJT?=
 =?utf-8?B?T3ZhcjFDWWI0OTRLNlQ0dmJsMnA2Z3BMS1IydmRpcnpBNVZzUnRqQnArT1A2?=
 =?utf-8?B?cHRBSzNUdWMwVmVsVzNFemZYSlFzdjdXeDZjMEd3ODdlcUppUDNIRTVuMjBM?=
 =?utf-8?B?aGZqZE9id0NrekFhRmhuckJtY3JUNkc5RjRremhUd2RXVnI2TmlvejE3SjU4?=
 =?utf-8?B?YUlUSTh2R1IxbmZDRzhVNit5aTVzc25jUUtIZ05VSXltalRxSEZ1WUlBUHBZ?=
 =?utf-8?B?VEgrSXpKUVQ4VGNJUHZRMXRqTHZwKzNOK05PTjVCc0lqR1FqV2JWeHZyc2Ft?=
 =?utf-8?B?WDFOMVE3b0xQYTRLQ2kzQ2N5b0llaEZBeGdOWHk3Q2NDRUhTcDdBNnI2K2VX?=
 =?utf-8?B?UVlXNi9YOGJLcFBlUTAxVVkrbkd3cUxLM3FBWGJyb3d1NCtSNEtublB5ZWV5?=
 =?utf-8?B?c3hKQWhKSHNkQk9ENjJKSGdGM3ZWMm9nZkVzaTFyTFpJN3VTNGZMTk8rUys1?=
 =?utf-8?B?bkVkbk1OYUw0ZDRTMzhva3ErTGx2cEtNblZNY1JRaUcxalZxbWx4YXNHUHhS?=
 =?utf-8?B?V0NIeTUyNnlqc2h5bzFYMlIrcGlGdWJVQjdPd3ZEbzdOUHAyb1ZVSW1nTVpo?=
 =?utf-8?B?dEpqemdpSlI1YTByZ0pyQitqUXBXWWNOM2RGRDJmallXN2hXWUdFczZUa3lB?=
 =?utf-8?Q?0ggkFAF8cLHLIouOcuHTn7Yaw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24B3BC1243D4F94EA574069BC4E98D0A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a5a033-f4f6-4122-1187-08dbfa52e271
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 14:10:09.5952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZDHgiFeW/yOh18JgQ4FgnoxXAAS1tDGD0tYFTy0/ilOCeEW7qEoROyuqtG6Wjo5aoZ/KvXQI/G0yl7OTYXXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5358
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEyLTExIGF0IDA4OjUzIC0wNTAwLCBTYXNoYSBMZXZpbiB3cm90ZToNCj4g
VGhpcyBpcyBhIGhhY2sgYXJvdW5kIGEgYnVnIGV4cG9zZWQgd2l0aCB0aGUgR1NQIGNvZGUsIEkn
bSBub3Qgc3VyZQ0KPiB3aGF0IGlzIGhhcHBlbmluZyBleGFjdGx5LCBidXQgaXQgYXBwZWFycyBz
b21lIG9mIG91ciBmbHVzaGVzIGRvbid0DQo+IHJlc3VsdCBpbiBwcm9wZXIgdGxiIGludmFsaWRh
dGlvbiBmb3Igb3V0IEJBUjIgYW5kIHdlIGdldCBhIEJBUjINCj4gZmF1bHQgZnJvbSBHU1AgYW5k
IGl0IGFsbCBkaWVzLg0KDQpEbyB3ZSBzdGlsbCB3YW50IHRoaXMgaGFjayBvbiBvbGRlciBrZXJu
ZWxzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBHU1A/DQo=
