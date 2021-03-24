Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0396348519
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 00:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FDE6EABC;
	Wed, 24 Mar 2021 23:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505EE6EABC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 23:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGFpsPORLOzKkmj6tzAmWict9UWBO9KN3f54qc60y4CONCf8czCogo7yp/VIZYY2+YW3XwI0knM6S9u+gZM5O3b9UZoQBwDiUssZvw7ftztr/PX3N2Lsyi3KojZCe/u62ahDvPBPG1kLQeKllx7oGKWOAovg44e0WYnuE9hI2VDV/JARFz4vMvxsO7/chJPywlFPw0k1WcR37VP5BYlpaQ6i5JtqR2dCY1J2dIlUsXs9qBlc6aWRVnO4Tr420oCgfl/GDCN5jfa3JVQVrTGExHJsNcZOcjwnP3FTo2U9WrKPFvGfl18JfWycUe/ZTExDODBEoLYp/Y5Woo2AHRTw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuUZxKmUjkg5oZIacpV6ViNaH7jmvSqlHYmtO41si+Q=;
 b=nOXXEHihf37MvQ8qA1+B/19D+tbsHLr4X9w46/sWTZRtPrtEIXHTOdzLMp9YhaQVHoeZcFckjmO7CtG69t7wlyyvqOawiwHBtAr4w2c/RlwONWZv8kiOeJDWjj4broVuVdhpGtK3mVBsoHRq9FAzvbT2W3jg8+un5EMnEZNRGuD9fL42NxHjopgFlM8BO2L5w4DLY5d5W1c6AB6XFCWRJ9UY6o6TZF7TNlkXjGAH0xo8ZCR1dpSt+UGgASZaYIz8KoavozMEMNjbFFWzRf3ZotNnHpGQ5ce9k8p5m3VhActGwXGoLNKMdM9l+ZeYwOecp3wjfLCgKemaaa1A946nBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuUZxKmUjkg5oZIacpV6ViNaH7jmvSqlHYmtO41si+Q=;
 b=V6nFI3OYWFWGZZ20YjA55lYI2mP4C+car1CzfpAq03c6+mNmN0Aee1VMBf2kBRqsHc7s1X7HhfJc39AJ7wwruVPSztJAK2BFbKRzgXaNB5uI6xMmDJkbRtBeR/0Ojy9gNYOcCJCcp3vwe/V6GIAvbqLBiOfu0agnRt6pVyCCl87pwkiKYXuFGzDi9ss2EYD9h7aFpg1tneuGP+1TMnwewjTgOAPrEMo5VjHg1l7QxzVOBiNKhhfTl1dHjz4iWtLR3EdoGejn3oCP2ggNGEWSm8tVSUbb2ugWSFDur56ANOjC8Mw1ZnQr2HntzoFWgZxKPITrU7EYtIdmiiFFd8bExQ==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2809.namprd12.prod.outlook.com (2603:10b6:5:4a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Wed, 24 Mar
 2021 23:14:21 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 23:14:20 +0000
Date: Wed, 24 Mar 2021 20:14:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210324231419.GR2356281@nvidia.com>
References: <YFsM23t2niJwhpM/@phenom.ffwll.local>
 <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
 <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
 <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
Content-Disposition: inline
In-Reply-To: <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Wed, 24 Mar 2021 23:14:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPChf-002DMW-7Y; Wed, 24 Mar 2021 20:14:19 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ae8e3d-19b7-42c3-debe-08d8ef1a8e1c
X-MS-TrafficTypeDiagnostic: DM6PR12MB2809:
X-Microsoft-Antispam-PRVS: <DM6PR12MB28092491BCC180A65CB180ADC2639@DM6PR12MB2809.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8T+V+cxAslVfNzr7B1vhYqCczW9W6F3nizWp97BWlwtLV0RJxq6fuUtWkkFD3KaJSdkeX8EaVkCxZH1mqeEwaidLmZRAeodDEi2ctTGALxLk0AEoPKXHBhW0biQQfFyiC9ZnIadq4WLwmZ2KgSgIRldYHFUNni/4YuOJX4XmJaWVb6p9TH2adSdZj7OkUoU76jK3y/3NOM3wpgelqqGfIieT76+nd86JfoqQYly5h0cUv9bjLf0gs4mxIY/h1oa+1rHTl5O9oKDRoCA3oBwG40RzTFEr3m4MaF94Jg19t+AeiuFgot/lmg2RH+GsfbBcerOxBzdAQwDGQ1AFP/GEd9sxbRdbGLgUEFKxROEqRCjS8dT6t9Kfpgpt4CCzwfKg7EBmuHES7cAr7k6h0zTEm8k4VK5VuyA6IGGFZWQDGEDTMJ0qZ6PDb3Spx8ta/+Tw6GE6OLQcv1xuvFx9ffFjvrCjM16vDymFS6AHHYNq4njelPrBUYHucj2jlhJBS8GRlroqdhXvG54gkdWfITNV+D2rnyGzWdkDC8CY0/dIpQKNwm4axFIf5POibVRVhdjcD87/RxoZB1z1bROLvhrUje9/XHnkrL165S+DtfL4jSM74Yu/1njOsEkuq7dqFSvZS7SsfDUs4Dnzr+NfIdFEowmkABlOWCTJoj/VK9eRpm1ND4DcKVonpTeznDpjvRE1s5GemrQ6BbrcDyW6hsX0zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(2906002)(2616005)(426003)(6916009)(1076003)(26005)(36756003)(8676002)(186003)(4326008)(86362001)(8936002)(9786002)(66476007)(478600001)(54906003)(66556008)(66946007)(9746002)(316002)(5660300002)(53546011)(66574015)(38100700001)(33656002)(83380400001)(21314003)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aU83cjFZVDdtWHVaVlZSSTFOcW5pWDNFQWdOYmNudFA0SnIzVGRJUWx3T2FF?=
 =?utf-8?B?aGF2dzZON1kwUjN2VmpOd1V5bFJkUERrQzZnZS9TOXJKS3ZRYzlRdk94UU14?=
 =?utf-8?B?NU9jbUovb2NLU2o1LzgxU0U0UGxBZjdzamlYajFzZ2dHa2JEUEcyT3M2d1Ar?=
 =?utf-8?B?THRoQ2krU0dQT2hHMWZFRU1YVk56dHJPUlBTUm93V1ZtalA0NzJLamVlK1FP?=
 =?utf-8?B?L0UrUGo1U0RFcE5Lamgva0lzZVJPYnhuQU52NGV2ZnVHUWJKVWJTUDN6b3Z5?=
 =?utf-8?B?VjZXeldBajdpMFhxNzNuSGxhV3JvbVQ3d2dWR012SktTQnUrSTRrU0JZVlFI?=
 =?utf-8?B?OTdmQUIwSEh0WDJCK1BzYW9rakhxTllQUjVxWWlDYS9Xb3lNYytVSlMxam8w?=
 =?utf-8?B?bko3SUVJN0UxVjBTdXdWWmY4dTArb0RrYm11VkhBRlNzbXk4bFJJcGxpU1k5?=
 =?utf-8?B?U1JpeCtOTWdmeDNyM2NwampVSmsveURwckhwdlNPbkR0bnNxSXp2cEU5Vlp3?=
 =?utf-8?B?ZVptNjdqQk9xaWU4Sjd4eTlQUnRJYVJUNVRyUHNlcjQyNVB6NGxUQUpBNFJp?=
 =?utf-8?B?Rm5XbDlQU213RDcwNVdTZm9uN2diTUFvSTNjd3dnL3lRZ1VoWDluc0RzTU1h?=
 =?utf-8?B?WTlVWU9QWTU3TmE3UUFxUkQ2WWZXUm1UT2JKRlhKRExIUStkU0Nwa21mMW55?=
 =?utf-8?B?bnhBZDZ5dmJWUW12ZzVJdkZOcUc5SjEyZmxLdG9UZ2RSNHYrWGxsOW1CMTA2?=
 =?utf-8?B?YUdCS3VhVS9jNDVUYkdlbEp2VldHQ2djdVArbE41UVpVWWI2RHZVMWNaNU9B?=
 =?utf-8?B?SUxOVVhtUklQVzhvYW9pVW16U2hvZFRERkF1UVk3Qjh4SkFrcFpJNWJvVTVk?=
 =?utf-8?B?bWJEa3Jaam1zQ0VwUWF1VTdBWm1nY25mbTRoWGJpZHViSjExWmZXREV1R2xE?=
 =?utf-8?B?eGVWelFJbmFFUk5BUU9BTEM5S2ZLbXdRY0lncEN1WE90U0cxMHQ0bTlDOUo4?=
 =?utf-8?B?dTRKaWRiSkt4QlUzZk1xcnQyOG9KYzU5d1V0YlFUbE9OcUVlcDdHVklod1R5?=
 =?utf-8?B?Y3ltakMzTDlWaVdNOENIZFIrT2JzM3FpTlBWSGpvSXVaYVloaW9ObHQyRjFL?=
 =?utf-8?B?allMT3djM0d3QTY1QkhnWUpiUDU0OHZ5UkQ3cUlZaFdKNm4yVjJwTlJxMmo2?=
 =?utf-8?B?SzFHckpVZEZUMjZnNkNlcG5XM09rUHZMM2pvRzQzb292ck1wY1JXS3JlNmlJ?=
 =?utf-8?B?U3ZxOXNPNUwyZGxlVXJuNk1IZUNjSjdJd0F2NEU5K1Rqc2ZRY2sxSG4xTXJt?=
 =?utf-8?B?MzFkUVBhZ2lZdUZkMzl1ekVTaGovN05ENTZxdkxmeHVRWjdkcWt0YmhoMDB4?=
 =?utf-8?B?L0ZrWStqd1F4UU9RZjVYQm9nWTRUWmExREFaOVZ1cXdQWmlFa3NQMkpvR09v?=
 =?utf-8?B?RGF3VnVVa01Gb1l0S2t6QldEUlFZN3BjN3BoN3FHMnFoQjdtNjZEbVRhQlZX?=
 =?utf-8?B?ZEQzKzZhQXZESWNFYkZVNEx5S3ZkMTQwL0FQWHNpSXhuSE9RYm9YdWtlRmtD?=
 =?utf-8?B?Tm5vREplTFdZT1dkMUFZUTU1d3B6NTJ3M0FiMTFIazNQa09kSHBNVmV0anVV?=
 =?utf-8?B?eGNUNEFpZlBVbiszbGdYemNkWkVPOWtvMmhxN3J2Sm0vQjgzK0F5cGFCMkpI?=
 =?utf-8?B?Y0diM1A1bXBUYytZaFZra0YxY2dkQzhSTktWa0xsWWFsTTZBWERrNDNDMGwy?=
 =?utf-8?Q?lPa3FsJxqc/NLGvZxntNbaa0Gtg/byaNAeYCHa7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ae8e3d-19b7-42c3-debe-08d8ef1a8e1c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 23:14:20.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nP8laqMWfMr5ONTR0ULxDBvK7tEd+ErlHcqheHqhsGY0WaYgZrThrW28RN0+LRr6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDk6MDc6NTNQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiAKPiBPbiAzLzI0LzIxIDc6MzEgUE0sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gQW0gMjQuMDMuMjEgdW0gMTc6Mzggc2NocmllYiBKYXNv
biBHdW50aG9ycGU6Cj4gPiA+IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDA0OjUwOjE0UE0gKzAx
MDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA+ID4gd3JvdGU6Cj4gPiA+ID4gT24gMy8y
NC8yMSAyOjQ4IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+ID4gPiBPbiBXZWQsIE1h
ciAyNCwgMjAyMSBhdCAwMjozNTozOFBNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bQo+ID4gPiA+
ID4gKEludGVsKSB3cm90ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEluIGFuIGlkZWFsIHdv
cmxkIHRoZSBjcmVhdGlvbi9kZXN0cnVjdGlvbiBvZiBwYWdlCj4gPiA+ID4gPiA+ID4gdGFibGUg
bGV2ZWxzIHdvdWxkCj4gPiA+ID4gPiA+ID4gYnkgZHluYW1pYyBhdCB0aGlzIHBvaW50LCBsaWtl
IFRIUC4KPiA+ID4gPiA+ID4gSG1tLCBidXQgSSdtIG5vdCBzdXJlIHdoYXQgcHJvYmxlbSB3ZSdy
ZSB0cnlpbmcgdG8gc29sdmUKPiA+ID4gPiA+ID4gYnkgY2hhbmdpbmcgdGhlCj4gPiA+ID4gPiA+
IGludGVyZmFjZSBpbiB0aGlzIHdheT8KPiA+ID4gPiA+IFdlIGFyZSB0cnlpbmcgdG8gbWFrZSBh
IHNlbnNpYmxlIGRyaXZlciBBUEkgdG8gZGVhbCB3aXRoIGh1Z2UgcGFnZXMuCj4gPiA+ID4gPiA+
IEN1cnJlbnRseSBpZiB0aGUgY29yZSB2bSByZXF1ZXN0cyBhIGh1Z2UgcHVkLCB3ZSBnaXZlIGl0
Cj4gPiA+ID4gPiA+IG9uZSwgYW5kIGlmIHdlCj4gPiA+ID4gPiA+IGNhbid0IG9yIGRvbid0IHdh
bnQgdG8gKGJlY2F1c2Ugb2YgZGlydHktdHJhY2tpbmcsIGZvcgo+ID4gPiA+ID4gPiBleGFtcGxl
LCB3aGljaCBpcwo+ID4gPiA+ID4gPiBhbHdheXMgZG9uZSBvbiA0SyBwYWdlLWxldmVsKSB3ZSBq
dXN0IHJldHVybgo+ID4gPiA+ID4gPiBWTV9GQVVMVF9GQUxMQkFDSywgYW5kIHRoZQo+ID4gPiA+
ID4gPiBmYXVsdCBpcyByZXRyaWVkIGF0IGEgbG93ZXIgbGV2ZWwuCj4gPiA+ID4gPiBXZWxsLCBt
eSB0aG91Z2h0IHdvdWxkIGJlIHRvIG1vdmUgdGhlIHB0ZSByZWxhdGVkIHN0dWZmIGludG8KPiA+
ID4gPiA+IHZtZl9pbnNlcnRfcmFuZ2UgaW5zdGVhZCBvZiByZWN1cnNpbmcgYmFjayB2aWEgVk1f
RkFVTFRfRkFMTEJBQ0suCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgZG9uJ3Qga25vdyBpZiB0aGUg
bG9ja2luZyB3b3JrcyBvdXQsIGJ1dCBpdCBmZWVscyBjbGVhbmVyIHRoYXQgdGhlCj4gPiA+ID4g
PiBkcml2ZXIgdGVsbHMgdGhlIHZtZiBob3cgYmlnIGEgcGFnZSBpdCBjYW4gc3R1ZmYgaW4sIG5v
dCB0aGUgdm0KPiA+ID4gPiA+IHRlbGxpbmcgdGhlIGRyaXZlciB0byBzdHVmZiBpbiBhIGNlcnRh
aW4gc2l6ZSBwYWdlIHdoaWNoIGl0IG1pZ2h0IG5vdAo+ID4gPiA+ID4gd2FudCB0byBkby4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gU29tZSBkZXZpY2VzIHdhbnQgdG8gd29yayBvbiBhIGluLWJldHdl
ZW4gcGFnZSBzaXplIGxpa2UgNjRrIHNvIHRoZXkKPiA+ID4gPiA+IGNhbid0IGZvcm0gMk0gcGFn
ZXMgYnV0IHRoZXkgY2FuIHN0dWZmIDY0ayBvZiA0SyBwYWdlcyBpbiBhIGJhdGNoIG9uCj4gPiA+
ID4gPiBldmVyeSBmYXVsdC4KPiA+ID4gPiBIbW0sIHllcywgYnV0IHdlIHdvdWxkIGluIHRoYXQg
Y2FzZSBiZSBsaW1pdGVkIGFueXdheSB0byBpbnNlcnQgcmFuZ2VzCj4gPiA+ID4gc21hbGxlciB0
aGFuIGFuZCBlcXVhbCB0byB0aGUgZmF1bHQgc2l6ZSB0byBhdm9pZCBleHRlbnNpdmUgYW5kCj4g
PiA+ID4gcG9zc2libHkKPiA+ID4gPiB1bm5lY2Vzc2FyeSBjaGVja3MgZm9yIGNvbnRpZ291cyBt
ZW1vcnkuCj4gPiA+IFdoeT8gVGhlIGluc2VydCBmdW5jdGlvbiBpcyB3YWxraW5nIHRoZSBwYWdl
IHRhYmxlcywgaXQganVzdCB1cGRhdGVzCj4gPiA+IHRoaW5ncyBhcyB0aGV5IGFyZS4gSXQgbGVh
cm5zIHRoZSBhcnJhZ2VtZW50IGZvciBmcmVlIHdoaWxlIGRvaW5nIHRoZQo+ID4gPiB3YWxrLgo+
ID4gPiAKPiA+ID4gVGhlIGRldmljZSBoYXMgdG8gYWx3YXlzIHByb3ZpZGUgY29uc2lzdGVudCBk
YXRhLCBpZiBpdCBvdmVybGFwcyBpbnRvCj4gPiA+IHBhZ2VzIHRoYXQgYXJlIGFscmVhZHkgcG9w
dWxhdGVkIHRoYXQgaXMgZmluZSBzbyBsb25nIGFzIGl0IGlzbid0Cj4gPiA+IGNoYW5naW5nIHRo
ZWlyIGFkZHJlc3Nlcy4KPiA+ID4gCj4gPiA+ID4gQW5kIHRoZW4gaWYgd2UgY2FuJ3Qgc3VwcG9y
dCB0aGUgZnVsbCBmYXVsdCBzaXplLCB3ZSdkIG5lZWQgdG8KPiA+ID4gPiBlaXRoZXIgcHJlc3Vt
ZSBhIHNpemUgYW5kIGFsaWdubWVudCBvZiB0aGUgbmV4dCBsZXZlbCBvciBzZWFyY2ggZm9yCj4g
PiA+ID4gY29udGlnb3VzIG1lbW9yeSBpbiBib3RoIGRpcmVjdGlvbnMgYXJvdW5kIHRoZSBmYXVs
dCBhZGRyZXNzLAo+ID4gPiA+IHBlcmhhcHMgdW5uZWNlc3NhcmlseSBhcyB3ZWxsLgo+ID4gPiBZ
b3UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8gY2FyZSBhYm91dCBsZXZlbHMsIHRoZSBkZXZpY2Ugc2hv
dWxkIGJlCj4gPiA+IGZhdWx0aW5nIGluIHRoZSBsYXJnZXN0IG1lbW9yeSByZWdpb25zIGl0IGNh
biB3aXRoaW4gaXRzIGVmZmljaWVuY3kuCj4gPiA+IAo+ID4gPiBJZiBpdCB3b3JrcyBvbiA0TSBw
YWdlcyB0aGVuIGl0IHNob3VsZCBiZSBmYXVsdGluZyA0TSBwYWdlcy4gVGhlIHBhZ2UKPiA+ID4g
c2l6ZSBvZiB0aGUgdW5kZXJseWluZyBDUFUgZG9lc24ndCByZWFsbHkgbWF0dGVyIG11Y2ggb3Ro
ZXIgdGhhbiBzb21lCj4gPiA+IHR1bmluZyB0byBpbXBhY3QgaG93IHRoZSBkZXZpY2UncyBhbGxv
Y2F0b3Igd29ya3MuCj4gCj4gWWVzLCBidXQgdGhlbiB3ZSdkIGJlIGFkZGluZyBhIGxvdCBvZiBj
b21wbGV4aXR5IGludG8gdGhpcyBmdW5jdGlvbiB0aGF0IGlzCj4gYWxyZWFkeSBwcm92aWRlZCBi
eSB0aGUgY3VycmVudCBpbnRlcmZhY2UgZm9yIERBWCwgZm9yIGxpdHRsZSBvciBubyBnYWluLCBh
dAo+IGxlYXN0IGluIHRoZSBkcm0vdHRtIHNldHRpbmcuIFBsZWFzZSB0aGluayBvZiB0aGUgZm9s
bG93aW5nIHNpdHVhdGlvbjogWW91Cj4gZ2V0IGEgZmF1bHQsIHlvdSBkbyBhbiBleHRlbnNpdmUg
dGltZS1jb25zdW1pbmcgc2NhbiBvZiB5b3VyIFZSQU0gYnVmZmVyCj4gb2JqZWN0IGludG8gd2hp
Y2ggdGhlIGZhdWx0IGdvZXMgYW5kIGRldGVybWluZSB5b3UgY2FuIGZhdWx0IDFHQi4gTm93IHlv
dQo+IGhhbmQgaXQgdG8gdm1mX2luc2VydF9yYW5nZSgpIGFuZCBiZWNhdXNlIHRoZSB1c2VyLXNw
YWNlIGFkZHJlc3MgaXMKPiBtaXNhbGlnbmVkLCBvciBhbHJlYWR5IHBhcnRseSBwb3B1bGF0ZWQg
YmVjYXVzZSBvZiBhIHByZXZpb3VzIGV2aWN0aW9uLCB5b3UKPiBjYW4gb25seSBmYXVsdCBzaW5n
bGUgcGFnZXMsIGFuZCB5b3UgZW5kIHVwIGZhdWx0aW5nIGEgZnVsbCBHQiBvZiBzaW5nbGUKPiBw
YWdlcyBwZXJoYXBzIGZvciBhIG9uZS10aW1lIHNtYWxsIHVwZGF0ZS4KCldoeSB3b3VsZCAieW91
IGNhbiBvbmx5IGZhdWx0IHNpbmdsZSBwYWdlcyIgZXZlciBiZSB0cnVlPyBJZiB5b3UgaGF2ZQox
R0Igb2YgcGFnZXMgdGhlbiB0aGUgdm1mX2luc2VydF9yYW5nZSBzaG91bGQgYWxsb2NhdGUgZW5v
dWdoIHBhZ2UKdGFibGUgZW50cmllcyB0byBjb25zdW1lIGl0LCByZWdhcmRsZXNzIG9mIGFsaWdu
bWVudC4KCkFuZCB3aHkgc2hvdWxkbid0IERBWCBzd2l0Y2ggdG8gdGhpcyBraW5kIG9mIGludGVy
ZmFjZSBhbnlob3c/IEl0IGlzCmJhc2ljYWxseSBleGFjdGx5IHRoZSBzYW1lIHByb2JsZW0uIFRo
ZSB1bmRlcmx5aW5nIGZpbGVzeXN0ZW0gYmxvY2sKc2l6ZSBpcyAqbm90KiBuZWNlc3NhcmlseSBh
bGlnbmVkIHRvIHRoZSBDUFUgcGFnZSB0YWJsZSBzaXplcyBhbmQgREFYCndvdWxkIGJlbmVmaXQg
ZnJvbSBiZXR0ZXIgaGFuZGxpbmcgb2YgdGhpcyBtaXNtYXRjaC4KCj4gT24gdG9wIG9mIHRoaXMs
IHVubGVzcyB3ZSB3YW50IHRvIGRvIHRoZSB3YWxrIHRyeWluZyBpbmNyZWFzaW5nbHkgc21hbGxl
cgo+IHNpemVzIG9mIHZtZl9pbnNlcnRfeHh4KCksIHdlJ2QgaGF2ZSB0byB1c2UgYXBwbHlfdG9f
cGFnZV9yYW5nZSgpIGFuZCB0ZWFjaAo+IGl0IGFib3V0IHRyYW5zaHVnZSBwYWdlIHRhYmxlIGVu
dHJpZXMsIGJlY2F1c2UgcGFnZXdhbGsuYyBjYW4ndCBiZSB1c2VkIChJdAo+IGNhbid0IHBvcHVs
YXRlIHBhZ2UgdGFibGVzKS4gVGhhdCBhbHNvIG1lYW5zIGFwcGx5X3RvX3BhZ2VfcmFuZ2UoKSBu
ZWVkcyB0bwo+IGJlIGNvbXBsaWNhdGVkIHdpdGggcGFnZSB0YWJsZSBsb2NrcyBzaW5jZSB0cmFu
c2h1Z2UgcGFnZXMgYXJlbid0IHN0YWJsZSBhbmQKPiBjYW4gYmUgemFwcGVkIGFuZCByZWZhdWx0
ZWQgdW5kZXIgdXMgd2hpbGUgd2UgZG8gdGhlIHdhbGsuCgpJIGRpZG4ndCBzYXkgaXQgd291bGQg
YmUgc2ltcGxlIDopIEJ1dCB3ZSBhbHNvIG5lZWQgdG8gc3RvcCBoYWNraW5nCmFyb3VuZCB0aGUg
c2lkZXMgb2YgYWxsIHRoaXMgaHVnZSBwYWdlIHN0dWZmIGFuZCBjb21lIHVwIHdpdGggc2Vuc2li
bGUKQVBJcyB0aGF0IGRyaXZlcnMgY2FuIGFjdHVhbGx5IGltcGxlbWVudCBjb3JyZWN0bHkuIEV4
cG9zaW5nIGRyaXZlcnMKdG8gc3BlY2lmaWMga2luZHMgb2YgcGFnZSBsZXZlbHMgcmVhbGx5IGZl
ZWxzIGxpa2UgdGhlIHdyb25nIGxldmVsIG9mCmFic3RyYWN0aW9uLgoKT25jZSB3ZSBzdGFydCBk
b2luZyB0aGlzIHdlIHNob3VsZCBkbyBpdCBldmVyeXdoZXJlLCB0aGUgaW9fcmVtYXBfcGZuCnN0
dWZmIHNob3VsZCBiZSBhYmxlIHRvIGNyZWF0ZSBodWdlIHNwZWNpYWwgSU8gcGFnZXMgYXMgd2Vs
bCwgZm9yCmluc3RhbmNlLgogCj4gT24gdG9wIG9mIHRoaXMsIHRoZSB1c2VyLXNwYWNlIGFkZHJl
c3MgYWxsb2NhdG9yIG5lZWRzIHRvIGtub3cgaG93IGxhcmdlIGdwdQo+IHBhZ2VzIGFyZSBhbGln
bmVkIGluIGJ1ZmZlciBvYmplY3RzIHRvIGhhdmUgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGln
bmluZwo+IHdpdGggQ1BVIGh1Z2UgcGFnZSBib3VuZGFyaWVzIHdoaWNoIGlzIGEgcmVxdWlyZW1l
bnQgdG8gYmUgYWJsZSB0byBpbnNlcnQgYQo+IGh1Z2UgQ1BVIHBhZ2UgdGFibGUgZW50cnksIHNv
IHRoZSBkcml2ZXIgd291bGQgYmFzaWNhbGx5IG5lZWQgdGhlIGRybSBoZWxwZXIKPiB0aGF0IGNh
biBkbyB0aGlzIGFsaWdubWVudCBhbnl3YXkuCgpEb24ndCB5b3UgaGF2ZSB0aGlzIHByb2JsZW0g
YW55aG93PwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
