Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E510B073D7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98B310E273;
	Wed, 16 Jul 2025 10:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cC2FG0M/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1136F10E273
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:46:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjP2XJ2f2VOkRg9Xk7v+mFr2c8ng67aafozIMbtf5I5VrwCrXYIJcW8YZPkGO3lSUd5ag1oya6fK54voTrpJ54wIfvKFXk1MsLyLgKzmI/OnvAn42kD9PtAoVH/DKD2P0w+2VU0XPcbW2HUeyJoREOECegPbgt/jMBxHUoDtKXoLMZuiHfAV1YIDTdstwp+5pq/JLdL6QkoJlEmE54vsD75uTo58ZV/Sfx6PE8GEL71eVpBshyUE0f98RDszaYKBcMsQhJQ9cLRvyOjm0m3jPeqYnWKxX1EI1R1OgP5wtNfHIaji3RVU4mqzadgKUPyRNlXqnzYLhrgsaKPKandy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lm9IPsID0ZGG2Qhp9vjWqYP9RFsW3OI+NAxuUetNVE=;
 b=pMiq3HkfDK3Jpsc6Tbaem/mo3/MyWM2q5/+Sg6n//3I4S3hTsQZzCo9YuvyzG8FjIWwGJcvEsPEgCCrBUXRk3WN9ou7ZfPuWwepDeGPIt3WsCTphifgzfXSwbsfC5GmqP78BxE6fyqRvajWJWV9HQxUiatFDrBDNmP9jXoiXS1R/GFfq3afrXwVb0PEfxPThGBUi9yyL9JWsuAaVlecCaP8sEQuMneCHPp33p61ahGd62XJWmomKjM0RD8H6+VsxQfvzbSvFlKB/hywFgIVHcOOlYTMzIvGxRjxJdk0qOhVQlRTf9Uar8SP5Zl2osQMt/d8/o6nzxO5lRcdrIpDKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lm9IPsID0ZGG2Qhp9vjWqYP9RFsW3OI+NAxuUetNVE=;
 b=cC2FG0M/NXy2f3Hue/vqBs9GaFUw1UnB0NXzoOy+xKuTPGJ2ucL7d6Nmr2duGTa5rocebGNdoF9mOv895YZDNKiT3Op9Mg7CqntSpmC0byUKNU1TUr9YiMdmlrci3BP6qfrYmoU5Cenx6EFTKBbZBj/WeyLk2fF+HdgLRG2b0/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 10:46:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 10:46:21 +0000
