Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C87189C009
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B08112577;
	Mon,  8 Apr 2024 13:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CXifE43q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2108.outbound.protection.outlook.com [40.107.236.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20311257A;
 Mon,  8 Apr 2024 13:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LThgZWgekuYRAvzujBAonrmz47bzD0AbrUVkPgoHiIeOyNnuqEAoReb6hMMSh2MTvCH2wcL4+X5ncfaewMr+jS3regzLb4jNkt6S8PCLzC8JHagpwRObzKzUWNW9POeDEHxX2Q+onStREJTXcZXUbZlPJkqvPJi5vXJUmgSVmX1RwlaHl0wAzrrIcI+Y4K1kQ31XSy7++jIGCSAH6+E7VvzS36ARiM3gIrO0XwU8Y2tNazze1ZBJuw1FU62HQjKS25OpEzp9agnx4SBpyHx3schPrtVtK0zMpoZgasgyujDUUWRh2rzXZr9zgAWEDBfHhpLlm7EAt+mnD8TEowVpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwYi50xc6xElhXgl6GFyjYr4YJMIDhqtiGaSDeNRKoE=;
 b=k+oZeDp87e3+fRNmVa04JkLsVnkd6t5i8DQk3ayreo/NHBRPkb1diUNYosN6qEvqQcNRN3LtQpejuVmsgzsEP2WmZYOlLocAdHZPgxugf36206mBpYOTjGefu6eVsb5BPxWK+tjKhcIIxxDDhv+VBU8dhRxB0J2LSYFQd8hxVvHCxrUTjueBTeEomCmevFovPrE0pNXeZHKwhfvHFuWnvlLSOFDedqGFoNThd1Yk5qWz5pkiU7YVKUWD/dbPB19ep6KOvxc3AAwaKtbphcxm4EblazaeA5SIKoic8P2DkDd7lceJfnZmfW6v/yvVmOT/mq20pzxqTDuNfGjEOgNZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwYi50xc6xElhXgl6GFyjYr4YJMIDhqtiGaSDeNRKoE=;
 b=CXifE43qoYrxj+hz60YknpE+WnJ5kIDTjNRGDqeViIV1eJn+c9G4F0PQzG05hq+KrJ7Jb+nfTK1SJVXfeYZxv0oaU8mVekTHg8XI5uQC2/ALN7P1sA8ooZ7kSmWdJ3Bl+g/CT8XDpVsypkckEpGv3uWd4iqo7VCSEsuHRCgoKUOVqK4N+ON7+36nHzos6N8ZA3ILqIPtzsDLLzqrjvCA7lw2XG0VDGytJQSh7s+Waq9fUsGOl7Cg1UCC9IbdFeSm/i8szyYTLVzt7HgXxg0gmgfkEXpfqFdzumzbbZ08ioBcHuJsL6xKHlJ9ItbpucBXXv/gaT5znN4CE+JmGge/Tw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 13:04:59 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6%5]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 13:04:59 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] nouveau: fix devinit paths to only handle display on GSP.
