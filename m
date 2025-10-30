Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDFC21695
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 18:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCD210E30E;
	Thu, 30 Oct 2025 17:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RQ8kvLVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013071.outbound.protection.outlook.com
 [40.93.196.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF4410E30C;
 Thu, 30 Oct 2025 17:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgBeoOzSDpk16gM9PHmWUXQUCi01oyjZ5e/FHZL9mIr78/VXnRh7a9JH7yY1kM6QNhta2gBM0BjOEc52EFDxz/EuNqq7UI5kEFOraSSABvfK48/lFNWjp7rXGiNRu1jTegDXAnTQogd+VXuyLJ2QDjVXkqrseP1sLzTjsYhMY6sT/S7hltAZENDVpx//u3VuC8HfqmBD0IjrZ/LLG1XOYe9X1f2FgAr8x82D2mODGOsdf1IiCP8wXxBgAKHFApGPYPF2CRR1H6tFnG20hacAZnElcNZe6Tm6c12HLaHy6SEa5tBE1a25YgEmyvqKRvVYxc0kxbYif72YyvcrmwTgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2U3TlVpEKTbXDeUwsI713q6S0HujmKlHdtPHkXE1hc=;
 b=M7MkbOpcGoE6GoNKbda6jaC7P6rSzAiABjmGl2g1oo41e8rgrdyuU5RRsB+y/2JuaOF9GB+dWnprYlOAL3hQ+D15jnK+k29tsK+LNk1gOdseKUITSyY9qpIOoiSXnngLjLLmwKEFj1uxtCpAwTPlSqALyYJdhQAS011jbd7/p9mZmwp37cuc9IzxFz0mK8mVFVocqy2bJLCOKvxAELfKYFAaYkdfYDXkooeqGuBp1bBlAssO85UoBidLjhbE2aBMA+harjoR4tWiRxZSsYLsI+B0gsMCNJxqjslvp+vOA9DEnARdwhCYi4M4KWyreA5X89iqPzob+kQFcu1FHRzyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2U3TlVpEKTbXDeUwsI713q6S0HujmKlHdtPHkXE1hc=;
 b=RQ8kvLVFs/pm/CyIqUjNuTITITs4k2vJ/YTykoTEkXUtYLLYrhDx2+bE3cBhqdOUy46+3PEGsMbtnOumJ2mZWXxDAD+jm2+tP5Z9wJGeOBdEu8slyly1Lebwn1DW1IUlRkg12VA7+hYq4iS7LI07+JF7uM04GBIYnT/QlUO7SQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 30 Oct
 2025 17:14:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 17:14:23 +0000
Message-ID: <813d07f7-b430-4c95-bac3-931188415593@amd.com>
Date: Thu, 30 Oct 2025 18:14:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/amdgpu: replace use of system_unbound_wq with
 system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-2-marco.crivellari@suse.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251030161011.282924-2-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d929795-1a2f-402d-c86a-08de17d7c550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Lzc2YnZmc3czdUpCYlI5bHdGNDFMdjFYRlVYcHlDQVl1c09ZY3V0THJvNlJ6?=
 =?utf-8?B?ZTJ2UnRvTmg3OFRtR3pXajkzakoxb0dXMzZXYmFQdks4M29NRzd3UDNZV1BG?=
 =?utf-8?B?MktNcFByM1BOSUkrZHVaUElCbzN0RGhoY2lQZE82MEJMKzQ4Wlpoakg0bnBC?=
 =?utf-8?B?WUc2dVNseE1XTkMxTEh3WE5oZHlOSVdXdG5mdmNvZEowejZ0aE9Yb3czdHps?=
 =?utf-8?B?d2hQQnhYb2dYU3J1VHliNTQ3WUQ4Ui9OUFlta2xSeHNpR1ZDaUNPaU4yL1Ex?=
 =?utf-8?B?WHdvb0NvTkFSUjZ5NXd4K205SlUyWFpkZmlWaXpTdFpIT0J6M2lMaFNnU1FX?=
 =?utf-8?B?VWJRQTVmU2dCM0JUUnRRWHVmcVNDM1E5UFhwaWxWYlBqK0lZb3k3NURkRlRT?=
 =?utf-8?B?Z0dwZjc0U3RZbXJYSHE5alNWZGYwZDFVY002VlkrNk1YVG5PUHYyZFFsYnJF?=
 =?utf-8?B?N0VSanJqWkRTMGpnb2tMU2hWbGdQb2o1aUYyYS9PdmIyQ0xiNTZwSTF5UTE1?=
 =?utf-8?B?WFVOMXA2cGRRWDdHWXlVRy9ueGZqb2RYVW5VNWVhMFRnaTN6czRrVTdoVk0v?=
 =?utf-8?B?bEtNaFM4a3pOREVIdmpmbkt0eS8yTXNkaWJidG9YK2F5eWd0a2NMTWFDNitE?=
 =?utf-8?B?VzByNmJaZ0pYR0JRK1NOZXN1Y2tnWk5kZE1ta3hkZzNhMkw2V1JnVlpZT1Bh?=
 =?utf-8?B?M1pZNnBBVEJmVUZLalpqTFIrTFFNcTFWSnkxQWpaSG9ZbC9aTnBlYlkxSElt?=
 =?utf-8?B?cktQN1dzNU5nRDRBamlFeTJmSk00Smc2UW1wazBRTlVPVWlLWDViZXA0Vk1V?=
 =?utf-8?B?K0IzeXg5SXJqejZ5MkxGU1laQzZWVC9vQTBxdzZvRTZVSHVlTGNpWTIzTkp3?=
 =?utf-8?B?eFZJOHVSSXQ0SVFTUXlaRDU3NWRuV2liOTBRbE8wVEZXWjJjU3VmQUlaUlJ1?=
 =?utf-8?B?VWtyZHFYQ1c0K3Z1ZDNSQ1VRdW9UbWdaQmJ2a08vczVycWxkN1BOMS9hbXZy?=
 =?utf-8?B?RkRxNDVQLzNxcWxBOXkzOTQzcUVBVWhJVHZyVkJqV3hDMnZkdXRQcmhiN3pE?=
 =?utf-8?B?ZmJ0OXh4N0ozSEh1dkFnNHFBZEV1UnptczJSK1RldDY3eDI5YkZVWVo4SEk5?=
 =?utf-8?B?eFYxaVlGWjVmVTZsazJLOEhhaHBZTnVLcDUwSzE3VEZsN2RXbi8yUWlKL0Fv?=
 =?utf-8?B?M0VuNisrMFdySkNDM3pkWS9zK0p3blJCbVY1U0Q3R0dPTW84dVdGaDNiL2xr?=
 =?utf-8?B?QlpyNjV4dUNXKytnd0hzYlU5UURGUkYweEhaMVU1S1JUQXh0S1FkUWg1QVh4?=
 =?utf-8?B?WjYyY3o4cDkzeWRPTzBOeGdmcVJ0ay93SWpVbG15Y1ducWliUnZJRVZnRGR5?=
 =?utf-8?B?ZTZjTEQ3TnhUcUtQbW1ObmlwK3RuU2tTZi9PdWJWVE5yL3pjbWJUS2prTTI1?=
 =?utf-8?B?azlWSGVqbUhsMkRWcG9xejlMdHFRV3JHd2U2T3R5WlpuZUNDZ25yRFhweUpt?=
 =?utf-8?B?aDlwd2w2ZUNuQlc0T05UN0RvSEp1ZWZHWE9nVDR0MEFldW0rNnJoTExMY2c4?=
 =?utf-8?B?MXZpYmluUVBMSHRqa01UbkloTDBGUjRBbFNCK0QrYW95TDNEL095VGhQVXhD?=
 =?utf-8?B?c2lFZ05xS2lHMGV6RzVjZzZNbXNsNmQ0Yjc3aEZmWVpxVTM0aDhqYmhwQ1pL?=
 =?utf-8?B?QVc4RE16blVHbVRiUmpaZVloMVF1SnAwOEU1Y2wzWWdzeGxBckVIZzhzTEZk?=
 =?utf-8?B?RW9kMWxUYnQzUGx1a2hqa29aMXpsYnRtdGc3dTUzRmIxQ3h1bzl1aGYzYWxp?=
 =?utf-8?B?Yjk3Y05CVnRCWVdJY1JsMEJTQk9xeWt2bWJwMmtQajBvYmdEMy9YT0tkMlhU?=
 =?utf-8?B?Qk9mV1dYUERRY2VRNFhWSXJQRUx5SUY5Uzh2T2lMaXo3Zk5LNW1BbVN0VGc1?=
 =?utf-8?Q?tDKByOh6cEjokS4eLYVRfEmORCMfG/84?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjUyT3pNbVREZnh5MTBWYnhSTFU1YzhTalJSbUNyS1dtbDI4bXJuaDkrOTNz?=
 =?utf-8?B?YlhJbFp6VVpnZUFreENuUHlaV2FScHJBZkhCdUtiZW1qejFuaTdpL2tIL056?=
 =?utf-8?B?dEJxMFFDSlFSTzU0NytjdVJrSTBQaDhiYzI2b0tRVVprUm8zcHpnOHQ1eTU4?=
 =?utf-8?B?N0dRMGZsbE80RFVDd1pKaTlqNG1wRjBwUndKaGlQTVJLL2VzeldZMWpSYVZu?=
 =?utf-8?B?TThxTWZVU2hFUjF4QjhvR1BnZTEyNU45WDd2SXRnRVZxdUNHR0dmZnkwK1hq?=
 =?utf-8?B?M256Smh1dzBwUmVBS243MmlpcUJwM1dpV1hkZXkrZW8rbUFOVnVXQjlXb3F6?=
 =?utf-8?B?SjdNc0R0ODJ1SGgrNHo2SVdjLzFyYVU1czc4bnZrbXNCM292azRqeFBwMy9J?=
 =?utf-8?B?ME1pSUUxNTJ2dGxYWFBuOVhYU3dhWmlSYnJRK1JqcXUwWmY3UnBDOVVYOE8w?=
 =?utf-8?B?Y05ZWXBFM1Q5b3RDTFUveGVIUUJ1V1hXelN3MXZDRWdZYnIrTFpkWGNGR0kv?=
 =?utf-8?B?UUhoTlM3Z2xQZUJDc1l0S2NDa281Rzd3aXRjR2JSc0VHbXVZNUVVTG5KejUw?=
 =?utf-8?B?L2RLMGI5K3lNY004Mm5sV3JieVBUSGdlU1NJZ0xKeC9kK0pSTDBENW1DOTdn?=
 =?utf-8?B?eGh6WDVwQ1pTWEQ3OHZYamppaE10blNHNzMwMXNORExRbW9qL2prQzBrU3p6?=
 =?utf-8?B?MGY3c0FJc0NlMGQvck9mWjVIY1B3T2ZWL3F1QVJDU1dtdVBOdEtoeTVRY0Nv?=
 =?utf-8?B?ZjNucHcxV0FmY2hnekg1bURvWVY0dVRzWXhGMkMzY2dPRGJaVGM5ZHRXSEpa?=
 =?utf-8?B?dU1PM0poYTBkM1JaMmlqaFdLY1dVcEtBR2ZSM2hkK0V6cmtEa0dwUDYxaDNl?=
 =?utf-8?B?dzh3RThTOVRuWkFSK1dWaGdRdnBJaittbWJ4WHl3WTFOUHR4MUsrN3A1VnR5?=
 =?utf-8?B?RjhXTDRkZ2xoOFBiQ3daNk91WkwxaVlBTVlUWDFXTG9iMTcxUXAvdUQ2QTd3?=
 =?utf-8?B?blNMa0FmUzNWdW5hL21CZGEzTFZZMC8yRFd1SHlDWGVKMGlQRWFHNXNvdFhL?=
 =?utf-8?B?WTZ1dnB2bXBvWEVEblZLLzdibDN0Wk1uRXJvVzdyZGdEWENGclB3T09Fd0VP?=
 =?utf-8?B?SnR2bStiN21kUU55WVdJMzFMMHpkM3NSUEpPN2tubDc4V3l3ZE0zSVhMTVIw?=
 =?utf-8?B?WG9RQlUvMDhCditrZ1k2S0Y0RGxXQ282eFBLVU9jQTRhckxFZVlzSWRkM2o3?=
 =?utf-8?B?U0ViblFmRjN1bmdWTE9QVjZEM1Z5UUVTdmtRditZbEdnc3FndFhsSGlOa09t?=
 =?utf-8?B?WHlBZWtLcy9mWnlFd0E5NldBQ1JCYi8vem1wV3FtcXdaai84RUhqYlJlMERY?=
 =?utf-8?B?T3ZzSHlycEdpNlUraWk3anZZNzZYVGg3OTNramt1Y2ZWV3hxRld4V2pxWW83?=
 =?utf-8?B?OUttaUlNNFdlWVk2WmkrbVhXUUxsL09QbTU0MVBwU2dxV0tycWNqUFg4eXAr?=
 =?utf-8?B?S2N4SWdidDE2a0tTeDkzRGRkZHJtaWJQSDN2M21wakVQM1ZYTlRPUXMwT3cr?=
 =?utf-8?B?K1o1UWljK3JpMUpLZDVPd1VtZE9uaktveDlGS0tWT1pzNFl0bE9WdksxODhn?=
 =?utf-8?B?anI1QnVnSmxJQUNRRmUvYkw3MHVheEJxdkd1Z0pkUG55N0hrZHEySUpqdkJa?=
 =?utf-8?B?V3VmaHdzZmdKN0xaUzQwZE93WnhKUDhVM1Vpb3pEM1JuQXlKY1RSUHhTeDJ0?=
 =?utf-8?B?TDRoMEJCSlhtRWl5N3djTjRVSzNJQjlLdXFma1dCWTJ3K0NwV0ozZ0F2WENa?=
 =?utf-8?B?dkFSenZZNmJ6NkQyY2kwRnJtVSs0SWl5YXZLbGh3eUJYakozelhjZ24wc1R1?=
 =?utf-8?B?VkdtUkc5YXhPSDBCR3YrT1JKVXZGVDJtTGJhbUhNLzlIQ2NiVjRldXdGVkVy?=
 =?utf-8?B?OEdjY2NQWWxrVlZoeDVIOU1iR1VLQlNWWTUwQkVlNlhLcmRUbWRJWk1iUFlY?=
 =?utf-8?B?NWI1QUwwWGtYbkJPOU13RFNINE1WbXVzS2RyUFozcHpjaU5DamRFY0dxRVVW?=
 =?utf-8?B?VDJJSnlibFJpc2VyNTZvd2JBM3VwaVlBVkV6OCtPeDRHU0o3Zkk4TXRqbFhP?=
 =?utf-8?Q?EJSeJEyFyekE0cpUC9rYA4pZx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d929795-1a2f-402d-c86a-08de17d7c550
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 17:14:23.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODb02Ebgot1pBpvAC51loVXA6DgGK0zwFIwtvD9WAEsrgSrXS6+MWK1lrQjudKx6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403
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

On 10/30/25 17:10, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> Adding system_dfl_wq to encourage its use when unbound work should be used.
> 
> The old system_unbound_wq will be kept for a few release cycles.

In all the cases below we actually want the work to run on a different CPU than the current one.

So using system_unbound_wq seems to be more appropriate.

Regards,
Christian.

> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
> index 9569dc16dd3d..7957e6c4c416 100644
> --- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
> @@ -175,7 +175,7 @@ aldebaran_mode2_perform_reset(struct amdgpu_reset_control *reset_ctl,
>  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
>  		/* For XGMI run all resets in parallel to speed up the process */
>  		if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
> -			if (!queue_work(system_unbound_wq,
> +			if (!queue_work(system_dfl_wq,
>  					&tmp_adev->reset_cntl->reset_work))
>  				r = -EALREADY;
>  		} else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7a899fb4de29..8c4d79f6c14f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6033,7 +6033,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>  		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
>  			/* For XGMI run all resets in parallel to speed up the process */
>  			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
> -				if (!queue_work(system_unbound_wq,
> +				if (!queue_work(system_dfl_wq,
>  						&tmp_adev->xgmi_reset_work))
>  					r = -EALREADY;
>  			} else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 28c4ad62f50e..9c4631608526 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -116,7 +116,7 @@ static int amdgpu_reset_xgmi_reset_on_init_perform_reset(
>  	/* Mode1 reset needs to be triggered on all devices together */
>  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
>  		/* For XGMI run all resets in parallel to speed up the process */
> -		if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
> +		if (!queue_work(system_dfl_wq, &tmp_adev->xgmi_reset_work))
>  			r = -EALREADY;
>  		if (r) {
>  			dev_err(tmp_adev->dev,

