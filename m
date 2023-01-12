Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BC6672EA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CEB10E2F9;
	Thu, 12 Jan 2023 13:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947D410E2F9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 13:07:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRBSCkiP4EBRhQ2zl7OlruTF0JNsL0FS6US5z7WGXN+qztqE3zdOOj1FW2sj69sfNpJ+tvJG1DYaAV0kDHTLkKP013vHr0Qx2Td1Ym671C5JmnnqUbUiQGHqvVwraX01migOCsmtjmWixigks9e/bkpTMEPXAvQlSIArTOOfnP2HOxGakDvMwA4B4mBAyXSmmCRGvv/3VCan2QdKH2Ww7n0Kts5SgjJNNsUMlcT3zVvkBlupVTw7O/dP3lagjJx5eSIeW3KCxDl/qdYqjHWtivAz8ld5FYYycxivVOMS0Y1mxdlHBmRcbM23QyJa4hZ7AhW6arjk0Xy8539MybH6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/7p3Aer8pt4zUdF9vAga5QnLV8zEdg9sSYKlcNG+zY=;
 b=iH1DYXkQAHMClPKnQhBhW1TLKWhSfO72GhZ8IKwRtec+iOVClrYQW59Z/DUe4or9VZtZHizgboFzNCabOGVeaBgMBlALdm2Bld7G385EgvWlzlHqIjxxjZJB8tVcgEQJC+bP0qTwTmSyt5FCazmj3VJjpWCKnDuigVAdOOMb9xlugPhSIIFmDZA+qsZl2FOEruIuTb+p6PztTaXn4upEWx/Nz+nqWwULoc3CDbu5d6EtaM1eJvGOs2Uc/O11nnZAkPiwqtRujF1AdKbgkxxJ1s725qpyxg5n/8ESALL/4ViZQcznAHAC1vfBGCq8utr2TdUEc7fUM3tF/HVIrqX5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/7p3Aer8pt4zUdF9vAga5QnLV8zEdg9sSYKlcNG+zY=;
 b=pJbYlGNzlDVWIc2jWDGL/eO7+re9D1rG8NdSy3mQKW/lBeBnKJ/fzXP+pcNY1I/pdIvPSrpDRFaH6kydG9ET+mzZY+uvA2fVXDicj8iXl1JvNupT5ElbQ1WMpiI/N2dA+hFopA7QEVVOL1nasNVMNqmo2opFskWSTsKiLlZL5QY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 13:07:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 13:07:01 +0000
