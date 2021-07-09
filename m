Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2363C2098
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B16A6E9E2;
	Fri,  9 Jul 2021 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D976E9E2;
 Fri,  9 Jul 2021 08:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1mGuCnuHV0Jwn7VmX8cZYTunUPLlu7SZv33YTUypbS9Pi2HhoHthiVQKiVp388AMPqSka6yjIeA6sEY4zVXNJ0YMO+OvzpQaOPuHsOBTOhR1kC4Zq13DLo+KC3Fh4dqk9cIClh46pGCh0OTpx+wKY4lfczGuY1ELMatcM1F3oeZJkB60orY5rzQfoBNbgJxSQhF6KYcQ+S5ccL73CGnUemqyddBCsTJ9Hhlf6DAiui5eMRXItZ1Gc/ufRNXXt66m8zbivPJowG4ZitUqL1LYLRUPhfH60lH89rkGKG780teQebvXlAQebZbw0a1Wkc+fCN9+HPUS/CpkLsuvy26Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1bT/dPhXJMH/MorwlePCXNCkEMe9NdsSk9p3v80uRY=;
 b=OxlqZZ7gFr/YnlpEHT/ideLt6UaWD/NZT+7m4LonHzyGqVmbsUoqnMFI3U2y4j4Pv/NbBVX+zksVGkJn+eOjgCX8m0lHx/RyfMQySKcKiOQd6NKWNYw7/w7tZaiiUFqdwDTITCETwa/+M6enn70kBWiBl17DYYuEP+pIETMACmyDxo1SnDL3MZQWxtOwjuVsnf018pQwW2jox/8DnEJGRso2gbPxYmrDWS3tBTAtwkPKNwe8LKMAt4uzP/70jtWFfFrW1TQLIaa+MwMwhPCXv2jmeQYi6cxRb0Hah9ykiodLPadHMCNgax1tROWto4Q9vdCLKh7H+jfekr0F3Gd4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1bT/dPhXJMH/MorwlePCXNCkEMe9NdsSk9p3v80uRY=;
 b=i1giZ+/04NT0iimE4JecpBvaJBM5wfAdFcw4ns9jq9TlXVxf6mFBHK9qphXcRFHqpv3e6I88zI3l8/y9YqMdKV0hVBWZs5Fe8X/TYWAqHXjJQsbUTjaY0ohupwMHPk1BSmjUD/j5myZhrwJBBIdYM7MvIiUWM3NM8zRIOyBcmU4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4708.namprd12.prod.outlook.com (2603:10b6:208:8d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 08:12:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 08:12:45 +0000
Subject: Re: [PATCH] dim/drm-misc: Add rule to not push patches with issues
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d4b8e841-e583-5553-b629-dde728f8a801@amd.com>
Date: Fri, 9 Jul 2021 10:12:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P193CA0042.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3da0:55de:64af:96f9]
 (2a02:908:1252:fb60:3da0:55de:64af:96f9) by
 PR3P193CA0042.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Fri, 9 Jul 2021 08:12:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4ed4a8d-082e-414a-302f-08d942b154fc
