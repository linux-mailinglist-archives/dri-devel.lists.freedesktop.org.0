Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D02B37392
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 22:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C7C10E6A5;
	Tue, 26 Aug 2025 20:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FizetXhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E37210E387;
 Tue, 26 Aug 2025 20:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl7DcK59rTVzF4/lR3RtzXqh69Y5kfxdOWxLcJt0MOyV07++GfsFF1WJF8n4340cgWqq+YZdQIMgb22F8xxRkIz2B3VLHZZZHUCE9nY38BHUG77H72mSpf9uK7XOvdtFjvJSjQCpZ43+bnAxadhRQ92UIT6l1c/YqNbHvF2753NKtRErSLFKhTbzB4zHMO40JbN2A7tDMg5lgWWEKXCkSDgNx0jjAa4w2YEBgMPZadPQ4M6hWwi3BVtoZvjyvmtnBEukAigvmvoCZ7EXV+ga+F/qaW1ACC66mwNvLC0FLBe58tmdGRup1PlpR78c2kNV+U78m5MDE802pHt3HEu9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3bpMSSYhG+VyVo23JhX2YlQjSKcJsVD6IuOcr5x5bM=;
 b=epQfrdQMASJaP+q8nkqQBUOZaiW5AczGRcQfNdTG6qWwfjzKtlRaS8qP/Vl61KoNcuYjz4fuGD2Xv4+JTb7XdJabt5GEKLySlH5NZWHIJeO3/JLR1j2fKm7DUA2dbe8mH1wYzWNyewfmHte+20AMiQ14r6cFCPXPskqsaqKiSrFU62NQWp29ZmSy5c/LTHAL2iouqXhDBSmXUCETdQScb162TOivILyLSlAnDSJvmvYX4crIrMVmIc/YthN2YieUfWuLiiPQp/O2gHq+XI//eK4SwafmreR4+KZT/h0CLlYkjj3WeWJAzkf3ZKggIXS7Zs3ZkRwd6utZ7VFbQP06/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3bpMSSYhG+VyVo23JhX2YlQjSKcJsVD6IuOcr5x5bM=;
 b=FizetXhHfWwUnvtlV/SjKowNEAhGBEnLGaMl+c9naqhCUl1DnC9tq3u+Ec6XZ4+BmsLxNzVc4UVAfeTsDxpTioZeRvX/HFyu4JCuspE5N1CdagWP1qoZ763wupHlNSuqc2Bp2pD58cRDm4rp1aReb2+8FF6UFuk5tQa51yXlXDrWrSOp0K6M7oQUjeh2JPi/qzPzNgihtYuTUdkux8/fCtLGkQ7GfKkRtsSKC4PJb6SsENMljwGVHTDV0FBBwl7QG5SjKfpkLbBqIv/ZE4aUWhI3vt3cRvdTK0K0RDWXNNyaHgwLSkVtmjf3gTYWlFp/j9ABTdiLEBdY8/fbdGKwBg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 20:03:07 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9052.021; Tue, 26 Aug 2025
 20:03:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com"
 <lyude@redhat.com>, James Jones <jajones@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update git entry for nouveau
