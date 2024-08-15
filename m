Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402E953BD3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 22:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D137C10E54D;
	Thu, 15 Aug 2024 20:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="asviLQ+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8671E10E54C;
 Thu, 15 Aug 2024 20:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B47oIdPk7Gr6qpJXU3hzwKJBdqn/d+01x7TITwj38iVRT4hsU6CsiqEx7NpvtVNnuxARm1nWXGYIC27kiMSiuLI48MR2mv75vVO3xxc/JkuKL7mhmnGpC5w9JMoTxO6z1GeKhh+I0jGj5hRMhT5of5nY54zJ4pZ11MqNBo9ixXVmejq6SBdICxJBBXR6JML2HdhXnASqO1gG9SRnrr8xM9qCjFJsbMambYxzGlf78KNG5oVdZ1ywx78i88Us5CGAn09nR/7cizXPqoyr430yx/MTKmCb0P3Om2yPr/QmlPcCslUlElyatHNkLNo79gfLKKzcRQ0QpkTu2ktf05ZHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJmhG4LGJpxvlqrnSap4woioUztP/81aXbeyXUFvTK0=;
 b=F6MrbieNZ0OrN81JyXZ4GyDTgNP3/bi7X6E57cz9ZJ8khXTCa78G2notKwpNhw0+sdhbLOKEYL/eKiL20FvsU4kcPUOyLFsjP6Zd/oGIPuyPciNAHJoTSAd75QDtRtm6hcFLBZaXzNslL507QuZ5oe0UqUgIdOqhgyFM1rWQw5WwoLfjc8DAeG93niRBESJ3uK9TWGcw2YWbvn3wF7axnJSbSJYvuMQWxCTPzwBT0mWVY0eqpR+X7cbgJep8mktsb4+3FzH7FU39MYPFPi0EDJA0JKx42Kwm7cY/8wYtPzjiCyI3UT8BjMB25aEQ9tE1SJVRiQuUu6Uj6xd4quDjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJmhG4LGJpxvlqrnSap4woioUztP/81aXbeyXUFvTK0=;
 b=asviLQ+3DzrSOlj6KA06mC09eKbpWzH5cl1ZDY1jGSFPvhpqTVeENGqCVlDoodBZOibqblQIqRc/dygMJYEfGLqVoWntoiXCuvmh3SVgK5UXcWbsLJoX0Xn1+/qN7mY0/bFMYhuq9HDa8klgkuwbHu+J/RRC3M8UmwoLISZkK3Ox6oXzcnImmyEEjxlJ1yhkAcC9lVd1ZILWWSvEoyJUmf5dLY7pO/Q9kYtet1kK95uTFlcR8AykMapwFZpVAYfkOneQyWxp9Ds0HWrxvZMW1z5tDadlhW2Krf3sxlPcS/lSXjExE6CJxImfCVmT1v3kzv0xLzUFO95V/zWRriba+Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 15 Aug
 2024 20:45:27 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 20:45:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading. (v2)
