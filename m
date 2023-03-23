Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3B6C7190
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 21:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400DC10E12A;
	Thu, 23 Mar 2023 20:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4610610E12A;
 Thu, 23 Mar 2023 20:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKaIdtlVViNHRkuaS2jawS+YhUjcGxaXPlP+Qwm1vfgsfq99xtcEBWJr3K6Oj7jqGKsRbplH8ZlVsDDhbeHILvVoIyWuVrda+/0mOTD5HS7dPFxMLfzulUn/IZ1wfrt4GJaIW1hKBRRYF3nV5zGOmokXH7IWXrl9y6B0jp1+8X3WXyFsuC2suoJAobxmuzHj11Lr3z/6DbYfuuYdZGM4sLgZZ0jNa6xYXzbALWyxh7WznRLDl6dMXjAMkee1evj3i2whlVTOVil1EwaF+JbQViTzOTO4mWIXoT9UjHMYRceJluG4HpbrOH7qBtQMWBCGTPJDgYY80YdL57VKrV135Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFrToIpy+KAnPSi5ZLe3CT9266/W2xrkFOvMs6s9qPY=;
 b=YxvcuBDiItwM2vov0u6pmS0ysMyQJZao8z4/h+6HgUyX4Xo+uHSIrk5Kwdwvn9ZWs+qtsGWrkm8lYrvyc+4QSfx3t5Lk6g8WHa6bSPhRVE92FH9dpBmgZp7Ogug2z2UePBGxCVHIP575V3HoRLWXAbo0tttm+xlsbrsZRsU2nTLjM8lA6ogEHvjJN9phMwHUumxDzCAdGuiywEIL1p58+64uAvKDcnfJjRf0RQn41D+k1JiE6eqrATz9fCF39CE1k1F5Vxuir3GGfwEVfGIILkrWmky761vH89QF+iwdzuFNHM9Kw6uaPr9SYSq2yL/0QnnfkDeZGHR2K7+PCdp7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFrToIpy+KAnPSi5ZLe3CT9266/W2xrkFOvMs6s9qPY=;
 b=vzyPopwIXAPgI87WDCmnCKCjR6a4rxHb+Armfl9bDYSo35C8lU9i+3TXBJbl0F6D/t111nQmfz8USSyQb07KJqcG/wCfONbho2NrjerZ1uA7j3QhfudykLlrf/o+K60SeBe65yP3tFqvYPsbwsmHIMAL+lTJzPirPyOIjWS+qec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7940.namprd12.prod.outlook.com (2603:10b6:510:275::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 20:08:05 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 20:08:05 +0000
Message-ID: <9f86c158-5867-c909-2f62-57cac87364a5@amd.com>
Date: Thu, 23 Mar 2023 16:08:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/32] drm/amdkfd: prepare per-process debug enable and
 disable