Message-ID: <496df529-5d00-46ae-8581-56cac1814287@amd.com>
Date: Wed, 16 Jul 2025 12:46:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
To: Danilo Krummrich <dakr@kernel.org>, "cao, lin" <lin.cao@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "phasta@kernel.org" <phasta@kernel.org>,
 "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <CO6PR12MB5491D8AC9F0920FA75D2CD6AF556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <DBDEEPDKQAX2.261COQD2QRTVF@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DBDEEPDKQAX2.261COQD2QRTVF@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: a93f2d8e-1e2d-4681-e051-08ddc45600a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFBZUFlZVW9XL2V5V0xGWHd3V1J1ays4R0tGeiswbms0QXE3ZzFJdjZ4ZWlt?=
 =?utf-8?B?MnIraVVaYlpPdkxDQXE0VmRLaVBqeG53ZWR0UWpjK3RXR29obzBmK2ZROFBC?=
 =?utf-8?B?M2RZQjRpbWJqM0xVMTFUSFBoRGxMRTRVSFlKVlV3a0NFVTd4Y3Urb0tYbXNR?=
 =?utf-8?B?eU1tQmI1a1JyOFBoa3g2Wms4YUgwMk9zbDAwYWlvQU1oeG5LMG93clBsUzM3?=
 =?utf-8?B?dU1yYldicHFaK2pPNit6bFI5cC9wUEVKSS9JWlE4VTJqQitUaExNMi9LOFlo?=
 =?utf-8?B?YnZLVkxFTzFubFJFc0VZWFF0dWo3OWxOUTM2anlCMEVDSno5azZUYnhIUFBo?=
 =?utf-8?B?UUptWFJXbG9Sbko5eERQMmtwSXdHQ1BNN3JoWGkyTjY5NkVRR0JKa2NzU09u?=
 =?utf-8?B?dnduVVhDWWdsSHZZMzVwaExEWklzRWZKVW1lUklhbEdEdUJaR1FiYTN3SGc0?=
 =?utf-8?B?SVZndmVmcTR5NWZtQkFZaklDNFhYUm02Y0V4UzVxTnRTVGQ5dzZqVTNtdXov?=
 =?utf-8?B?RGFpQm9GSnhJdWdubGV0Sm1iN2hiZnc4S3BhTUp1QVJwZDJlTzdEMXdHVS9G?=
 =?utf-8?B?Z3BKOVVtcXR2a1FGR1kwbVdPRHBDS1A1TTB2clJYeWFXc1hpTzQ0anlNWHV2?=
 =?utf-8?B?SW4vSDk5Z0lYaFE3QW53L3EyekRrcHdlckw4QUVzNzRWVkdTaWtEc1BSYlZr?=
 =?utf-8?B?QmU2cXhsREVGenB4QTc0Sy9wNHBkTzEvTER2aWpWNS9JaXRVbUMveERrQ1cv?=
 =?utf-8?B?Qm9yajFzMUIxR2h6QjU3MnJON2ZON3U1STJzQkx6NjczcHFuQXJqcldHQWMv?=
 =?utf-8?B?R1NGYkZ5L3Q3QUNEdEFQUDdzeVNGZVY5L29OOE9YeUs3RWdZT3RxUm9TSElJ?=
 =?utf-8?B?dXN4eWJmeTkzMDJyenVMUDBYMXgzL2NqeENuNXRXRkd1aXAwMnZJaXdZazJh?=
 =?utf-8?B?ZjJ1MkRWSS9Ia1E1b3VXckZsQjZ2bjJmMTNNZ2ZyVThCbTRnbEdnRW5XMUNV?=
 =?utf-8?B?bEhvOFFRZlBGUkpURENkSVhUMHJYeC91OVVlRWVYZ3BjeFRRYWFFaEV3aGdh?=
 =?utf-8?B?b2F0cTdobTNKaTNxQUlNSVpYVXpSSVJzUmRJZiswcmI3eXdoMlpUQnVlcjYy?=
 =?utf-8?B?aW5ka2g3QVJwbmNFUVQ0RHQ3SWFxeElxNUYzcVJER1ZXd1BobWx5Tzk1ZVg0?=
 =?utf-8?B?cXE3Y3R3NGtpbzRHeDVHWWN2bXMrd2g5VCtERkhOeHZMV3VvSU0zU3Q3eTBw?=
 =?utf-8?B?ODdlZ3lhRkdab3ExcFphN2FwNzVFWlhLN0RKdW12L0wyT09wRUE5cHlCMnFC?=
 =?utf-8?B?SFF2RFI0cm1iSDFVV0o4NUlaZUl4RHdVNzBkZTdvTFlqZnlTZVZWQ1B5OFdZ?=
 =?utf-8?B?QVExQ3Nyc0Q5eSt0SEQwTk5RMlIya213S2ZRY1JaeGFjbmZLSnEwSUdGcGww?=
 =?utf-8?B?cDlreHZFTDNkU2ZENnExN3NVMWtFZE1UNjJQOTZHc1RJTDNwRGRVWmtYVWJy?=
 =?utf-8?B?K1ZLTFNJRElhdkxzMk5vZmVOalJLZi92NzNNZ3VqSjc4VVpqNVQyRzl1THd1?=
 =?utf-8?B?WU92Z1pXM0Q3UEgzSC9PYnNCdjVLbUFtS3BUaUliMXVkVEE2QVZkZGZaNjlt?=
 =?utf-8?B?SnFNQVdSWElReXlUK3dKajlBeTFUeFdjR3JRaktYRkZmV2hSUmRMSjB0eVJV?=
 =?utf-8?B?bm9VZEVHd1hhVjFvdEM4OUlnMmJ0eTJuMVAxTUdCV2NLTFpQelc3NUZJVmRX?=
 =?utf-8?B?MVBFbnZlOE45M09uNkxCZ0d3QmEvYm1pWTBwOG9qdGxOU2V2VlBZUlhnRDVa?=
 =?utf-8?Q?09JgreAkLDTGQmw0ETtJuMnkuK4DylWG3Zih4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JLT09zbE83Zk9vSE5QMmt3K01HY2VRQ2tYSmtWWWRmUWt0MGw5Ykp5Qits?=
 =?utf-8?B?RFNaY1o0aU1xcGdXQklFSkI1MlpHa2NtRGR3K1pyQ3kvZkpuYTBqd3NMRDNu?=
 =?utf-8?B?MjBhQnRwREJ3WWs0T3J0aVJheG1VQzRRWlA3bVQxU3Nyejd0djczUndmamxR?=
 =?utf-8?B?b0lLbnpJRHdDT0FsbW84d3hoTUl5TWtqbTQvSG5Qc0RwditONW0zaC9rN1N5?=
 =?utf-8?B?TSsyRTdoZVNwUDY3K1NjWjJpL2xUYk1ndng3anJOcXAzVFhwLzZ3SmlkRDdn?=
 =?utf-8?B?Vyt2YzZMeHJ2L3pQeGhRVmpLU2pCUmtiOVZQRlBRQ3pVVC91NXVWVklUUndG?=
 =?utf-8?B?YzR6eTVldEZ4V3JJd2xuaVRXUXNKbkVUc3ZmbExhVUxRQStqYng2MmlHT0Fs?=
 =?utf-8?B?VGIwbGk5cStjeFNYT0RrZWtOODNKT0JyWFVPd3Zyb1hLeklFeWU1bTNkZlVC?=
 =?utf-8?B?N003amQ2RU1qZDBvdWloVW5XOTNCSVJ6VTRFTzlKMVUvdTc5dzZ0bkZEL0Fl?=
 =?utf-8?B?S01ndE1wTEt5WlU4RVE0dXd6R1h3VmNvZDk3U1BydGVRSnNoY2ZKUDVoYTlO?=
 =?utf-8?B?eFpRV0ZLNkJkOExmc0dTeWpGNXZ6S0JsLzAyNWZ2WFEwa3RNUDEvOEcyOWFS?=
 =?utf-8?B?VEpGdVRiWEZDays0YmNGTnBaNXJ1MmtoK2FFODZrczdwQnB0eGVBdTZQSVQv?=
 =?utf-8?B?VlFJb0NzbFJGK0lEWTQ1bWlqQitPbTJFRkdVbXFQV0JDUXdTMFU0WlN2aDlX?=
 =?utf-8?B?ay9OUW9oRkRVMzZWbFpxODJHamVSRGFYSHBHZDBJakJ5N3kvcldsUEpQRXRL?=
 =?utf-8?B?UjBzU09tQ1VqNzNvM0FmNjk1T0RNNzg2d2x6UEhFWkd1UUNYM0dZV2tPVmJw?=
 =?utf-8?B?THhidm1GanZ0K3RMTk5uc1hhR1pVRnBmQWprM2VRN2YxbUNoU253aWg0Z1hV?=
 =?utf-8?B?ZGJzanBFR21OYVluejlpcTN4Ti9YQXZNSU5rZm1pRHVvSGw4cXJ0ajNSK2dz?=
 =?utf-8?B?ZkF5Q3UvMDUrQ2hxckd1a3lNZ1JlMDNmOTZpYzB6anFhUW1yRDdZV2hia0xx?=
 =?utf-8?B?NWREdXRVaFBNa2VNYVpVd1JuSmlWNSsrczMyMTZacExaeGNBcTg2QkJOWjRT?=
 =?utf-8?B?Ylg1TElEdFB6VlpoQUcyRGxNQUNkRGxSNGd5dWd0R3VVVWpyaVM5QjA3VVVo?=
 =?utf-8?B?dTFRZTQvdXMwU2x3RldWVlpPdFZEWVpGZk1yaE4zakQycS9OVVNBY3ZzV0Rw?=
 =?utf-8?B?QnJQYjhmY3gySzdpaWY2QWVLZkMvZG9KMzhjNnBaNDV4R2lOWm5aZEZLWW9p?=
 =?utf-8?B?S1MrN3VvYXU1eUpmN0JXN3NTeWVMSzgwUFdsaGtmK2Z3cUhrbjJqTjN0cC9G?=
 =?utf-8?B?Q3RZMlNDUmhWcnRHV2haU0hlSERUMjNBWk5MNlRXbWRWbzdzRXJuUmljYUhV?=
 =?utf-8?B?cVhyY1F3T1BlNHoyWkwvYUpDcFEzWlVEcGRFQmNVMGR3dThmY3h3RTFzaWRs?=
 =?utf-8?B?cExyQ3Q4L0xTbXgwZXYxUW5iV1M0Z3VHQnJuUW9UWTRzMXJFYlVrbHRJcmtR?=
 =?utf-8?B?QjI4c3h1YVhMbGZiVlRGSW9Bak1aVmE3aDJHUlZ6eEQ5MjB3Qi9Jb1V5S2Jy?=
 =?utf-8?B?VzZVaThFKzh5dnB4OS9kcXlJMmc5NE1KRG1zbHVpby9XODVtdWp5TTZyRlF2?=
 =?utf-8?B?R0F2MG1QbGp6dXg4dFJFLy9WbzVnMEw5MGVsRktPdG9mb3l3UUNqT0RUWmhk?=
 =?utf-8?B?YWhDaE8xcDBTbDBiQnZlcEdOTzFERGczTEhUcUxsdHpEQTRONTZnQUhaY1ZQ?=
 =?utf-8?B?YnhBSGJlV1VqY2dvK1gxdW1EMElhRUhMa1JOQllxUy94c2lCd2N0R090VUhP?=
 =?utf-8?B?cFJmSUp2bDFjVVRuQWNXbHY0T1VhOUs3WDBMYXdEMTdtbjJDNHlFb0E1V1ZG?=
 =?utf-8?B?T2lteTZxVERQZFJCZlBQcTZIR2tSNkNJeHdtdGFaaVdTS2FRRmZVRG5tczlC?=
 =?utf-8?B?Y2hQY0pJcjlKUWErTVg0SDRUQjkxUFJteDVJZUVUeXBMSk0vZUtmbEFLeWM3?=
 =?utf-8?B?T2NsakJkY1dWMzNQbHBmZVgwTGlhQzBsaGFhYTlXZ0ZJVld2eDVwM3hIQ21h?=
 =?utf-8?Q?Tbi5KRE4Z8aQqEM0KM6GqQRMQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93f2d8e-1e2d-4681-e051-08ddc45600a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 10:46:21.7215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiC9Oh6a49dqH7mzwEdO4Q2S/OeewWZ5F5XZXyC/Btmf8YmC2MooNMcDpdG0ODYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915
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

On 16.07.25 12:13, Danilo Krummrich wrote:
> On Wed Jul 16, 2025 at 12:05 PM CEST, lin cao wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Two small off-topic remarks from my side. :)
> 
> Can you please remove "AMD Official Use Only" header when sending to public
> mailing lists? Otherwise people may have to delete your mails unread.

It's automatically added by the mail client/server.

But for some reason this automation doesn't work correctly since Lin is clearly sending to a public mailing list.

It took me actually quite some effort to convince IT about having an exception on it.

Going to talk with my manager and IT about it once more when I have a chance.

Regards,
Christian.


> Please try to avoid top-post replies [1].
> 
> Thanks!
> 
> - Danilo
> 
> [1] https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