Thread-Topic: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading. (v2)
Thread-Index: AQHa71Fg7FxcvLbo8kmb6FT2cC4qx7IoyXoA
Date: Thu, 15 Aug 2024 20:45:27 +0000
Message-ID: <cc55ca650cb4c09a6e11a3a80c75a526f34ae6ff.camel@nvidia.com>
References: <20240815201923.632803-1-airlied@gmail.com>
In-Reply-To: <20240815201923.632803-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA1PR12MB7519:EE_
x-ms-office365-filtering-correlation-id: fec8d005-e6e5-443d-80d3-08dcbd6b31a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2ozQWRPY3hHWTM4dTZQc0hNNjZJUTlwZExpOHNwY0tvcjhSVWlnS1JmRUlZ?=
 =?utf-8?B?UnZvam5nRFc2Wk1uaEFhUmRvMlFqS2hZZmxKbHNnSGNDaGI0NDdQVGVWS3V1?=
 =?utf-8?B?anVxSUdOeWxTVGxva3JnUk0rcWNzTmVrRWtqemMrNFc5ZElaQTNlajkzMHFV?=
 =?utf-8?B?TDg3UTB6cHJ2SDdWS2FEcE9hTm9ucUlmV1d0UGZJN0pGVVE5T3ZjajNRUFVw?=
 =?utf-8?B?STIzQXdJRmFKTjlTWmlQNmVVcFh6TDAxVTl1b3BoSEJpNkZSZ2xsRW1BMEdv?=
 =?utf-8?B?eWY5NzB4QnVRdlExOTY2RHpiVHVQamF4blBMb1huenh0NitkNEVIWXF2Q0RX?=
 =?utf-8?B?eUF0eXpob05Bd2F1aWJlT2RTTEhxQ1pMUFpBa2dVWURZTmMyV005Z1M5VGFN?=
 =?utf-8?B?djZ4czEycUVDMFJVcjJodjI4cUN1ZklhcDZneVFmNlExdTYyMUh4b09oVlVr?=
 =?utf-8?B?ZWlaREtUODd5OWQvZkU3bTBrM3FJa2ZsRnJzM1NlR2wxN3Y4MVM2d3dJSVc1?=
 =?utf-8?B?YWI2MDlvTExWdHFGNVhzbmNRb0Y2dCtDdE1EY1ljRUdxYlBpdi9VclFkRE9N?=
 =?utf-8?B?cFg1TEcrMGQyS0NXN2R5cXpWRVNJUG50SDJFMzJKQysyUHlKK0NDcUdIakEw?=
 =?utf-8?B?cDZCRVNoNlE1N1czMit2UE9Db2REL0RDQ1FTSEszMzV0NllzSm1TMTkzZGRr?=
 =?utf-8?B?RlZUNGp3bTlZRjJlY1F5a1piSlhCeEU3enAzUGFyYTdRVUdaQjNRSSsrb25a?=
 =?utf-8?B?TzU3UlNFd29GQXcwbmNPN0FTOE8zV0phR3kxTjQ0aVRjeExyRkhuNzFXbE1p?=
 =?utf-8?B?WVI5aVM4L0pBYmlTZlRIU0JqcHFOMTFlc2pOam05RURTbkRJTlprQkZBd3Vw?=
 =?utf-8?B?T3VSRDl3OXI4aThMSHpjVkZYbUlzNGkrQUZsU20rbWpHQkJNYnBSYXlkM2c1?=
 =?utf-8?B?c2ZTZ1oyYWRUWTBCQkhic0hSWHZkY3hnYkt4b2hqeDU5YmFMT3ZDTC9kYk9m?=
 =?utf-8?B?eVJwNW1Kd0FMbldrZHBSOTVZMEduVG1aeUY0WmFpcFFIU2lINUp1Ry85aWo0?=
 =?utf-8?B?UzJPZ0UyQTR1QzNiOTc5RnNQb0N5eWtyd0VNWmNVTzU0Rjg2VVZZQ2NYZXc2?=
 =?utf-8?B?KzB1YjZvT1UzVGUvTFlrakhXY244aUc1ZXg0VURDR2VJaHlmbC9vSXpaVG9h?=
 =?utf-8?B?UzJEb0syT3drWUgyMjNGcVdMemNHRys2dlJxLzRoa0FSKzJRMzcwTHZ0Tm5Z?=
 =?utf-8?B?UVptRC83eEFTZFZ4dFZKOFhkZ0dUdXpJcmRNS25aRkdWakFORlV1NnQyL2g0?=
 =?utf-8?B?TDR2aVNKNWo5TkgzYXhIMDhSSG96NlhoTGRCTEJEaGp6QnU1eXE3NmF4aWds?=
 =?utf-8?B?UlRnVHhmKzZYVjZkTmtwSGR6am9scmp2MGJKSHBBcUlCZlBoZk1jOG9jMXlM?=
 =?utf-8?B?NkFZNWlGT3RJT1lsRkVTaHZLa29oandKSjZqeXhrMkhJUWk5eDRwaGlGbWhQ?=
 =?utf-8?B?MERlT2dzajc3bmh4SUs0SHl3d3VPTGFCNWZaK0M4bWJHMUdqNE5zWnZHN1hU?=
 =?utf-8?B?bysvVms1cXJ5MVpnZFBFZDRjVnRHSjNRY3FwZjhXVWVVUncvRnpPU0RCTTlx?=
 =?utf-8?B?OExPUUpuSW9aUXNjNE9XaWJWaWFzZ3A3SkRpZ3F3NS9rdnVXZHlKeU52ZHIr?=
 =?utf-8?B?MlVaaUtrK1NmeGwvdEZaTXdNd2kyV0tXd2VMUVRTZkwyUEMvNXllVWZicjJu?=
 =?utf-8?B?bHlNRDlQUnJEa2pwNVhlcnVrcUg0SHJpOWdwWEx2djlFaFBvZFNTT0VBbVVa?=
 =?utf-8?B?S1JpWUgwTG15eU1Zc2N3SlNXVmtFZ2VsMUJxeUY4YTdhUlJ0NU9Hc3JUVkdZ?=
 =?utf-8?B?Y3lYQW02TVh0bnU3VnpZQnVrVEdUd3FpRWF3M3dxYWVmbWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkVuZ1hlZlZSTXc5VFZNZ2FBUXR5WHEwTnV6dGwzazZkalFlS053bXlSVU9H?=
 =?utf-8?B?VU1pSHNKOStWSXRnQm1XMG5Nb3RsWmcwaElSbmdGejEwRVdYVytmKzRIT2ps?=
 =?utf-8?B?MlJhVGptdHNOYURFZ2dJbWErWFppTFoySEhyK3NuYkxvakwxL012WkxlZDYr?=
 =?utf-8?B?Z3NFS3V4MWpxZkRERFZkN24yNkdSdmZ4cFhZSjZqNDArbW0xK2lXMkMyRVRZ?=
 =?utf-8?B?QXNoTlNmbHRwL2VESUx2TndlRHV6YmtYZXlObWlVeElHdlJ6VUE1U3RBdVBt?=
 =?utf-8?B?enVPeHI4TmpDa2t5SUVUMkpNRFAzeTU3akNsZDlhL2hlRjdZcFNteFNQV3NN?=
 =?utf-8?B?N2tDSmVwK3ZrNlpEMUxWSGZLbXdmRjNoZXRmWUVHVkZwN0JIVW1qNzFwYlZ1?=
 =?utf-8?B?Yi9ua1p5d1ZNN2o1dnduK0tWTk5KZS92WnVDMlVKbG1tQSt0YlBOVGRkeUM0?=
 =?utf-8?B?UUJpUm5IamVNTkZWaHlEQmFwWUhJRXJRZ2FEQ0E5VjVrUXd1UjI1cm9ndUd1?=
 =?utf-8?B?bWRQdDdVdUtDME9XVldRUFYyd1Aybms5R2swUXlSbWZWQUZ0dWNLTnlNbTdP?=
 =?utf-8?B?SzV1WnRCdVd4OFVKSFJTTUMrWVZCZSs1MGlaT1oxeDJHS2JtNG9OaTVRTzZD?=
 =?utf-8?B?RVVubG9BRHRTdzFJVWhZOXJVVHZNbmUvVDYydFF0L2VRcWJDMDN4b2prWGZD?=
 =?utf-8?B?UW5VZzZUbm4razdLbGswTGduWVhXOXNsWE83UWU0aC82aFhNRGI1aytaWjgr?=
 =?utf-8?B?ekRaYmlTVGVJNkdGZzVvS0JFdE9UNElvOGkvYk1DWE05Zk1IWmU5TWRMS3M1?=
 =?utf-8?B?R05wVmdNSXlaazJpNCtLNVczb0hubHdEU2J5bHZPVFMweWxoTldLNDliaWRK?=
 =?utf-8?B?Z1B4eDN4NVNtem11ekhoVDA3ZG45Q3F5L2E0UGZtZTZ3YjN1OGpUWUcySW1s?=
 =?utf-8?B?ZGlWNHlQenNvQ2U3RkZuZHNOcyt0bzc1ZWFuM0xxSmtDS0ZZM3ZBaDlOakpn?=
 =?utf-8?B?c0VqanJwQ2VocnljT0h3c0xoTkNzZVpGUVFBUVF0Mjh4ZzcxbGdObllRU1Zu?=
 =?utf-8?B?TWU3dWdEdGRkMEUyY09NU3VJZ2hZL2Y1cEJDYmxmQTBjV29rRzVWdVNtSjlK?=
 =?utf-8?B?akVBNzE1d2dsMVNOa3FhbGQ3RzRQTmJHNGt4S0hIYzNOWmRITkRlaktya0k1?=
 =?utf-8?B?KzY5aFNwY0sxb2ZpcENYZ1RGQVVPOCs4OUNMbEJ5MkpDdUVTbFVpS0dROWpH?=
 =?utf-8?B?ZmZET1dPQlNIa0svRHppemd2YmJybzAwOVBMWUZwbGZySm5CVE9ETFJaRklR?=
 =?utf-8?B?SEl4S2IzMFBoWlNuYzVXMUNTaG5uRXpqNnh0MU53WFJkeXV0dU5wOXhkMzg1?=
 =?utf-8?B?UDN5aDlhL1RnaU1LN01kaFlmY2ZIVklaaFhwNlhvMEtVMzB3UVRjNDBCYnJi?=
 =?utf-8?B?SzVHOVdwS3JKOC91VTlybGR0WjhJanBZblRNWVRweDhMQmsrbVlLd1dyV3Rs?=
 =?utf-8?B?djRKN3BhTnJpRVJTeVlPVC9Hd2tDV3pmNTJ0NDZnUVd4cSszeHU2bCtlRmtB?=
 =?utf-8?B?eVpxMW1VcUtFQWxUQmRXOEYyNjZIREpQbHRtWitQTlJxNm5FbXhrOGRFejlM?=
 =?utf-8?B?M1BPanozbUI3OUprM3J0ajdTcVozNGIyblBKWjFjbFZLbWUyZFZ6ZDVMYWdk?=
 =?utf-8?B?MlE3ZWJyL1BPblBSUzNQemtVWFN5dHhVNTh4MmZCU1J3ckdBUmlJazBqR2FE?=
 =?utf-8?B?ZzZKdk5lcDNRNElYbUVUWmxVRGpNdXFZNE15eWF5STZtU0hZSldnTUFHT3d0?=
 =?utf-8?B?bG1oc0RJNnZkRXcyZGRFaTZ1emxpdVJhWTJKSy9jejFpd3hKK2tPa3o2RkxS?=
 =?utf-8?B?VEtmQjNWeXk4ekdVc01XeFAxTTNsd3cvaXBsZi9UR0dlWVlSS0p2b01jQzB6?=
 =?utf-8?B?U1ZjNjNKdlhzUWVyMWxMOHQwMFRXbndQZ24vTDg5RWRhQUlKUW5XbGFsNUFu?=
 =?utf-8?B?TEQzYTRhUGU4TVFkSGF5b0k0ZmlYbGROcmo0Yytzb1U1M0lEN09rNGJVUFJr?=
 =?utf-8?B?ZUFYZCtjT1NYTjVmSXZKQXhmYkh2dW1UN1JVODB4TkpteG1LU0RVQmZGeEg1?=
 =?utf-8?Q?yq3DmCUdcwhBEjHmYHTwpV2k/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5BA5905B831A84E89F3863B5D643F12@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec8d005-e6e5-443d-80d3-08dcbd6b31a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 20:45:27.1642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VD+ND4yfKZWuLr5zpw9w+tqX28AB/S/8XI1ZdPYAiLHKnE/ZpfafYS7gggH0aB6aJ6EKaznhbHIZe0GECljL4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
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