Thread-Topic: [PATCH] MAINTAINERS: Update git entry for nouveau
Thread-Index: AQHcFsMm7/wAINhWIkmxM3JSlTRQErR1W1iA
Date: Tue, 26 Aug 2025 20:03:07 +0000
Message-ID: <50d214a85fa498521d70e2a0aebd2b02784123a0.camel@nvidia.com>
References: <20250826195716.1897-1-jajones@nvidia.com>
In-Reply-To: <20250826195716.1897-1-jajones@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS7PR12MB8081:EE_
x-ms-office365-filtering-correlation-id: 95f02cd2-a8a7-46e9-05f4-08dde4db92f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aURuZmxGNXlMMFN5aytPSkpweXBZMXFBY0tQbWRVekw0dmxJNjduaUVWWnpk?=
 =?utf-8?B?Z2Z4K2VvTkprODZ0dDN1a3BicVgyeXBDanppYmNUK1lxQk44RnBWS3pBNVo5?=
 =?utf-8?B?d0QxZm10TkdDaDI0TmtWaWNHVTJUb1NFUE0wWFdLMU9GdG9HOElRZDdwZE9h?=
 =?utf-8?B?TW11TU5ROUkrc1RyQktyNWZiaXNSSTd4ZEh5ZHp0OG1veExzeGx2cERqYTFv?=
 =?utf-8?B?ZDRYQ0RlZDJ4L3RaLzRwekFnVzFGakt0ZDlCaUxleks0YmdaZDR4L2xxSmNU?=
 =?utf-8?B?U1JleGpmWEwyUXNWcmZubGZTVTJNU2lEQVR0U0VORUtvcjM5U0NNekszazNz?=
 =?utf-8?B?MEVnRWM1UmdTeXJvNjQ1UDN3RzBndFl1MWRrK1Z2dkhYWUg2NndFWDdnQTNy?=
 =?utf-8?B?dS9lODJTOCswTzJ0eHlLbFBMWlpxWFN2ZDRkc1JrTnAvNitPSWJhYmhLaVhv?=
 =?utf-8?B?L1huZUFBYWNDRmx4Zjgrdmk2MjdzMlhMMTVKejNjUDdscG9NR0hTUWpQM0pF?=
 =?utf-8?B?TGRoSTZZRHZXeVZTVXVjdktkaFJXeFIrT1JlNnRuM2lEVmVMblZDNzVkMUFQ?=
 =?utf-8?B?cXJVWEF3NWVmdWxOOGhhVGp3RUkzZnBoWVpURCthMnlzOWJPTFZ6alZ6MENx?=
 =?utf-8?B?THFYaThaQmltWmRwZHZmTjB1Q3ZTeDJ3bkdYbFIrQnBMdURCQjZKQ0tYbVFl?=
 =?utf-8?B?WlZpWmdkY2cyWUo3Sk5kbENNM3B3OXJiUHZKdTVaR0pPeVZoLy9ZaFgyTmtV?=
 =?utf-8?B?V0Y0SnJYWnNFYlNlQnhCMDFtWmxDU1lhQVo4ZksxZHF3WGxsUy8xY05rM3g3?=
 =?utf-8?B?alVLaWhVN0VTRUE2SGJ0S0gvNkR4VnFQdG9RWXZ1dU1ZNC9veVBGVnNsMndY?=
 =?utf-8?B?cUhyMVY3blJMYXRBWHhrN2RhdVhPZVBEaVlNVUxhWjlxaTFTRG5jdHBIYlp4?=
 =?utf-8?B?U01aNmhBcVdQeVZWS3QwMWxXZHpQNjJSbnlpK3hXZ1lNSThmVnRKWXl4TThK?=
 =?utf-8?B?bWFqLzFrS3NvdVNoK2NhSFV3bHE0bG5pM1p3djJZSVY0ZURDK0FDazVLcHVS?=
 =?utf-8?B?MW5wNFhUSkdFbjV1U09Calc3YVFMNjIwb2lFb0NlZW9SQ01QL2ZqdFhxOG53?=
 =?utf-8?B?aUoxelc4V1FlN1o0VWdsRjhkdkxFMzBKRitKQnBrd2Eyc3IrUkg1R3o4bmpz?=
 =?utf-8?B?K3l3UnRMRFhqNDgvYTJ6QkhqUUhXeW9pQU1SUEtld05PaXNYMG5kVENjZ2Jv?=
 =?utf-8?B?dWRNT1RpV1MzQ2xLYjNWOG1TWWIwRmpoT1B2NW1MSlZ5RTRxbEJ2QWRGM1Nu?=
 =?utf-8?B?b3Jsb2t0WVN4dUYyd0FueEJBc29IVCtPVkVWaWVDL3Q5M3dTT2VxQzBXVHp6?=
 =?utf-8?B?TFNmU3lhSkhtaW9ZNklUbDBkUEY3WUo2WStHWmdrOWJoMllzczhLY2J1SjNV?=
 =?utf-8?B?a2l0blZXdGM0cmdTSHpvZUlJOTcvOEZQV255MWZtazdONXhYcDQwRmVDWDBG?=
 =?utf-8?B?RUgrRGdlK242VktiVmMxZTI3UDlIaVlzaldZTGdCZEcvNnloYnNiTWJYS3Uy?=
 =?utf-8?B?Q1RsT2JNcHl2RFpLK0tkZ3Vrbk9qTFloM2xLdkR0Wmgwd1lRc2s0UG1BOVRP?=
 =?utf-8?B?RkNPVHhjY1BTQUhDbjc5OHZVWG5jVUpxcXc3NFZLR1pISFBHZmJ2dnA5Qi83?=
 =?utf-8?B?dG5xczlYNWFGcWNaZHV4UzJaV3hUV2lJV1d2bkxublVWQlQrMklGL1hndmhq?=
 =?utf-8?B?OCtqRVhTZTFacmJDbjJuY1FSd2paaUh1SEVVa0xhOVVPaitHK2tRd0xuTzli?=
 =?utf-8?B?Y2pqeG93Rk1hSnpYbnVmaGphNkVSZUtiMTZKSDd6eXJnQ1lWZ3U0bG1NVm1y?=
 =?utf-8?B?ZHQrellqMWc2Y1BlOUROZ3BITzFHSnZ0VUI4dWRRTWJUd0hkZ25LeDh0RFA5?=
 =?utf-8?B?UzJDSUgrSmxZWi9LRkUyMjN2ejhFM2h4bGlPWFhqSjZySEVTQkp3UDhid0Ez?=
 =?utf-8?B?N0E5T2dCTkhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MklRR1FCZHZVU2ROb05ueWU4L3UxZXJaenlDSERXR1BtTTFRbmZETXV2L2xK?=
 =?utf-8?B?bmRXd2pyWVRPZlZwNjZaKzB4alJFOGkzaGRUN3JiMTE2V0owRUNjMmFCQWFz?=
 =?utf-8?B?T2Z6T0YyaFZlUWNRaWZmcXcreHdBQW00eEtORTN3U3VKVTdUbW5naHF6SklX?=
 =?utf-8?B?Wm0vazVyd3JpQlhEVHF4QWtvRDhvUU1wYkM3MXFFeGgzZmhNL0xibDl5NzVw?=
 =?utf-8?B?eWV4aVFTV1RzL1cra1J3dk9zMEordWZhUkpjbXRBdlJKeGZkclBjeUpWTzVX?=
 =?utf-8?B?RjFkTlRSYkpMbjRuNDZzUGF5UWptYjFyNTBCaGptSEVUamdaTVFKeTFtb0k0?=
 =?utf-8?B?QlRpQzQxWVZZclY4U1J4a21pUUVCSDhIY2ZwQTdZSTY0aHllajVHM1BZdzkx?=
 =?utf-8?B?OFRtbk8xb3FmcmxkbUt3U1o5ckI2MTU3Nk9XSlBhUmJJclV3cjEwVmt2dHBH?=
 =?utf-8?B?anlGSmxkTk9YbTZ5Uk50emZIZDhBL0RFNitjSXRadk82VWo3cUs3eXdTMHNz?=
 =?utf-8?B?NksvN3p3ZHJjd3pDR3lpWUNBNFlJZ3BHMjhyMTBySGVrVmJvZnBPUmFEUkxG?=
 =?utf-8?B?b1lwa3lqSDBuclJGU3I1L2xPUUdwajNTbkwwNXVJSnpQdEd4S01ENE5vVHRW?=
 =?utf-8?B?YldrMW9wTkZZN3ZHVW9CcGZvNkFkN0ZudVpWVmE4MWloQjBmV3FKdWpXYnll?=
 =?utf-8?B?WitxOE1EQWY4UisrbEVYclJ1K3NjaUZtNzJ4dXJHUnFLTTY0Qlc2N24vQ3NX?=
 =?utf-8?B?dUQ4SGxqQ1dtSmhWV0R5OTEyTVNYTktpUG1wZzFScm5HZzRiQXlCTTFIb3VF?=
 =?utf-8?B?Ty9xcnE3SDUvYW4rdi82c204aWVONU9VSER1QjRYK3N1SkQ4alVnYnRDaW9P?=
 =?utf-8?B?eWRYbjc3eHlIa2RuYTI1Q0tvRTVHZU0zSjVYa2xDcmhLR0ZhRUMvL20wNm9r?=
 =?utf-8?B?eDdHWFNVbmtySkY1eTRTNWJaWERIbVBBc0RGZkd3YXJFY3RPb3F4RjhmT1do?=
 =?utf-8?B?aS9ZU3BxWXZQamdUQzJRNGJ6d21oSG9pYWNrUFJ3a0NIbE1DOHV5NjdVeHVJ?=
 =?utf-8?B?U0RCN0lFeGhCaEZ1eFg3cnBCMmp0MzN5VmhBQzlyOVhZc2lmOXlFZDJyU0tp?=
 =?utf-8?B?M05hTnNyb3BHVUJKMkkwMlBxaHRHS2FUcnl6ZlVMNlhRQkVoMzBZZkhlUlNz?=
 =?utf-8?B?aDhxWE1NL05LUjc1U3gvUUpJV3crbnpCSTNmRWFMUk1uOUIrb2FDelFDVHQv?=
 =?utf-8?B?dlFxNU9rbTdSbVMxb2tOREdWdVNpUFFaeERaU3ZoVzJmSEEzYitPQW5FTDRL?=
 =?utf-8?B?MGVTczZ0TXVXNmNpOHhxLzZJZHd2WSt3b3R4UGQ1RXJMZHlLR0E5Zjlva2Zk?=
 =?utf-8?B?bXVaRDhJZ0RsVGNmUHRHT3lVZFd0NzBpUndNR25wKzZsbjI0QUdCOFRvSVZD?=
 =?utf-8?B?MHdTZkhRS0NjTll3L1NXU25LbXhCSWZEdFRoMHNrY0VOWllDK3I1WGE2NlNq?=
 =?utf-8?B?cG85anczNVJuOTZ0U0hMVmtCcGN5aWFWb1VONWlVcE5XM3pKV1pqMXBaczBl?=
 =?utf-8?B?VlUveW5INmZ5aSs2ZjNObDJhUE0rWjlCSzNvbDFHcXdyRXZkaUZJOUdvbVdH?=
 =?utf-8?B?VkdsbjU1bkxqZkJaRE1TTXZoMEZkN2VGaEt1TGJVMnNqR01Bbnh0a1dZdHJ0?=
 =?utf-8?B?TUJPL1JkWUxuZzNZYXhkS2RHQmNwR1VWeHVGemRjczM3T1VxY2Vqb0dpb3Ix?=
 =?utf-8?B?dXpudlZHQm9Ub0tzTW9NTE5CaENla2FnMTluZEVQWEhuUGpCMXdZb1Jkalc4?=
 =?utf-8?B?Tk9SWjJKbCtLUi9rYS8za3BlYXRUaUpXblpOUm9hRkVpbmZkdU1vcFZVNDlL?=
 =?utf-8?B?SHVNV2NMbWRiT0FrNDhPOWJZQWtzNEE0VW5XSnJldFZGY2k5ejdDRklvSVBK?=
 =?utf-8?B?cWtRWGUxNXFYZmFEeGYyaXVtVDlvSzBSMUgyLzI0dkZUVG9BTVVGMzNmNlF2?=
 =?utf-8?B?SFl0bGFxeCt6bnp3OGN3cW9EZFUvcSt1eU1Ob3FFclgvZGkxWXFXQXBoemJO?=
 =?utf-8?B?MFNVTEN4Zk5mTno1a2o4elg4UFM2ZHhRazZoZDNwT1RrUUo5Y3ZBS0t6SVlh?=
 =?utf-8?Q?lW4td0MlpMqSDJcq1B/HLmBCw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18540E2B6BFDBC4D800490EAE7458937@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f02cd2-a8a7-46e9-05f4-08dde4db92f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 20:03:07.0651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+amoqVBvRIWWH+w3vldEgX88B7jSdRlPvmhWQ5cbLAE/KP5+kbfVM5odHMQqT6+3s4XUpFeIAnnpqm5kzv/rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
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