Message-ID: <b7b787c4-d76e-d9b0-9887-30cc9f5374b4@amd.com>
Date: Thu, 12 Jan 2023 14:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/ttm: Fix a regression causing kernel oops'es
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230111175015.1134923-1-zack@kde.org>
 <e3844067-5bb3-8c5d-bc8f-3ac4c42a3801@amd.com>
 <341c50e2531279e79f57073aa80988b96154536d.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <341c50e2531279e79f57073aa80988b96154536d.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e58c7f-640c-4baa-0d69-08daf49de4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qj4rrl0NyXDzX9v4euhK8O4prhZ3t+v1cum/dlheBiN012fgK92BTgMKoKFho9uRGsCYLDZauqJtPFwHrPndHgPNLSzVS9VkezHdOgINUxAVB1bpzriclO/aZXti7HvScc9xbqOHLDpp+5d3I87vq9GAxfiF/lardfa6Ex9KQOWiZ1tgQfOqlMuR+6OUGBw0i8XlE6zhvga/n67HYngxgvaY0xeRFqwxap9SBEEl13jdMEx+jKqIVcqvXn+3UNakYzGpXonEhPhgO4Ybmftx18ve8XB2gpTeKny9uzxwZG9jfVBAm09Pk2x9bjGTMEMjSJMjQGKtnFKbtpWfahBphWLin7qMfir/OxC+vXiSVUyG6NlA7Eq88MniXpCVJDzvIuu1O5yWrkl34opeOUeMRgA+ekPk1YsCYhpNX9HRGGPar7m7iMRyqMZuKighQFFSR0Gyf4jsFL+DIAsSuUjCiIdcTWG7XGduSJpioVnKVzkkzAGiH2YUe/n75HF/1icfp4eG4Deo4W80C9A3FBWdotONqpbALbhPdz4NczeyDXqh4UK/9b8ALZZeW4WwTZMqYEqI/bIShVcJWSlelITEsMRyRXqkLDI6mKFLHlW5EMYZcXrJ2SHrDUPfDkJ4mJD8w/qKbaahi/xQahU5wG1kx5nXqzGZxoRCaM1GVxuTALB/4ZzQN4Teh3qZ8pXWBLAsTnZq6BRsUZrwft96FzJvNKvLA9p4ceaa1Y044NnDlF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(6666004)(4326008)(6506007)(31686004)(38100700002)(8676002)(66946007)(66476007)(66556008)(41300700001)(86362001)(31696002)(2616005)(4744005)(478600001)(5660300002)(6486002)(316002)(8936002)(26005)(2906002)(54906003)(6512007)(36756003)(186003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9NaEZPenZBQUZydzg3dVROd1RXVlhHKzB1MVZUeWpsQ2FSb0dVZVUxZ0pu?=
 =?utf-8?B?T2VidUNuVWtnVTFVQytiMHBYeEplSk9xMXZ1OWwvVjdMeC9Bcm9rUEc1WHZC?=
 =?utf-8?B?RUlnbG9Tb05uc09ZSTZPaTdlVFJoYlVvaGdZNXU1RXVkRWhpdjBrUVVuUWNB?=
 =?utf-8?B?N1pzNFhRNXdjM29HaUhBQ1pIUzdQWHZLM3NuSzNETWI1S0NjdzdROTQveGxq?=
 =?utf-8?B?V1orY09vaGJHSFZjUU84dWd4YjJ3bEZsOXp6UENKbURwcWlWdnJKRmdoWVpu?=
 =?utf-8?B?L3JXUTV3WjZ4YlZBTWEzUTR0TjdpWWtJVTZoWFJISklOMmVwaU5FSlAyZmRu?=
 =?utf-8?B?bnNuQjgxVG5WbytMZmFqUERldHlYSkNWeGJQb0dRRnBQZjBnZm5BK2R6Znp5?=
 =?utf-8?B?dW05enJ0ekFNOU5LZ29kY1lQOWpBRXUwdzhFZmF2cGZJWmoraEZ3N1IxRm5J?=
 =?utf-8?B?TEkrT1F3c0NTM2tjQTFqS0VCSzg0STJMTDQzeWJWZmpub1c4NFdaSVN3S3Zh?=
 =?utf-8?B?UlVWcW9oTDdDWm9hcUV6YjZnTXN5OGZDVVMyNGhFR3g2TFVJR1dkVE1OWmY1?=
 =?utf-8?B?aU5lVnUrVFJibzZ5VUFEV0JsN0JDZG1NZExCTEcxQWxUUXRoVVMyR0xOQjZS?=
 =?utf-8?B?dVhxaUxicWkzQ0ZJT2dPa2lqRlNkWWVBdkxCbC9yYzducXR6a09ETTFqUjE4?=
 =?utf-8?B?TjVFNnYzYmUvenNwMjlpRHlBZ2hrdmQwcXd6dm9GWjBSSWNIeDRvNDhnQ3Fi?=
 =?utf-8?B?VTlQZTJjOGRsVnRNVWxqa0cwWVN0alNSbWo0SkNjUi82cUtJSkFRUGUyMTZN?=
 =?utf-8?B?SXE4T3NtMDhGUkVXck9hMU1ubG9IWUkwMXBwREZlTStGWndvckJtSnNaLzBr?=
 =?utf-8?B?MGZRS3NRZkpyemtMdTZPdGYxV1JsRTgwa3JudXE1TTEyM1plSXRZcE45eUlB?=
 =?utf-8?B?ZW9TeGVuTE81RUVIaWVFSlpZbTJqVHUyaGtLRWZBOVRzc2V5U25JdkJsYllH?=
 =?utf-8?B?Z245Y1Z2OHpaelFkTWFtMVJZc1JqbElIVk5mVmlGSmJTZzBnRHlsdWhRQXQ3?=
 =?utf-8?B?SEFQWEJEYmlJcloweFlqdjBZWFA5ekpmUThJRXRKeVBMR04zWWVmOThpa1M2?=
 =?utf-8?B?ZFI3dVA3TWFURzZKL0dZK3NtZS9QbmV3MlJ0OFVQY3ZleWFFbFJWMEpuYy9D?=
 =?utf-8?B?MTlHNjhDNlEwbFpBR0t0anNBSnBEK2R0amhBanZERDdoekFrZ3lTSmRjbmR0?=
 =?utf-8?B?RTU3ekVQSDRkdVlmVW1hOWpYQndEMEdCWjdiTVlIU2tVN0ZTVWkySmFWS2c5?=
 =?utf-8?B?c244RFlDOG5iZTRqZlBVMVhsUGJoNGFaaElOd1Z2bVdvU3dTMzNkZmJGc0E1?=
 =?utf-8?B?K3lGa0hvRFFJclY4ZFRMQi81V1plOFJhMzg2UUkzVDBNZFY4VUZXTFJaUStT?=
 =?utf-8?B?TzhCK2d1b01TYkVJT1M4RktvSloreXQ0aHcxUUFPUjIzRkVCRlE1eXM2dXFW?=
 =?utf-8?B?ZG95ZTlNTGNFNlNwa2xmMzlKRUZzUzA5ZGJCOEJSL1ZlMVNGNnh1OWxvdnYx?=
 =?utf-8?B?WlhTdVpCVm8zWGpSSk05NDRTMlRUVXNCMGdqQ1l5ZUR4Ry81aE5RR1N1NTBY?=
 =?utf-8?B?Q0RDVE1qMWlxQzVXUHh0ZWlKOTZhZlFzRExUcTFCR3pGUDVySE8wYTR4UE9l?=
 =?utf-8?B?eWgwV2wrYWFLMTRqbytaUVJrQkJlYVVlOXRRQ3J2amlhSFpBT1EvNDNSYUQz?=
 =?utf-8?B?Z3FYcWowSlFxYlFTZUpHOXk1eXhCSXFsWkNQcmxwbmNmc25YbjN5ZnUrNzda?=
 =?utf-8?B?YzZFZU9ZM0dNZUswTE5ULzBmZmVxamg5Y0NnL0dNamhGb3NoMlRiT2xic0xD?=
 =?utf-8?B?ZVJCcjdEblN5Skdqa2EybG5aTzdsVkU3eUp1Mi9EYy9Ca2pzN2NieHVUUk0r?=
 =?utf-8?B?Yjh3RmE1Ny84NnI3eWtpY1hZYSt3MEhCVHB4ajd5dCtGN21ZZ092Y3QxbGpX?=
 =?utf-8?B?cVN5YVJyMHRJenVZb2NPSmZLaUlMM3lJcFBoSFF0alA0b1J5SjM5R3FtOEtJ?=
 =?utf-8?B?WlF1eVNHVWpBa1R5YlNCK0ZvZFdXUTNUMmNlUXptRjc3bmJNWnU3S2duR3Nk?=
 =?utf-8?Q?COllyx69DEsIxre1PsyDGERDd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e58c7f-640c-4baa-0d69-08daf49de4b1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 13:07:01.3010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWSgOZAgCrHs5c8G2pjLDKEjcmIgLkgoQs6jVebJWzeSpNxXZ5QQEehsEt7h6jIi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122
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
Cc: Martin Krastev <krastevm@vmware.com>,
 "Amaranath.Somalapuram@amd.com" <Amaranath.Somalapuram@amd.com>,
 Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.23 um 13:11 schrieb Zack Rusin:
> On Thu, 2023-01-12 at 08:01 +0100, Christian König wrote:
>> !! External Email
>>
>> Am 11.01.23 um 18:50 schrieb Zack Rusin:
>>> From: Zack Rusin <zackr@vmware.com>
>>>
>>> The branch is explicitly taken if ttm == NULL which means that to avoid
>>> a null pointer reference the ttm object can not be used inside. Switch
>>> back to dst_mem to avoid kernel oops'es.
>>>
>>> This fixes kernel oops'es with any buffer objects which don't have ttm_tt,
>>> e.g. with vram based screen objects on vmwgfx.
>>>
>>> Signed-off-by: Zack Rusin <zackr@vmware.com>
>>> Fixes: e3c92eb4a84f ("drm/ttm: rework on ttm_resource to use size_t type")
>>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Should I push it to drm-misc-fixes?
> If you're not too busy that'd be great. Otherwise I can do it tomorrow.

Done.

>
> z