T24gRnJpLCAyMDI0LTA4LTE2IGF0IDA2OjE5ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
Rml4IHRoaXMgYnkgdXNpbmcgdGhlIG5vbi1jb2hlcmVudCBhbGxvY2F0b3IgaW5zdGVhZCwgSSB0
aGluayB0aGVyZQ0KPiBtaWdodCBiZSBhIGJldHRlciBhbnN3ZXIgdG8gdGhpcywgYnV0IGl0IGlu
dm9sdmUgcmlwcGluZyB1cCBzb21lIG9mDQo+IEFQSXMgdXNpbmcgc2cgbGlzdHMuDQoNClRoYW5r
cyBmb3IgZml4aW5nIHRoaXMsIGJ1dCB3aGF0IGlzIHRoZSByZWxhdGlvbnNoaW8gYmV0d2VlbiBu
b24tY29oZXJlbnQNCkRNQSBhbmQgc2dfc2V0X2J1ZigpPyDCoCBZb3UncmUgc3RpbGwgY2FsbGlu
Z8Kgc2dfaW5pdF9vbmUoKSBhbmQgaGl0dGluZyB0aGlzDQpjaGVjazoNCg0KI2lmZGVmIENPTkZJ
R19ERUJVR19TRw0KCUJVR19PTighdmlydF9hZGRyX3ZhbGlkKGJ1ZikpOw0KI2VuZGlmDQoNCkRv
ZXMgYSBub24tY29oZXJlbnQgRE1BIGJ1ZmZlciBoYXZlIGEgZGlmZmVyZW50IGtpbmQgb2Ygdmly
dHVhbCBhZGRyZXNzIHRoYW4NCmEgY29oZXJlbnQgRE1BIGJ1ZmZlcj8NCg==