T24gVHVlLCAyMDI1LTA4LTI2IGF0IDEyOjU3IC0wNzAwLCBKYW1lcyBKb25lcyB3cm90ZToNCj4g
VGhlIGdpdGxhYiByZXBvc2l0b3J5IHByZXZpb3VzbHkgYXNzb2NpYXRlZCB3aXRoDQo+IHRoZSBu
b3V2ZWF1IG1vZHVsZSBoYXMgZmFsbGVuIG91dCBvZiB1c2UuIFRoZQ0KPiBkcm0tbWlzYyB0cmVl
IGhlcmU6DQo+IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2Vy
bmVsLmdpdA0KPiANCj4gSXMgbm93IHdoZXJlIG1vc3Qgbm91dmVhdS1yZWxhdGVkIHBhdGNoZXMg
YXJlDQoNCkkgdGhpbmsgIklzIiBpcyBub3Qgc3VwcG9zZWQgdG8gYmUgY2FwaXRhbGl6ZWQgaGVy
ZS4NCg0KPiBhcHBsaWVkLiBUaGlzIGNoYW5nZSB1cGRhdGVzIHRoZSBNQUlOVEFJTkVSUyBmaWxl
DQo+IHRvIHJlZmxlY3QgdGhpcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEpvbmVzIDxq
YWpvbmVzQG52aWRpYS5jb20+DQoNClRoYW5rIHlvdS4gIEkgdGhvdWdodCBJIHdhcyBnb2luZyBj
cmF6eSwgZ2V0dGluZyB0aGVzZSB0d28gdHJlZXMgY29uZnVzZWQuDQo=
