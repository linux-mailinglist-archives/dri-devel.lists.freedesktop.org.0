Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7AB34080E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 15:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F295D6E141;
	Thu, 18 Mar 2021 14:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F38A6E853
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhIdFwZhuYjjEdSNCEIlEuzSOa1GgsBohhGf1H1mK6QzCoL0idsw/aVtKVt6/ojHDV9Kd/v+HO71mzNbv0ETX9EQt8EGverZRhbBrfX4F2sJVixPN0CkHlMtmdtFVa04kv620vJd1gf4I3jSZjkBeI22e3Fw9yLdjEY549XVxX7EF9/pXLMVwmAW/lFHaIEIJx4AAgZCdEqx23ftuFB5pHNvXKD0q+GyhZx2bgY9N2Nf6NOJPFBubvVK6GO3omOzrEYX1eMdQOPeiA/YDmznduzSmBE8KsmLCKy89ccVnfQjB+Jbug5mo5FqV3l8IbSS/9CIhrrLKrOx1kqwSgVayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol92o0428YqTb4HlZHUYpYjevpieYGpzsItQLQEU0YQ=;
 b=jTm4EIx4k/7uiVGf+zqogNVhW+FqlqkmSJhNYcKb2kAxjNPuAZFRu+LWaLK6V1FTkhiUhjIGpIK7kKjV9ITL8xKS/4k5OVeB+KKqE8ZUcyDXS+GehH/+kjegxqtwF2I6NFxyaDaWZNSTMpQRirAycL7zwV0b9IYe9MHgeaxnBxiP940n0oF8LyCjgoVfExMAjPJ3sXdEk74RFQYzdmrp9DoyTZjdEdP3rbbOH+y5gAjdKK/LigNW59t/lGhK2wQGlz9cOKiofNsLgKDgl3VgZM6txreoywFQpW3PzaYHYSSpOKKxTuotEctv1dEppgCyohIdwHksXJ/5Ym/YHFr5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol92o0428YqTb4HlZHUYpYjevpieYGpzsItQLQEU0YQ=;
 b=nX90fGQ1Xb3aN6byUIpES2YvvPTlZz5b96r6IYLHrp4E9kT9PS2+NIiEa0bBipHaYJJa1xpZVgu+h6l/qJwTQcGq7pWEB7xxbQPpa3NclCuV4VqMP2NpCeCPr4kiWZt5k5x5QlszHTB7l/Hfe3Ivf3rBzKmUcUN7LRy6YzYezPc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0200.namprd12.prod.outlook.com (2603:10b6:910:1d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 14:43:43 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 14:43:43 +0000
Subject: Re: [PATCH 1/3] drm/ttm: move swapout logic around v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210318124719.13656-1-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <21b8c51d-a237-060d-438a-cd5709c28348@amd.com>
Date: Thu, 18 Mar 2021 15:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210318124719.13656-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [93.229.52.167]
X-ClientProxiedBy: AM0PR02CA0003.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::16) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (93.229.52.167) by
 AM0PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:208:3e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 14:43:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a3fd10e2-0dea-4dc1-0364-08d8ea1c39f3
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0200:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB020004F4B39E29129F5F7F788B699@CY4PR1201MB0200.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sY849ghdsxGZ84LhJ3eBsLADWDjww010cBCzhDLs0BTKgl1i3ol6lN0M+LhMcESdAoY9DDAPEEKm2GQQO7GRgNL1YJ8QhEbRwZl5LpTBbGi4TWGnuiOdN/tOuMuZHOnUlZpuCmUhOXabdeQk9WSs36CNJyi1LHMmPQ3/J9/blReGTbxQGPhbxg4WP3dUJ4zoLB8gqPDP7uqbAiJxu9RZNciIaLKhZq0H/4jHkmZotf028AVrtzKw6kJEKKPGO1Q/QspDPgQoVwkXgPACcr38pIGGWTL1ouv/0fMCOCkL8qDnMWj0XuIaYlYH5ahGD5gQIH7NmCoVWthE2Ens5RCjfnil0E1u58lWmR7S61avw4J8JgrLON3sUdsXJJZ5gTTTuVQRAnC4bGg5oE+RIafwMYwYUlFjNfvCtECU8oFW+aBUvVgqNFO51SkoJHevo7/0FNTlxKe4W9wpm/Jo5NvuVXafPN15QHTUhpCwacKQ3VZvzFQ1Pr3pJ3+iTRTHYzaJ5tm4TMuxWxESbsAOWBdTvk7prYZ2AYu1o1kpr1tcQTEK8aqzSidVC4j0wjNmZ6cDUXblMpnDcIV9kf8SLDfNByiaVc3wcWbSO8kUzczRnFAqVxOY8n7hB2e/9jbFM0HJlXxKKAEFyfTQQG+R+teo64Fwg5rJsWuKlx6uhHdshwbgOfRU21HL3qEfhxC0UOxt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(956004)(6666004)(2616005)(16576012)(66476007)(316002)(31696002)(8676002)(2906002)(66556008)(8936002)(31686004)(66946007)(38100700001)(26005)(36756003)(478600001)(5660300002)(186003)(4326008)(16526019)(52116002)(6486002)(4744005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S1JXaFFFT3dXSzNYYk1vakdBN1c5Um9Tb0hQRkgxeWVjandIalYxWWs4Y041?=
 =?utf-8?B?RXdiNW5wQmdMYW03NGR6YmVsUW9WTlRORFAxN0pzYWNXZjNvbUVPNDR5SjVi?=
 =?utf-8?B?SThZZllScG5HTVJZdDA4M1hBa2NNQkhMaThURTNKV1FwVldaeWg2UGQyZ2dN?=
 =?utf-8?B?S09USnRTV081SEdMd01ZM1RGTHlFZE9lVk1VVjhPUzVML1BqNUNlcklYQ3VW?=
 =?utf-8?B?MDdiMzNIQTJ4WU44MDhVY3J5aUhCVmloWUJyOXIxNFM4Q3dndFRDOTlEZ29C?=
 =?utf-8?B?ZnNIWTF0UE9UZGFKenZ1Zy9veHk5cXZMWXdBZGh0S2tDZ0N6MjBhbW10SDdv?=
 =?utf-8?B?QlBJbWxMYUdPYUVDcjhkRy9tZjlGWnFPSzRRRmRmWTBXM3V6WVJVbEhodGQ1?=
 =?utf-8?B?Q0hrekJpSEpzb1JHbmR5eEJOZWd0ME0vV09YSUVtdVErKytqdG9kMEZrMTF0?=
 =?utf-8?B?RVA3NGVZeUR3N2dYVCtYQlJyZ3Z6L00vKy9QcXhHVUdSaFJYZkxJbXgwVU9U?=
 =?utf-8?B?UUpLMkxESms5STBlQjZNZVV2NllYaUJjSUJTM1V4MmVkVUhYMlVtaksxaU5k?=
 =?utf-8?B?TStad2l4bFdnWHJjYjV2ODlGUmNvRTVsWmVCTjJBV3piNU1DcVpFTnFsdUpG?=
 =?utf-8?B?UnBwWHJPSllxdElWOGpXbnM3MDJGNkdYODZoenFNV2tHcFJjNndvZHZacHh4?=
 =?utf-8?B?amV1QWU4c2FpVWdURVB2RUdnTDFlbjNJOVdlQWQ3eVYrMWwzQm1YUThRT3pD?=
 =?utf-8?B?bUpBN09aalc2aGN5R3pNTWlsZmpaUTNiT0pTL1U0dEhQejRvL0VqcGd1YndT?=
 =?utf-8?B?TWtkaVBpdGFVREFBZ25vT25UWGRQRWgybjlqa0ZHa2ZJdTFVVnNyYlBOSzE3?=
 =?utf-8?B?WlVvQjErNWxWdVpOdEorK3dMWVkrdkV2VElRMVNuS0oxQXN6NWNubzVaMm96?=
 =?utf-8?B?WUxYNGhvcjNRTkFVZjJjay9KTEFBT2JNSFl5VDlRWUZyRWd2NnRiNDR1NGJj?=
 =?utf-8?B?Y0o3TkhTK3dCN0FpMGpZbXdxRWwxczF3c1dCQVpuYmpMRGFmTEpaZWZkMzFW?=
 =?utf-8?B?TUpHNGg3U2VnZ0d4MFN3Ymdrb1k4WnpGQnhid2gxZHh0MjBQTGV0UjNtVlFv?=
 =?utf-8?B?V0dsUG5lbXpGd005V2FCY3F4c0E1S1hhUk53cGxKVFVZMDF4dHlTS0lSekJn?=
 =?utf-8?B?Zkl5YmRRYWo0alp5SkloYU8rT0lnMmtEdXU3TVBDZ2R2bHVuWVQxRm9rTVBH?=
 =?utf-8?B?eVA2QUp2dE9OR242VzN2MmsxTHpiOUdMOEpsRE9tT1JEOTFsWU1FOU5LYk9G?=
 =?utf-8?B?MHc2QWZ4VW93dHdmQXZod1ZIWTM3UDVvWUZ6RzRJQTdKRm5IZW9pUDBDY2Nr?=
 =?utf-8?B?VDlVSVNTTy9GUGwrUStDTUpXQlkwVVJnakpUM3FxWmdCN1AxQWlQd1NJYllD?=
 =?utf-8?B?eDBrSFpxZ1VtbkpITWdzTi9ONm1lVlErL1pveEpvY04vODNNeUlGWHltQmgv?=
 =?utf-8?B?ZFk3MWkzYWxlZ2QyWnBJNkc3YW5vck9MUlkrN3NmdmVmZmVsT3I0bmFFZkJL?=
 =?utf-8?B?YnJjRkJqOGYrRXFuWmRKbmp5ekg0WE1kVFhKN2J1a0ozTlJQeHJzSVhzdnE5?=
 =?utf-8?B?akFiTzcxekpZVUlWcWNzRDRFVDRRZUd1NlZ0VG1PUzF0UldmU0w5cmFRYXhz?=
 =?utf-8?B?NHBDdWp1OVc0N2NtUDVYdnROT1lkRTZyelMyWThDV2xtM2ZTNms5UFNCYkFQ?=
 =?utf-8?Q?Z4fv9nkhgfbA06U8R742052bYAXGtyhkPj8k8so?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fd10e2-0dea-4dc1-0364-08d8ea1c39f3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 14:43:43.0184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vwe9rcmNZ8fhBFnat6hCElx30n5jAkjp7dbu2API37rUZmGddpBTTmvFyF6LVjZpQHP/XqXIB/I5zh84f2Mktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0200
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
Cc: ray.huang@amd.com, matthew.william.auld@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gMy8xOC8yMSAxOjQ3IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo8c25pcD4KPiAgIC8qKgo+ICAgICogdHRtX2JvX3VzZXNfZW1iZWRkZWRfZ2VtX29iamVjdCAt
IGNoZWNrIGlmIHRoZSBnaXZlbiBibyB1c2VzIHRoZQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX2RldmljZS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAo+IGluZGV4
IDAzNWJiYzA0NGEzYi4uNmEwYjI2N2Q0ZmU2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0
bS90dG1fZGV2aWNlLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oCj4gQEAg
LTI5Nyw2ICsyOTcsOCBAQCBzdHJ1Y3QgdHRtX2RldmljZSB7Cj4gICAJc3RydWN0IGRlbGF5ZWRf
d29yayB3cTsKPiAgIH07Cj4gICAKPiArbG9uZyB0dG1fZ2xvYmFsX3N3YXBvdXQoc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4ICpjdHgsIGdmcF90IGdmcF9mbGFncyk7CgoKVGhlcmUgaXMgYSB0eXBv
IGhlcmUsIGxvbmcgLT4gaW50LgoKClRoYW5rcywKCk5pcm1veQoKCj4gKwo+ICAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKgo+ICAgdHRtX21hbmFnZXJfdHlwZShz
dHJ1Y3QgdHRtX2RldmljZSAqYmRldiwgaW50IG1lbV90eXBlKQo+ICAgewpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
