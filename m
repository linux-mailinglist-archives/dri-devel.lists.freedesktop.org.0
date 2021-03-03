Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51932B84F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB486E98E;
	Wed,  3 Mar 2021 13:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A316E98F;
 Wed,  3 Mar 2021 13:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5SIu8iylbzKIKFAtjPeKmg4NAxarUjVm4zfRFRSO1sYGfZaWon5HYd1vsyHKucFu5Wx496HZfCbGmN0Rh++9zsKG048tfnL0R7lclgqXlW6NTEDeKP1XAXNplHBH9/nhwATgm6/Z9sLIfaZ4oBOz+jjSN15rQHVBuojNGFTWm10lmz1Nktgp1e1ITxg6RvD2IuWVH9pjX4g9wwFVeLuyIBHTadUCwBzHmvfkhlEARCOgLqYThtYoWrogh1lWbm1SAjQ7AArnw5kXhlr0Cwg1eFoj4GMOw7Mzv5XpngVJyGgAxjicToyYi6GDfxvmB6Ley0hH2KEld9N4pqJb6vvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppPJpBkaUqMzkywLpy5T7pZTZrGlwQEtSpUVZ7PiBKU=;
 b=T6Dnh4wC9FCTUBgbO7lYJhk07JoaywdaNecTD1Uv1GJH7XBjEFsZppVJGO9A9lwmzAoEdth77TPphiWOBEBo3QVTF+no9X4ShH+zTG6MENFHZaWA7lTdmO6wX4BtWwjEiMqUJpiM84soHYxDDTQ+Q0k5Tz9PwCRPb9UQ63UULHgg0flEhTtaVEsu8P8SU0MB2mfWAZCBiuA1TV1Ztjr0YLzwmMdwZBmdGC8vh64mo/8P5q7o6TNG0oj4STEH8YA5P3ipE2Ap+tjetmGITCnWTmn7HO9l7396GfEwjLel+3TMwbUh48LGfMzAw3K8rI2Z86MY0DwudZ7iLxneW/rmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppPJpBkaUqMzkywLpy5T7pZTZrGlwQEtSpUVZ7PiBKU=;
 b=Uci23cHpRjK0/XRPQRa+0cdfHMO1VC1drbIo6EnFead9e48TCGAKftHQ91LdHj/EEzz+pc60BJGxbr4LXllF5k3d53RvfzUsqDg4HzqYBZyPSc5Gg6IyxuZRMIbfzx2UlOie4euKQwR1UbftRls4g1tGoSCdxnCgXCh0MbtBCNk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 13:46:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 13:46:16 +0000
