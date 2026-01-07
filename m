Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA77CFB68B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E403210E553;
	Wed,  7 Jan 2026 00:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ky+G455u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013001.outbound.protection.outlook.com
 [40.93.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C02010E54B;
 Wed,  7 Jan 2026 00:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmmBo/abYZa1MrD30nKHsszppipvGK9V0bsUQ3AArW3w5tROn8atmJUVLijlwodWc0FwJ5QaCa1+Jat7P2PT9xM8aPVcK7sx/lmRwlOm908BavfGB8w3hOhndgQ91cbrgOyU4U7gcXGJB/7Jth0WDSmI52TmrJAqHm2GjfNI49V4ncU6IvesT75jdwzC8Lqe+EvOXj3AtmhrgWy+MoL7UhERlBVOEqkOEFsP4J0OmhPN6wItNUeh2FkqYDR3lcwhPBJ7Z+YQLNwFu6u8+iJvhDo/j4z07iISkeXWD2rQ9A7AdZZH5o+1qGm8fx1fZ+ord0xBaEt2ZcysWXKxiBkYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndoBb9bOUW6/whGrJ/duVvI1CRoy23PbY6ns3vDiVZE=;
 b=e+OvitjA+GUYHpw+fXIk/Q253XNrasx6S/0XbOFjnSj4RS+Uh7lvJVKGWPWvxvigAdJopdZNiwasOanpkSoz45DQLn/+EFDqeu6XVu24b6Mt6PrD0LS7qk3AJiQfKiFTW8BSOCVSzd7xpojwEzirslTvDS4EcIC+4jHFQyMDCW5zUNQ9XToaTHqPxfhjPCOBxiuZpM5WzdyO7NcG2Bv9w8ml04vFwxJ9FyLt55+3DW+Vk8YMSBpwMW9M7BD5+sRoTYQ8Aw1/6awu3mM7lahr4Ya9aZDbX+1IPr4dV65EcY4NIe/yeAEfidJT4/7/zr9CKxI1WJIUXNVBd12YqhfLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndoBb9bOUW6/whGrJ/duVvI1CRoy23PbY6ns3vDiVZE=;
 b=Ky+G455uAIbSjF3J2VMZhue/ZgK4bNWuAWlMJkF0v4m8Suz/iDvRhWNLJKLrDWZy9r/777YSHGnM6xWwKm2EYt7dVdncwm5NB+tHybG/uJ4VhCytIzE5+nPJnY1ZKmTVAo7f3xsuj4xevOzg3eSUj1SqIQD7zVvv00hZQK7aWUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:04:13 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:04:13 +0000
Message-ID: <5c35233d-d873-4a72-946f-0d3772cbcd89@amd.com>
Date: Tue, 6 Jan 2026 17:04:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] drm/vkms: Hook up colorop destroy helper for plane
 pipelines
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-9-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-9-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3cc46d-2094-4721-e2ec-08de4d804a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjQ0SmNlcFZjSHR2MVdQYk8xLzdPQW04WS9hc256VVBFUnpJNGJuZVVDbGhh?=
 =?utf-8?B?ZGljVVYwVXg4VWx3ZTF5SFU1b2FjYk5Pek9SSkpjSURydlNOOGxnNWJQS2sz?=
 =?utf-8?B?YlBQUGhTVFpPalpzNFAyaWhSYmNJVWRYTHhIQ0xEMEkybGxVbFlQNi9laCtM?=
 =?utf-8?B?bnkrYmc0MjcyeDN2S1pjdFZ4Snh0WE5XN3l4SGZiaFUxVVB4cmhvV3NGRXQy?=
 =?utf-8?B?SndQeURUSVRwTUtNb2JvcUJDa3pJaVNtczl4eHA5a2pkRnY4bjNsYlZXV3JI?=
 =?utf-8?B?SnlXZStmTmJPTnIrcEEwbnFKbDZEZ2ZSL3kvTDVUUnkxbU0wUXFBbFBEL2hv?=
 =?utf-8?B?dkxjSlJUZHNwVmtSeWtKaGtObWFLREVxL09NOVdqeHBYQ055YmQzcUk1dGRK?=
 =?utf-8?B?eE1VZXpSV1VDTDBqRlpwblFNcE12QmxiWDUydTUzaDdCRUZCK0tMNEk4bTA1?=
 =?utf-8?B?OFE4Ryt6SEk1YWdJbUd2ZTg0RWIrSWIxSXVLUnVhWTZrQis5SVgxbUdSeTlW?=
 =?utf-8?B?aS9GL05rUERGbkl2aHZLVFh3cnlJMk8wOVpSNUN0Q1Yvam1LeWlETWszWW1h?=
 =?utf-8?B?emVsa1A4ak5YdFVTMGpCdmtBVDJTYytqd2hBa0tSMnEwL1QyVFJ4TFF1cUZ4?=
 =?utf-8?B?Vmk5ZDU4YXBlQ2czTkxMVGljSXYvUFR5TkJ4RXBnR0tlcDZSbENUTFZ3bUJz?=
 =?utf-8?B?R3JwcFBUaEpEN1UyYWt0N0pOb2dwWEI0SDdCUEhWUERQVmUxQ2oyRXhRTkdF?=
 =?utf-8?B?M3Q5YlQxclFJdXBiU0tmenV1Wktnd1JkSmxSd3NoRDJtZ0JoSlloUDEwMm50?=
 =?utf-8?B?eUw0SDZqRVhZRU9rRk5VbmZnd2VxSk9DRjMwS3ZyYis0c0ljWmVLODFrcTVU?=
 =?utf-8?B?NkNHNUVNbUprckZmU1B1SmJzbXpvMXpRcGt2WDlZUC9XM0tGZE4wbkRzLzd4?=
 =?utf-8?B?d01TdlRGa3dqakltenZSdW9zUTN6OVJxc3czZVc5cm5qcmFKNXUwQlQ5dW9K?=
 =?utf-8?B?QkhTVHNtQ3RtTUhFOW9WcGhhem9idnVjWis0MWFGT08xWGZ6WmRwZHBvMVNT?=
 =?utf-8?B?NmdCU25weldBRTVrVW9sZktFK0hrOXJ5K2ZCVlpXdEtVK21DK2ZjcEJGaVdz?=
 =?utf-8?B?cVBJeUJTT2JoQWtwMm0rSGhGM1lWWnIxUmpaNUw1MEZBcjZ4bS9jdWJuUE5o?=
 =?utf-8?B?dWJSL0VZYUJqY044UXYwOFd2Yzl6UUdjcGJkbkJWWks0ZDJiNE5Sd3NFZXBD?=
 =?utf-8?B?cmhuNU93TGttSnVYM1VPRWRxWW8xSWpmR0hPd1JEWGUzQ2ZQSFBvSXFPMEt4?=
 =?utf-8?B?ZEdscTVRMUQzT1JLZ0ZoWW5ranNqQmw1NlRtVi9IYzBBWmpjWW9oSzlCRGJE?=
 =?utf-8?B?MkZqT095a3NOM0hTdlFOdkZXdGsyRVpIQmZ0MmdEWUNuTlZrVDVhUkFSeFN0?=
 =?utf-8?B?aUNCamQrajhDdkRxeTZBL0FxOHYxd1RVNkhJVHF2KzJtV2N5UzlsYS9VWFNi?=
 =?utf-8?B?NWpBamZnRzdsQVlHQlRYeFZFY0wzQi9LQm9iNlN0aVd0aWJ0N3BBQytiZWRS?=
 =?utf-8?B?RVErNzlkcXdNb21EeTRwT3oxL3JpQWEycDd6NHNVYjJUVm5uOVl5TjdLZ2I0?=
 =?utf-8?B?dllzckhCb3hpWlh6RHJNL1FzRTNZM2hHei9BVUd3eVRLY3dIL0VhSFZxSUpL?=
 =?utf-8?B?TzRIaW5vWUtpVUFoOTZJOXNwUlFGWTlrdzk4M2U0RDBsK2UrMGpJcVpGbVI2?=
 =?utf-8?B?V2Z0OUdkaklCeEdMRzFscEFnVit4UVNtYUt2QmdNZVBpYjZaQy9Da0F0UUg0?=
 =?utf-8?B?RG1LTFZaN2FON1h0Y0NNUkxac2J5R0RDeTd5LyszZnFLQjBld0ZzTnNWQUVv?=
 =?utf-8?B?WWxZRXk4MC9TS1Uzc1JLUytUVktjUDFMTmxJeWlLTFZrdDJiNVE3OFVjNjls?=
 =?utf-8?Q?UksjO4+06NqxkUHZ9z8etNbF6Rq8W0Nb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW5VekY2Tmx2YjZxalMwdllBSmYrWHZyTDZCQTJoTTVBTUJkRU44U2g2SVpR?=
 =?utf-8?B?ZWZYcEFPYzRLYmQwcHZkY0pmQmNjZS9tVVNrZ3ZRNkVwaGV1d0JWWWhZQzk4?=
 =?utf-8?B?RnphYlJTSUprQUtNY2tXdks2cGlNQ3QvODhDazVQRTlKNlJLc2M1cUFrcnFF?=
 =?utf-8?B?bFY2MDZpV0NGQTduMjJpOE1TL1JCelFXQnJjcjZnZ3BBSjg5d2FJencxd0c1?=
 =?utf-8?B?Qm1hcStLNTNIR0xwRFV5Tmpvb0MxbW8yQkNoL205K002a1Z5U0JPMHI5MEIz?=
 =?utf-8?B?ZFdOUDNwVXNLTHE5L3FxK3BKbmVUdWl2QjEzdUNEOVZMK0cvdGpyb3gyYitw?=
 =?utf-8?B?VVB0K3lWcTBtWmNTWWVQeVo1UnZGYlFJR1M2NHpZN29yV1VLR09FcHoyeVg4?=
 =?utf-8?B?dzNpMHkrR0hoUXJIYW9JMmRYYVRBdHhkZjBpd2Nva1VteFlpNmNjQlkwRGlu?=
 =?utf-8?B?MW9rNGRpeWkydERPZVlIN2lYVWFWUFRNVFR1VVQrT3VDWHBWWm1OSmNRMjZJ?=
 =?utf-8?B?T2NkdjhobkJWNXQ0SlJpT1IySW1LQTZrTWx6VkFQVDB6SGV3UFRja3VxQjVU?=
 =?utf-8?B?NUU3NG8wNVVGUVJpdldHVE51TERpRjdTMFNJVzFTeXZFNkE2K0JRaXJtSTZR?=
 =?utf-8?B?YWg5aU1FdmZ6S1R0b0Y2TEx5amUzSENmR0dYcmFsSXozVWZqVXgxNklSVDdT?=
 =?utf-8?B?c0hNak1UekZWTGVocW4zaTFrWTM5K0pjdTlCR3ZrcnBmRzNLMVhhRG5CdHRa?=
 =?utf-8?B?Zk8rbmpQRjl4b0d0d1NKZ2h1MjRwMjhIMXlhQlNBYnA5cVo3NlllVWVlelpJ?=
 =?utf-8?B?Q1JxQ0kwcWxXYVFYR1BKV0MwVzhoY3pVSlYxSk5hc3YxazRrU2JyM1JHNm50?=
 =?utf-8?B?V2psR3lVS09jQnlGNDIvZHZ0TVZFaXpJUlRqakYwKyt1OWlkWmVNTG1hUGhF?=
 =?utf-8?B?M3BWS3IwNmNQU2YrNmU2L1ZjY081eklZY2pERUQrdE5wcXhFaFByOFBsYnJQ?=
 =?utf-8?B?aEhUMGFlekhxK1FYZlpZOXlkekNuQWlqWW5VSGFDeEN6dkQ4dHovZW5EVDN6?=
 =?utf-8?B?THNLbnNTMEhxMzdKTkdRQytkbnFvSG1qWjhLdFdDODNzWXVaOHVPZ1VLTlNw?=
 =?utf-8?B?V09QN3Q3QWhjUVEvWVIwV0JWUXB1cXkzdS90TjNqOW9iL0FYSkIwWmlXb1ZP?=
 =?utf-8?B?ZDlDeVV4Sk5nWVZVblk0Z09RdVRKZkhjMWFsdjNNbTRIMEJMSzJzaGdHWmFj?=
 =?utf-8?B?Q01NaUw4ekN2RnlOaVZoNURGaDVaWDNxQkpnZ1VIaDZacGk5dWFZYlpUQW55?=
 =?utf-8?B?enVzdHpPUDVueGZ3dGRkcWpkby9mVHVBenpvNjdtQWExbHFWU1B1b3ozRjlR?=
 =?utf-8?B?RnFEam1zWjBMMTFDSlc0UkQzOXJ5cDBEOHlKTVgwWW0zZU9pUE8yOGdscnNR?=
 =?utf-8?B?NnlOWTcySDdIdVpSOURZbVg4TEk5UWxPbEkwTk42ekpsUU5rbDRSc1Y0OEV3?=
 =?utf-8?B?cmwxN2xhUHZUZnVISmRnNFJ6cElDWVltakZmVFJLMC91bW1UeldENThiT0pR?=
 =?utf-8?B?QlZXazRKTUVKN1NJeWYxZk91TWlVc1BxNk9ucE9udk9jV1hQLzhnZFdzTSsw?=
 =?utf-8?B?VEw4VTlaWkY5VHA3QnVuZTdTelBHNHdmYkgyWjlXazRqVXN3WW9MaFFGNnl4?=
 =?utf-8?B?Vm1PaFVTK1ZiU09DL2RUS3FhZEtLcDgvWlRxR2dCdDZoRHNXaFJLVGxwYW9p?=
 =?utf-8?B?enRjNjY3SzZvUFZub0FVUFJwWmF2ZnBiWVliMnVRdk1vRm95NDRseU9JT1BC?=
 =?utf-8?B?YjY0VE9ML040czl1SWR3TG1vVkFDcFdFSFN6eGtGMkNNWkdDSVBWYldiQjMz?=
 =?utf-8?B?WEJDcGVTWWNiSWxqcTh3MlcvbWp6RVpHKzBGWUdLOENJamRqdVF4WnZVaERs?=
 =?utf-8?B?MElKWHhzNjBLbEpVMGtuV2k1QVluU1VCZEFzRnNDVm40ZzBLUWYzS3FZcFVZ?=
 =?utf-8?B?QU9tRzgwYmxxOGU5RjV5dVFnZlZ5ZC96WDVEVDhxQm1iUnJzQVVlRnNwaWRz?=
 =?utf-8?B?SVlWcjBvZndwb0g0aVZFOG5ORU1rekhnalY4Zk1HOTJFRjIyZFZrRTVkbEU1?=
 =?utf-8?B?Y0FWNXhtblpvR3EwaU1IODNrSVhPZ0R2Zkd2d2tGZGRUbC8vd1ZZV1ZnUmlz?=
 =?utf-8?B?RXlOaVBSY0FHOHdxQ0pJQWlRRkl4K3dJRFZGOWxZZXFQVFJScWlId1N2dUNI?=
 =?utf-8?B?K2JEeGw4bWlzdDhPdm5ZRGRLS3ZoRDB2VWZsdHRDV28wallKNDQyZWlvR09m?=
 =?utf-8?B?UFhvNjhLYjRYc3JvUldKR0hUM1RrRllib3M3dGxuNmdYSS9VamwyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3cc46d-2094-4721-e2ec-08de4d804a0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:04:12.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLoSEfb0g9w7xTVzJmmyjAnLb5Ojw1y6BgBEKQccHTjiMLvEYDIGMGpDdNwev6ESAfL7OTKc/0MLlUJOyO1HvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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

See my nitpick comments for patch 6

Otherwise it looks to me.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> Provide a drm_colorop_funcs instance for vkms color pipeline
> objects and hook up the common drm_colorop_destroy() helper as the
> destroy callback.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/vkms/vkms_colorop.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 9e9dd0494628..ba826ad384b7 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -12,6 +12,10 @@ static const u64 supported_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>   
> +static const struct drm_colorop_funcs vkms_colorop_funcs = {
> +	.destroy = drm_colorop_destroy,
> +};
> +
>   #define MAX_COLOR_PIPELINE_OPS 4
>   
>   static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> @@ -31,7 +35,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &vkms_colorop_funcs,
> +					      supported_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -48,7 +53,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, &vkms_colorop_funcs,
>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -65,7 +70,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, &vkms_colorop_funcs,
>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -82,7 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &vkms_colorop_funcs,
> +					      supported_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;