X-MS-TrafficTypeDiagnostic: BL0PR12MB4708:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47086E1E5DD3BED9C34C051183189@BL0PR12MB4708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZwqUiMsq7fhJxph2EGnJqM8i5FKUdewGi/XJVqFulWXlOEc6FCwuxi1I6jz1i02bYmCl6ItBmj/dm8d3ySyj+esJBGxCjz1wEJxq8M5Pyd76s38WOC8OJipF34Us/of9MookDSPRB2NSeJtQQruUkYK8qNnoTeqBF07wA88WQiN9I1Q08zZNc4MnP0HP4uzqQ6/rB4Tbd0JqcnrtMYW5YECMUh++3EzhmlH/Efg/KzcoNqkx//cwCjQvBjkxvhMbzmtqEpUL3pt38dKujaNOOXPI0H3gsbr1YJXAOX9sRQYi02sRfipYr+TETM9PtrFRY2kg6ycFMj65dHOseBMnuAh4sDgCq0ixiOMOKM2ooz0gMC9umwgx4UfXpNxFdfQ/CcNdp/HkG6PXAMTs5RDl9EN4AzxvyzlqUAVHjPu3Gvuq4qm7hNM+ThgRCZCN4BJEQT4z/kFQHmupDc8t2sQ5Z1RuakH0xeKwtGdSii7faVvjhPSwAB+HErTO8aw4X28lYNgjSgmwCfZpXjaukzSz+PPGkpG6NU13Zn5o4v/VQOoB1i8tCIR13XqjlWILnNem6lR4UzTCNmyzxivFWcon/rlpL3AKd5gGb1406uHGretQHR0N9+l68HzrOms6aFpR5J0MbxPcwG9TkI/vltpPqUyme4hfy5q9Cv0axZnlPphZ5ZgJBZe2/maYciQBsyzNNWJX/iYU7JGfBYpPqW1CTDDe+lHF+PXZ0Ag6VJ1aMbDFy0UpymD0oyYnVZ3gD6c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39840400004)(346002)(54906003)(66556008)(66476007)(5660300002)(31686004)(110136005)(38100700002)(66946007)(8676002)(4326008)(316002)(36756003)(6666004)(2906002)(2616005)(478600001)(8936002)(186003)(31696002)(6486002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FMbnQyUU43ZlBPVTVkTlZIVW05STNGaDNYVnF4VWkyL0pTeitHUFdiTSt5?=
 =?utf-8?B?TWpQVXBSSnp5bDBIWlBxUkVUNTNGWE1DM1RrbmFpZWxJSEhiOUhLQUJtSVAr?=
 =?utf-8?B?dmFUek84MmNPV0xqSmF0TE9WL01XM2xqc2w2M0RmY3JlVFJ6M09kM2QxNVdB?=
 =?utf-8?B?bmV2bTFKY01sVDR0V1ZCb3JlMDVjZEJ3aklxaTFMNzg2ODEzUXRWZS9ZQnFn?=
 =?utf-8?B?N2FEZ1VGOU1FYmtJTExXcmhaRHBpdWM5K05qQk00cGhJaGNGcDNkSTBtc01r?=
 =?utf-8?B?WDgycFM4Q0RsTnZiZ3V0ckowUmJYbVJBSThQakdUVUlTNC9nM3lFNGFaVXhP?=
 =?utf-8?B?Ym1UKzFPc1RXczhkTUtBeU9Yci9jUHJBN2RHOWJWY2ZJbTZKOWlFQ3B0QlZI?=
 =?utf-8?B?MWF1Rk56V0tVZG10NWhjZVVIdzdCakJOOXJzL05zU0RtN2lCQ3doMDRVclQx?=
 =?utf-8?B?M3dTYXpLQjBsQU5uckZGdTRubm9FTHpGSXczWjVjSDRKZmtOWGczd2pTdHZo?=
 =?utf-8?B?SFRpRjB5MUN4emVBSDQ2QnhsQkdmd21GTFlKR1cxWE10cVZtNVNWQTNiQ2to?=
 =?utf-8?B?cHdiWjVnbXFWRk9XUUQxVEJNVlliMmxXWGZycnhOc3A0V3Z3VVlyQ2JQYVBC?=
 =?utf-8?B?NEoyN3grVXZQTFdnU3FqNWNUS25ybjZHR0pCVVBPVkdHd01IR0MwRGxaL29j?=
 =?utf-8?B?RG5lZHU1elF6ajNVU0Z6NHJzaE82NnVyVWd2bnk1UVNsWEhvZk16amd4Mm9t?=
 =?utf-8?B?Y0d0MlVHUWdjbUMyVy9yM1J4bHAzQW9yMjlVTnZxb2FyQ0tNRGcxNkJKV0My?=
 =?utf-8?B?Nm9HaXJhYWwzUnpmelFWMEJnVzhRanJuZlJQVjdvQ0d1cmk4SVFDUlNsbnJM?=
 =?utf-8?B?TER1MXBiQnhkanYyU3R1bmxXaENXT3lBYzM3bVJTNUg0R1dORFRqTGtEOXo0?=
 =?utf-8?B?bElxS1Vpb25kZHd6QW14d1NWSWcxZ3RKY1ZGZkFFMjNHZ1lGSVNCY0ZrK2Yz?=
 =?utf-8?B?YnFWaHRKVUV6UWljZkh5eG9MOS9JcmU5YUZHcC9CeFIzZEt3UVlQU2dLQ3hz?=
 =?utf-8?B?TU15aXpDdVN1TEdrZW1Ed05ta3NTTXZOZjh1cnlEeHZUcURra1oweXlwWmxW?=
 =?utf-8?B?bUZSajU1NDlMMjNnV2Ivamh0QlAxOEVyWmJpRlNrejFpKzZMYm9kMmtlbERR?=
 =?utf-8?B?VTgxUEtaWTdiSG56T0dVM2JYTXFIS2xoZzBnV2ZZdXVPNmtDanVoYytKRU1W?=
 =?utf-8?B?TmZhTXREVDVzYXlUV2FBblVNMXUyK2x5WUxFY3BrTDNHdzEyaGdhVkFlYlFy?=
 =?utf-8?B?U0lLTUpobzF1bmRSYVVMcUtQL2JZQkV2bGtHTXh3ck5qODFzNkpVaHhKdUFX?=
 =?utf-8?B?ZXVpZU9Ocjk1YnhhT2w5Wnl2Y1B2Vlo3LzYxbXdRQmZwejc3L1VRZllpeTRC?=
 =?utf-8?B?QWovM0hUSXVVZnJnVXNQclNkVGxlZ0tkZ09XT1VsQ2J1UUlsUVR0a3I5bElt?=
 =?utf-8?B?eU9UUXhNUFVMaDVOYW9EMmpHUHJkVzV6V0htTFAzNDNVU1pobXl1eWpXVy82?=
 =?utf-8?B?bWpLZ28yd01mN3JTSmEzeHJZeE10LzZuOUZuQTR3b0hjSWlIRTVqNzNlM0tI?=
 =?utf-8?B?OFNXVDhsZU0rRHhKY0Z4eUNNbVpIck5EOTlZVExwazBuV0tlN1NCZ29KQUtx?=
 =?utf-8?B?SzA0b2NyeEZsaTlxMnE2bmJoSVZMVDdWNXVpc3lSbzRCZHpqNjBHWUxrU3lE?=
 =?utf-8?B?SUdlSzRuUDNRSWwwL0c2VkhXb2ZXb0JBQ3N2SUQxdUV6YlRsSW83aE44N1J5?=
 =?utf-8?B?dWdKZzJUdWtqTGJzQVMrYzNJVnJ0ZUVJTEFKazhNaTZ1VE83Z1drWnlpUVNJ?=
 =?utf-8?Q?c2GIQk/2iHWPI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ed4a8d-082e-414a-302f-08d942b154fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 08:12:45.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vcdc1cSMX0MV02DW6vGCSYXK2sxgfY2Mt8rsLQWZgSuOVanu3+ad2Rn1qKoucwB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4708
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
Cc: dim-tools@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.07.21 um 10:11 schrieb Daniel Vetter:
> We kinda left this out, and I like the wording from the drm-intel
> side, so add that. Motivated by a discussion with Christian.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   committer-drm-misc.rst | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/committer-drm-misc.rst b/committer-drm-misc.rst
> index 9497a5d26a9d..110ca8b0525e 100644
> --- a/committer-drm-misc.rst
> +++ b/committer-drm-misc.rst
> @@ -21,6 +21,9 @@ Merge Criteria
>   
>   Right now the only hard merge criteria are:
>   
> +* There must not be open issues or unresolved or conflicting feedback from
> +  anyone. Clear them up first. Defer to maintainers as needed.
> +
>   * Patch is properly reviewed or at least Ack, i.e. don't just push your own
>     stuff directly. This rule holds even more for bugfix patches - it would be
>     embarrassing if the bugfix contains a small gotcha that review would have