Subject: Re: [PATCH 08/53] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
To: Lee Jones <lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <20210303134319.3160762-9-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <09d1c92a-559f-a071-123d-bb9aa25240c0@amd.com>
Date: Wed, 3 Mar 2021 14:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210303134319.3160762-9-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fea4:8409:66bb:aad2]
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fea4:8409:66bb:aad2]
 (2a02:908:1252:fb60:fea4:8409:66bb:aad2) by
 AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 3 Mar 2021 13:46:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f56512eb-f23e-430c-bcde-08d8de4ab797
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23561627C7A51D899048D4C683989@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLmFpjXSLknfTXEkw+pKzTr5yeQm+H0jRUMwodw2Na8x97YU8ItOhSEoBZdPOelRaZcAqGM4veSU21yoFtY2WQVuFw0KAeDzAEHsw+1aNSQYp0pDQ3zaxpVgtLtV8zYkqRGM+lQqpXe4HL6V/TBjpP+pfd+VOWNAfg6WlC8NpktLCrnwEkMFnjdrMt8Z3vHQkOYqKBPFHtXLqZp68vpBO9BXPhfB6GyUCPVqMARtfL4ISdb9BUTEkk2KngNwAe6JETU84BM+f2hVRvuQMGBvhbtmt4u+5efre+tyTX0SoOdQzmvqGDke2jw4cxW4ij8TTuO//+KDqH/YTjrC8L0cTP83+la5Raha1r+2XsFTiU2dRxguTN62vuJcnzdx+XRKd/SLIP4mJkmsD8224u8m8iFqYwQ+A0Pbg4+ve+q2G58sgWh/qOqP55qQeQzwfJLpat8iaYV7s4/IhqAzemhj545YlwBcZGXDDTKKbBgTMg++Q+0L2ewwsznFYHTpA96VCDOLYqblf5MlJgXqbmxIWIVKkTkXV3ZEFRA6kPhXTTRueyXhIsVoDDLaNgNKPjIzwDs2Yv2P7Y1BdmJnbGAqtjZquvFDhY+a/4zS0ZRIveY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(66946007)(36756003)(31696002)(5660300002)(478600001)(66556008)(66476007)(54906003)(2906002)(31686004)(6916009)(16526019)(8676002)(52116002)(8936002)(4326008)(86362001)(83380400001)(6486002)(66574015)(6666004)(2616005)(316002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmVQclNXZXdjS2RGYWhCOVJhMG5kdU9oYTkrMTJ3cVpKZU9vSVRXMmt4Um1E?=
 =?utf-8?B?NkRtYTNic1VWT0Q0SXF1YkhxSzE4SndaNnZYVEtYU21WQTc5QzM3Vi93NzhR?=
 =?utf-8?B?Qy94Njl2L1FySmo5SjUwOE5weWpUektNKy9ER2lQcEN1KzVYRUNXTzhDb3Jr?=
 =?utf-8?B?N2dmaDRyM0J6dW9Sd0ZSRnV0UmRJUnRyRllpRTM5K01WTXVjZEJNazN5V2ZR?=
 =?utf-8?B?SDZ4eGFydmVad2x6U3g2Rm5mU3RJQ0pyQkRoVzltWWkrYk8vQjZrVHRzT1lM?=
 =?utf-8?B?WW5sZ1ptanp2OHcraW5FcHpRcDRsazYwdjhqczNYUnpnUENTRWVBczVpTEF1?=
 =?utf-8?B?cWdVVTM1YWlOSU5sV1B0aUN0YjJ4NU1ZWXRzb1FoeHBKZ3hxNkMzbDlJLzBu?=
 =?utf-8?B?bGZFM04wNUh6K1BrWVlDa2dRTXk3QjFHdHVTdXIwdHg3T0NBRzBkTURGM1RP?=
 =?utf-8?B?eS9hRmlId3htbUdtWCt2SkFScUtTZEo2ZnZmTWt0bXMvczVXNWYra2hTOSs1?=
 =?utf-8?B?ajhzL2dNSmRGS3ZnYit2UlZSNW5LRWxXZDhTV0JrS0toYnhQSW1Oem9PY09T?=
 =?utf-8?B?Skl5UjlWUzVPOU9OVHlhOUpvWjN2b1JDeEkwWmFKMVpwbmlFSldqMUJqbkZh?=
 =?utf-8?B?TWNMMk1heXFTNFBaZ3VRM1YrYjRvVUh3WUZXN200V2dYMUlZVFlFV2Fqby9q?=
 =?utf-8?B?M1F0aDRCOGNJdWtvWmZ1ZjNoUkJ4WlluOERxeXh3SjY0ZGJEUHl5SEVzMmJl?=
 =?utf-8?B?MSt0eDRJSXpsYXZBM1pnMWlNY0JRVVROdDF0ejhzeGgzVzRKTUxzdFZVVjlU?=
 =?utf-8?B?a1dnd2R3akdxcEp6ZlZ5dXU2WU5mYVBZcks5YVJwcXlDT3pMSnlNK1RmaXlh?=
 =?utf-8?B?UEQrVUZJMkhLYlhFdnVKMEwvVVd2VExYUG1qeGJ6MHZtcldHK2ZIZFFxaEk1?=
 =?utf-8?B?b0sxSFBteVRvbHRzU3JGcTkyVjhCRFVmZnAxUG1Sei9OTGhnV1ZTMDZseDBR?=
 =?utf-8?B?aHBkcTgwaTFJNzdVWFpZMWU0RlhRWG02ekFBdnM2VWtxeUpza1pzQjNkYVU2?=
 =?utf-8?B?ZktVNVMwSDFIVFh0YjgxeVZwMmlXY25YcmFPMDR0ZFJNUU9SUG1VL3ZOR29P?=
 =?utf-8?B?TWFteC94QmhFQWFCUTB5S2hEeUc5K1lmcm5KdThMNm1WNjNRTWlZbHZGK0pk?=
 =?utf-8?B?VDBZazVCQzlUblpwU05Na0NvMGdBci95SEhTVDVpSjBBV2ZjQTF6Sy8xMFhj?=
 =?utf-8?B?UWpkM2JQbndBMTVwL2FKQ1JvOTcyRGRHZmlpeTdHWmNNdU54N0JDVnRtSU50?=
 =?utf-8?B?aVU5UjdGbXNsWmQ0MzErd2dWU3hmWUhXdEZOajFLL3NTSGdXZkdkZkNHVjc5?=
 =?utf-8?B?Z1JZZVVmanRjeUZMZFBoSVpZbUtHSzgrNWdjeDc4MTZ4NTF0RlFuN0RtaWxU?=
 =?utf-8?B?L1BWZ1NLcE9XbEttbExMQXBvWmM1SnRDakVKWFZNbGNWQXBKc3BpdG5NdkNF?=
 =?utf-8?B?TytZdFh2ejRVU1UvdFVpZDFyZmJqanprYmFITENnSkw1cGk3OHZFdW9ud2pE?=
 =?utf-8?B?THM3V05PdWhsSG1IR2JKcFNyRjdyL214UkFoTDlYT2tIcWE0aFVKY3oxdTZ2?=
 =?utf-8?B?ZXhSRnRYek9oWDgvT29WamUzRlJKUE9ucTA0SnBnVWxtazQ5SUNMQVBSZFZQ?=
 =?utf-8?B?SjM2d1BmdU5MRk1vM2lUM2w3Vm5PVTRxaGltWGRMRmllTnF6SnpXN0prYTlE?=
 =?utf-8?B?MEVkN2gwUXhCQjdQaTZJQ3A4N25nWTNqMGpFTE1YMVowS1E5M3UyRFl1Vnhp?=
 =?utf-8?B?OXdaTk5hRDdZRnJvYUZmR1ZBYnA0SGlUOVp1Wk9QUldBQXM1dTA3czMySUx6?=
 =?utf-8?Q?emz3Mc4/qrPUR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56512eb-f23e-430c-bcde-08d8de4ab797
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 13:46:16.3975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtoLHauCksCiS5xzKZdtEsJZnvddfF93wbtdohLEcbQCVHBtFJWc6pBj05SNQE1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAoKSSdtIG5vdCBhbiBleHBlcnQgZm9yIHRoZSBEQyBjb2RlIGJhc2UsIGJ1dCBJIHRo
aW5rIHRoYXQgdGhpcyB3b24ndCB3b3JrLgoKVGhpcyBmdW5jdGlvbiBpcyBub3QgYWxsb3dlZCB0
byBzbGVlcCBhbmQgdGhlIHN0cnVjdHVyZXMgYXJlIGEgYml0IGxhcmdlIAp0byBiZSBhbGxvY2F0
ZWQgb24gdGhlIGhlYXAgaW4gYW4gYXRvbWljIGNvbnRleHQuCgpSZWdhcmRzLApDaHJpc3RpYW4u
CgpBbSAwMy4wMy4yMSB1bSAxNDo0MiBzY2hyaWViIExlZSBKb25lczoKPiBGaXhlcyB0aGUgZm9s
bG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPgo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzogSW4gZnVuY3Rpb24g
4oCYY2FsY3VsYXRlX2JhbmR3aWR0aOKAmToKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmM6MjAxNjoxOiB3YXJuaW5nOiB0aGUgZnJh
bWUgc2l6ZSBvZiAxMjE2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZnJhbWUt
bGFyZ2VyLXRoYW49XQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAgLi4u
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgIHwgMjkgKysrKysrKysr
KysrKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nh
bGNzL2RjZV9jYWxjcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rj
ZV9jYWxjcy5jCj4gaW5kZXggZTYzM2Y4YTUxZWRiNi4uNGYwNDc0YTNiYmNhZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMKPiBA
QCAtOTgsMTYgKzk4LDE2IEBAIHN0YXRpYyB2b2lkIGNhbGN1bGF0ZV9iYW5kd2lkdGgoCj4gICAJ
aW50MzJfdCBudW1fY3Vyc29yX2xpbmVzOwo+ICAgCj4gICAJaW50MzJfdCBpLCBqLCBrOwo+IC0J
c3RydWN0IGJ3X2ZpeGVkIHljbGtbM107Cj4gLQlzdHJ1Y3QgYndfZml4ZWQgc2Nsa1s4XTsKPiAr
CXN0cnVjdCBid19maXhlZCAqeWNsazsKPiArCXN0cnVjdCBid19maXhlZCAqc2NsazsKPiAgIAli
b29sIGQwX3VuZGVybGF5X2VuYWJsZTsKPiAgIAlib29sIGQxX3VuZGVybGF5X2VuYWJsZTsKPiAg
IAlib29sIGZiY19lbmFibGVkOwo+ICAgCWJvb2wgbHB0X2VuYWJsZWQ7Cj4gICAJZW51bSBid19k
ZWZpbmVzIHNjbGtfbWVzc2FnZTsKPiAgIAllbnVtIGJ3X2RlZmluZXMgeWNsa19tZXNzYWdlOwo+
IC0JZW51bSBid19kZWZpbmVzIHRpbGluZ19tb2RlW21heGltdW1fbnVtYmVyX29mX3N1cmZhY2Vz
XTsKPiAtCWVudW0gYndfZGVmaW5lcyBzdXJmYWNlX3R5cGVbbWF4aW11bV9udW1iZXJfb2Zfc3Vy
ZmFjZXNdOwo+ICsJZW51bSBid19kZWZpbmVzICp0aWxpbmdfbW9kZTsKPiArCWVudW0gYndfZGVm
aW5lcyAqc3VyZmFjZV90eXBlOwo+ICAgCWVudW0gYndfZGVmaW5lcyB2b2x0YWdlOwo+ICAgCWVu
dW0gYndfZGVmaW5lcyBwaXBlX2NoZWNrOwo+ICAgCWVudW0gYndfZGVmaW5lcyBoc3JfY2hlY2s7
Cj4gQEAgLTEyMiw2ICsxMjIsMjIgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX2JhbmR3aWR0aCgK
PiAgIAlpbnQzMl90IG51bWJlcl9vZl9kaXNwbGF5c19lbmFibGVkX3dpdGhfbWFyZ2luID0gMDsK
PiAgIAlpbnQzMl90IG51bWJlcl9vZl9hbGlnbmVkX2Rpc3BsYXlzX3dpdGhfbm9fbWFyZ2luID0g
MDsKPiAgIAo+ICsJeWNsayA9IGtjYWxsb2MoMywgc2l6ZW9mKCp5Y2xrKSwgR0ZQX0tFUk5FTCk7
Cj4gKwlpZiAoIXljbGspCj4gKwkJcmV0dXJuOwo+ICsKPiArCXNjbGsgPSBrY2FsbG9jKDgsIHNp
emVvZigqc2NsayksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFzY2xrKQo+ICsJCXJldHVybjsKPiAr
Cj4gKwl0aWxpbmdfbW9kZSA9IGtjYWxsb2MobWF4aW11bV9udW1iZXJfb2Zfc3VyZmFjZXMsIHNp
emVvZigqdGlsaW5nX21vZGUpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghdGlsaW5nX21vZGUpCj4g
KwkJcmV0dXJuOwo+ICsKPiArCXN1cmZhY2VfdHlwZSA9IGtjYWxsb2MobWF4aW11bV9udW1iZXJf
b2Zfc3VyZmFjZXMsIHNpemVvZigqc3VyZmFjZV90eXBlKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAo
IXN1cmZhY2VfdHlwZSkKPiArCQlyZXR1cm47Cj4gKwo+ICAgCXljbGtbbG93XSA9IHZiaW9zLT5s
b3dfeWNsazsKPiAgIAl5Y2xrW21pZF0gPSB2Ymlvcy0+bWlkX3ljbGs7Cj4gICAJeWNsa1toaWdo
XSA9IHZiaW9zLT5oaWdoX3ljbGs7Cj4gQEAgLTIwMTMsNiArMjAyOSwxMSBAQCBzdGF0aWMgdm9p
ZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAo+ICAgCQkJfQo+ICAgCQl9Cj4gICAJfQo+ICsKPiArCWtm
cmVlKHRpbGluZ19tb2RlKTsKPiArCWtmcmVlKHN1cmZhY2VfdHlwZSk7Cj4gKwlrZnJlZSh5Y2xr
KTsKPiArCWtmcmVlKHNjbGspOwo+ICAgfQo+ICAgCj4gICAvKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