Thread-Topic: [PATCH] nouveau: fix devinit paths to only handle display on GSP.
Thread-Index: AQHaiYAR5xc6cO2d1EmowSloAoQBBbFeV7cA
Date: Mon, 8 Apr 2024 13:04:59 +0000
Message-ID: <b7f005a5bc22cff08509ce75f8eee7925047e8ae.camel@nvidia.com>
References: <20240408064243.2219527-1-airlied@gmail.com>
In-Reply-To: <20240408064243.2219527-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|PH8PR12MB7027:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BmL5dDkhPwxA8CetJyL2vls4Fb7H+0/nfbPkfscyHrnLwQM/N3XAPqF+5o81X3uzOkmUhoDY4O+gpSWezvOnQV4yyTYbMsLA7Jb1n+EMdsep5hZwWJNKpzRM7I+Eb83SQMqVDAjxqAUlQ+pPrZGXJN4lERp8psucFPiVebwwZc0J8vqCE1Qb2kBexRkEx3UOjAgxCvXqf8LwSTPVKz9IajqnGnh8Cv6gdMN2V6OLYY8DIw9jJL2S+jRtLp6k2WbBvCeG5WlUsyoQXAGlLZ+DNJHMX7nSEih1SvtScHK+Vlv1M4O58BVUj5tUjGAhRo75UpARt0+gdaOokACg4JVPQhQMxXeuBZHV5stb/y+ReodS4rKk6o4UaRaZSZ5WowcCgHZSwkfQhFHFpY2Ueg81H/K3WphOUAhn7Dt6zYkp2tIhpbeqAS72QMwklNJFIu08Ja3gYgpw2V1I/ET1eW6sjtGecuxNMNBEtBy5aRKsHbDe5K0j51ysbXhT4gHIgG5bKxRxLeWh3uopmgzH6f9Nts58CYdeYD5y3b64dOMPTO22dHhMcgc4kZkehjq25KEc4ucs6u1FnAJK55QvqQ98fTA8SZHg1fPS8RT4cosNDaAWNQP2wJeaW9MPaaIhlIYgd+A7qOpmwJZ0Kc2O9+WJlNf1KQs/fTZIpJOQjefwUJc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzlpZDUzS3JTQTQyaHpRUUVWRTR3WEFmM2pjRExOc1NYc0VRb1liSitVekNT?=
 =?utf-8?B?ZjNTSEZKU3pvRzJCb09NeVBFRllZQmVwT1RsMlNTNkMvREdwU3JyS2g2V0ZG?=
 =?utf-8?B?bUdmcUhpTERaL3FhVWdxclBKOW8weVBQbk1jejFtMDh6cDlvZFdZRFl0WnYx?=
 =?utf-8?B?bkovWVplSW8xVTVQN1k4UldON2NiaE16bWllOC9kSzlCeWZuaHIxdGI3LzNS?=
 =?utf-8?B?c2gvekoweWx4ekN4eEhyRFRIenpiTnRudWkyYnhoSUE1NHZmcHRtTUdKemh0?=
 =?utf-8?B?SWI3TTY2VUhQWWhnL0ZNZDFuQXZ0SHE1ZS9adVlPUnk0ZVh3YVIrVUZ5SW5T?=
 =?utf-8?B?Y3pSWDhkWUllNE5icHFSKzBDdEx3TW52NFQ2VVN4NDlCM3haWmFMS0RlMjZz?=
 =?utf-8?B?Q2Z1cVJNY0EvZTh1N2E4RGhuUGFtSkxxOUZVQUpCYnZ3OENVM0JKeW84VEJZ?=
 =?utf-8?B?Z0xsWWFPWEY0MXg5T2M0Nnh1RHZhL2h4a0RpWXNoQkY4b0hRMUhwS3NObnNH?=
 =?utf-8?B?dXFTZzBxZjVoQWJ6ZS9ZNXFqeEppZVNkOGw0MWd1T0pPaTdGRGw1a1Q4ckli?=
 =?utf-8?B?WXN2cW9JMzE0QUpjN0QxVTRxc2lmeXdqU3Q3M2VKQjU5WDFoMW1pdnB5Mlkw?=
 =?utf-8?B?UnRWZ0MwSGJrVlUreTN3L1d2OWpRTk0xZytqNmhHN2pDVUpZSlJocEV5VlFw?=
 =?utf-8?B?YnhGUjZiTnk0Y2NXLzhPZlRiWDI5V01DRk1DRlBiVTFqQ0FoWG1QZTU1dUxm?=
 =?utf-8?B?UGJyS1lIWXJCTnFDVzJYbHhUUHJWWmZWWXVLQnRpYmVjaEM2eEx1YkNnY1Uz?=
 =?utf-8?B?bHhDemJyU2JWemNxd1FVVEpsbURBTlVWSTFkTnRhSDFBOWMvbFlqdjJPS3dU?=
 =?utf-8?B?QmRnQjBSK3lkVmVxY3RVWDhRZjkvZHVjaXZlWDErUWNoYXBST2kyam9wN1h0?=
 =?utf-8?B?YmFSYUI2cDFBNmR6dDFNbDZZYlZaeWdjRHd4ZlJhWS9mU0lFRkFLQU94dTAx?=
 =?utf-8?B?elZoWkc0azlJSnFDOWVtZ0V6Y3p6amVkY3FEdjNJTXExd0JTUERLMWk5Snp2?=
 =?utf-8?B?OEx0N3liTVZEK3lJYVRuc2s5bXBkdUwrM2ptOFcrc3RPREM3R3Jsa3Y3RGh6?=
 =?utf-8?B?TFNIcElQZkxqWUM0U2d5SjM4eWV5blBpd3ZNKzZVZFAyNFBkdGliWnM1NmJy?=
 =?utf-8?B?bVFHbUc5RVhDM1RvWENacFhiYjhBWXB5d2ZWWG41Sk55WDZzVDlaYUJaZm8w?=
 =?utf-8?B?S2N1ZXZ1eFF1U1VyMEo0bUZKbWtNdmFhcUJwWUJDeE5MTlc3aE9yOFlaKzM1?=
 =?utf-8?B?TzdCYmV0ODBIcFlJdzYzWVlFSG1BbFdMOGpwdWNzcXJzMk9yWjJ4RFB5VCt6?=
 =?utf-8?B?Z3IySEQwTUNrSWpvai9RV2FMLzN2MGtvek10Nm96UjZCYzcxWHZXQzlURDdY?=
 =?utf-8?B?bytYS1o3eUhiZnJPRFZSQ2RxNW9VNWFOWENrSCtEbDNPaXNiV05xRXdpUjZw?=
 =?utf-8?B?ajg5VXdYRU1VWnBGZWlDUkNPYjRFSzlQSjZ4L0h4QXpGZFJSc2N3ck9lZnVr?=
 =?utf-8?B?cFl5blBkT3RuVnB4Y1pZMThVeTgzT0k5VFZ4L3J1clNWcG1aNk05UGxPZWdh?=
 =?utf-8?B?emN6YnJMZERkZDJzazYwZGJRc0JnR1dWTks4b2VnN0pGOUtXakV0SEJ3M2Zi?=
 =?utf-8?B?OUFreGdJL3ZhRWdkZThUaC9kbWVTZGt3cENXZkU4ckFhbWJWc2wyVCtyRW13?=
 =?utf-8?B?WDZtM2s3WGdLeEJkWVZIdHBNL2d2dDFVSjUxU0NTK0ZjTmNZL09nWUFXaldC?=
 =?utf-8?B?RDNLTGllMHZLWnFYWklUUCtEVmFOdm9EcGUrUFBBVzBrNGhBUjF5WUp3aXVh?=
 =?utf-8?B?ODN2S25ZMFNjbUZ1RlRMRGxkZGprcUJ2aS95Q0E2cmhWdUFDSC9Ocnd5SjBx?=
 =?utf-8?B?UUVOQmVLbmNPMHNlckdDdVRPMHl6UGh0NmJvMmkrTHR1dGhacWVTNXJRVjlF?=
 =?utf-8?B?bEpmYXd3R3pPNHltL2hJaU94ZmpkL1cyYTJHUENDSHRHUG90dE9TL0tveGxp?=
 =?utf-8?B?Nm9UTzlYTzErdVR6ZjE4RHZJZjhlUXhPOVNBM2hPVlBhbllzZ29SQ2wydDZu?=
 =?utf-8?Q?Gg5bs7I+ExoPvhQNI9XmJ7UHJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60EFB7AAF9E9E641B499D14840486B6F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dfd6f2-b8e5-47a9-f832-08dc57cc7f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 13:04:59.6087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s8ss482UG/YEAVHb+vRJefaFH89pcti7p+fUw2sUJB59uUdYPiniarU5dqRyvPzL4a/DV/bwaOgU7DWeLYVF6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027
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

T24gTW9uLCAyMDI0LTA0LTA4IGF0IDE2OjQyICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
VGhpcyByZXZlcnRzOg0KPiBub3V2ZWF1L2dzcDogZG9uJ3QgY2hlY2sgZGV2aW5pdCBkaXNhYmxl
IG9uIEdTUC4NCj4gYW5kIGFwcGxpZXMgYSBmdXJ0aGVyIGZpeC4NCj4gDQo+IEl0IHR1cm5zIG91
dCB0aGUgb3BlbiBncHUgZHJpdmVyLCBjaGVja3MgdGhpcyByZWdpc3RlciwgYnV0IG9ubHkgZm9y
DQo+IGRpc3BsYXkuDQo+IA0KPiBNYXRjaCB0aGF0IGJlaGF2aW91ciBhbmQgb25seSBkaXNhYmxl
IGRpc3BsYXlzIG9uIHR1cmluZ3MuDQoNCldoeSBvbmx5IG9uIFR1cmluZ3M/DQo=