Content-Language: en-US
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-4-jonathan.kim@amd.com>
 <79fb9204-8544-e681-a2cf-517252d381e8@amd.com>
 <CY8PR12MB74359129C880C6CC44C6866C85879@CY8PR12MB7435.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <CY8PR12MB74359129C880C6CC44C6866C85879@CY8PR12MB7435.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: ce14f409-693f-4ad3-0c82-08db2bda504b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKp8XlCWpCfn/+ua6Wk/3E0RV4CJJpNCZ02IGzEn546JFAQgpkzvSUJvoMdMpW1q1wxicU4VQxKnKYEeg7EXzXb9RHW8AyVELkuvwdZ8NFDYCitKoVw7yx2PGAAv83QEst8i8q6ViLRSWupKDyQ91iGqhWdBc+0qzbTPp65l4xTwdBT3LivrrkZ/FdIZLAYW16AJ18WVS2i8qw/eFZUdxY3OFc6q8YJMPBXCaaW1619ZaK4X7G6QYRc/nojne1zeWbxDYcdXGb9ZKp9M8EPaIXwQyScEF6yDqTgY7oJ6tnTzDA1HPuYMWHsJ0GbVpZszm4d7UUyXN6Wm6VZxJ5mEBwlk9cqepCNAB3qE3QARDSlGhgeTZhq3CzbgSaIkOuXZq/Z298c9NcvCsW/uA16+y5126gcyD73zp6OL96HyzuhB8v4UzXQl0RDMdsOGSfwM9b3TrLgaINbnwsjzAfEpOlKE5lC1YvdekQCjGtIoIClaOJDFs6VUdhl84hT49lIcpPfe29ATK/eMsUVwCnNAcm8GNdVajtfRPhdEjzv+mACLqhbmxSeUYT+U5Ca12nf0vLkuVGv30XCO/jQpp8YZ4ZdsGIqeJqcZdE5h+TE7v8xLhn7kuQXUoZv92Ko5erKEh4IqczG+opuKYtaJQilVuYmDTJNTJlcBPDZS9UTPjBH8JfMsRzHQ+CyaJCqkPE7Kl1nLrf0EU+nXhM81abU4Sby9zi8OIDft1xJq+dR/5ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(478600001)(450100002)(6486002)(2616005)(186003)(6512007)(6506007)(26005)(8676002)(66556008)(66476007)(66946007)(41300700001)(110136005)(316002)(2906002)(44832011)(8936002)(5660300002)(36756003)(4744005)(31696002)(38100700002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENTSFFTWnJXVmwxcG5HNTVmMWVuTGhmSDJrNGlRRDkrWFRpOElDU2F1YUg0?=
 =?utf-8?B?RkNGTU1MNU0wK01VODV5MS9MSWp1TGs2VlFjQnRLeGloT1dKVzA4ekkxbWtZ?=
 =?utf-8?B?dkljY0FaWjJJQzFTRmJRTGV4UzVPa0gvVVZpV2hRWG9PK21ScTUxTm5TVXNx?=
 =?utf-8?B?WVVjREJaSllkV3h5bC9qTkU1bmVQYTB0TkZxWHNkaFo1TVFqWmlYWHk5TUVF?=
 =?utf-8?B?K0hZaVFqbVV3MEZtR3FjMkpqam1YM3FOZDNWRFEzd0hnZVU0N2FJUWlBL0Jn?=
 =?utf-8?B?dlQyNVd0azAva2hCbnBhS0hLMWtKV1JLSU9qTWZKQWlKTFk1ako0TGJOTHhK?=
 =?utf-8?B?dTQrRUxrTkV0K1ZXSXlDNlRDVGwvbHFwY0NpeUJjcGI4cjNTSm01eVFRZDFz?=
 =?utf-8?B?ZHJwYlRJcnRQMUJUUUxtMVpJWHhWN1RaZnhDVXo4eFRSOGJOc1ZYR1l3aU5M?=
 =?utf-8?B?Q2FUb2dhbVhhS1o4NDQyQ2JDVmIybUQ3ZjhpaDQwMUdYTk1HY2drVlZUWWJZ?=
 =?utf-8?B?aEJFcG54bDFmNzNiZVBVV3JtN1NTOE85bWdpREM2eG43THFqQlNoVWc0Ykxi?=
 =?utf-8?B?eDRqRDFNTFBhbTBRSmxQSWdNbGJxVHErdmh3MGZuRXpLQWpYMDRVSE5oREhj?=
 =?utf-8?B?aERlK25XQ0ZIK0JCa0xqZ28wLzdNZStYTE91dy9DUlhjbDd2QTgvd2hEaHJ3?=
 =?utf-8?B?ai8rU1BENWR0ek96N3ZvSExBVUR2N2ZVSXdiVkE4Y2U0ODBON21rYTg4aWVp?=
 =?utf-8?B?eHRwclM0cDhKcW5welZjdkRyd2xHcEgzWWlpd0NDZEJhSmFGUDJJdlFXWGl1?=
 =?utf-8?B?Yytnb1NHZzEwUDVWSU9Xd0xqK3BWSUdPZ3VWbFhmUHBYc1RTYUdrYmhheGRq?=
 =?utf-8?B?V3Y3R0dTV1pwRXg4ZktJY1lLOElqdDF0Sm5UaFd3eEtQd1ExK0hWRnQrRHJm?=
 =?utf-8?B?YU11UllMckZ1REkwNHBEOUdTUEFPOGIwMXY3c2ZuOUtiQmtDTmR1cEU3UFR3?=
 =?utf-8?B?TE1PVTVPTFBFZEJveHFzZUMxM2I4Vm1RRUNZUVZxK1dvZnB0TTYveC9rZU5H?=
 =?utf-8?B?RXlOWStmRE4vb3NTdzBibndERDhtYnJUbkoyMHQraDhjTTRacTExQmVGV0dO?=
 =?utf-8?B?QU5iaG5ZcUpRM3V3TFlHRHNyemdHUldrRmswMGQwSGd3c1JzdnpNaXhqdVJw?=
 =?utf-8?B?M1RKYUE3L3F2b3BUdWRGZmVoUHY0THBUd0V2VjlPcUdzOENuSzl0NDFjYkRu?=
 =?utf-8?B?MFc3TUtqbXpENjdNYlBiaFlqSWdweU1VQjZRMWt4V0tGd1B2UWZIS0xiWTFu?=
 =?utf-8?B?azcxOEJIYXR2Kys2bWxMMkgzT3Y3UEZ0aG5oc3llZk5YREE4K0hNRDViRnA3?=
 =?utf-8?B?d0ZUdEltUk5QS251bW9MdDZLbElkbm1JcUg3YUZRUHgxc2tzd2ZoemU3dnNO?=
 =?utf-8?B?V0o2THhnSUNzWk0vL2k3Wm81UEVybFZZTEpjSGkvK2xTWm53RWNPbG9INWFt?=
 =?utf-8?B?RTc4V29mb3Nva2tFZTRuQ2hYTlRIUVd0UHV0cEU5SndwZ2Y4K3AzQ2FoNVJD?=
 =?utf-8?B?M3FRUThIZFZTbmlPcHlhRnk0aFBxWDZSa2kyWFA1SjlnM2xhdk1NcTBtVjYz?=
 =?utf-8?B?WkU1UlE5NENhUzFic2M3ZVBrSFc3UHZSOVprSWJzdVNzeGVwdjZqOUJXbUdR?=
 =?utf-8?B?dEMvRWE4bDFQSVJDRnlGak4xd3o3Ri9adWF0bUJrbW1HNEJpMWRyVVd3UmRu?=
 =?utf-8?B?V1hZa1NXL2J0YTA0bmwrUUZoVlFLSVEzR1NXa3lNMGh4TEltTnZUU2VvM3ZT?=
 =?utf-8?B?Y20vdE41emtlVkRxWG9mU2ZQaUhaeGJ2UVR3RnRscFZLSk0zN1BPeWhIMG1V?=
 =?utf-8?B?c3BJZmxGTW40T1gxZ2U0MmQ0QUhYYVVCa1JDb1RkR2dhRHcvMnRVZVVTOEVQ?=
 =?utf-8?B?bjNCckhjVWZxcUwvcWZNY01pSWs3dDRZa3FRUUpQSGRqS3VEQWo5ZURDN1BN?=
 =?utf-8?B?Q3UwdXR5cnY5UmxKTVo4SXYrWUJ5V29YdjRQSEtoLzZOQzZQUUJnd3N3RGt2?=
 =?utf-8?B?Rld5S0MwKzg3WWpTbk9XVFFpR0lKb1RCRmNiYmNwdFFqK1RuRWtYMlFiUEZV?=
 =?utf-8?Q?CnTWaLD9N1dVoY20gHyXQebju?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce14f409-693f-4ad3-0c82-08db2bda504b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 20:08:05.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+oD2lmKh5KLWqr0swu44xZ0leqjGFTiQFJVkcP9S3CzkDPSKUs8xAJo2Jt4RlazdLLaMd22DqUeW5pllnSCJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7940
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

Sorry, I think that was just a stray comment that I messed up while 
editing my response. You can ignore it.

Regards,
   Felix


Am 2023-03-23 um 15:12 schrieb Kim, Jonathan:
>>> index c06ada0844ba..a2ac98d06e71 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> @@ -979,6 +979,14 @@ static int evict_process_queues_cpsch(struct
>> device_queue_manager *dqm,
>>>              goto out;
>>>
>>>      pdd = qpd_to_pdd(qpd);
>>> +
>>> +   /* The debugger creates processes that temporarily have not
>> acquired
>>> +    * all VMs for all devices and has no VMs itself.
>>> +    * Skip queue eviction on process eviction.
>>> +    */
>>> +   if (!pdd->drm_priv)
>>> +           goto out;
>>> +
>> This should be before qpd->
> Sorry I didn't quite catch what you were saying here (did your comment get cutoff?).
> Did you mean the pdd->drm_priv check needs to go before the if (qpd->evicted++ > 0) /* already evicted, do nothing */ check?
>
> Thanks,
>
> Jon
>
