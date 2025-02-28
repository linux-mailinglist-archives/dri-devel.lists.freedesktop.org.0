Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47760A48DA4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 02:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDD010EBCB;
	Fri, 28 Feb 2025 01:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="axU6ot+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A7410E0E4;
 Fri, 28 Feb 2025 01:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSxzFuoPm+L0Naf0nFijSwMvXyPk7G9LeNUZ2IfpdM/NDrgjJNKOTJT11Xcyw4enHhc4LhcqVggHUqUmVa1aEtp4SsMREkzX1pBLpLqH4K4tGz4MyXBer7vD4N51W7HR6aVny91gu+xBRiYdZryuwrxCx7GKBdc1i2eYiz6WwT9xWme/rt7woBmo4XQW2saji1a3XfnhhDPNPNlNmJShJ7owkjCzlm6HVlMWuUlvq02cOEkVKK5hBwyWEogGKP0JWMhuFcyDHY9M2vTV9PQBueT0MKfxJAGoQ+nZb2Foitpp5Q8sQadmH+mi7lQilSoFuTSmaECO22lvLav+TdsHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r67vPbsnyPmHxLMiQRd7RIQZkwUN5WPgGufmwefHrxM=;
 b=zAluiMgw4L8US4APx9n/duvgdOU+XzEiP9z1Ssrh3DBJV/gkyDm++d9LIluwK7WCeNILFmve6KkWmnIf3jG6Bjab9HJIuBwaeZnTU/JKXKUmo8fEVE/DDA2A9Vh4aRJvYPBZUX+ChVCsXtvxKKQG6IMaMuQjA58EV3UM8UAnlFOkQxudnnd3GSyQZs6i1MJYDzrfO559KZC+dcPabaChXcQO85hal3nktQHVqY1SvS33/g/YINDYaaIYHwF1JvoZmDktnVJTJaH4kN5s4LVfnDdjYn2p2LXP4RPlvZaGjxP5vbRHxVF6iOdHR2yJlhSSECS1W5+gPfEBimrpOu/tyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r67vPbsnyPmHxLMiQRd7RIQZkwUN5WPgGufmwefHrxM=;
 b=axU6ot+j6y5kpmZVFXq4RpdDs0slfYgGULWt20II3YGnDguJvRcx+oToAIwhqVJpvoSCUsG05uEMpFBeHe4VTi4pBr08T7yOE5qzLD7Qp/zQ8yyxF8QSMFAts8Kj14GI+ytdfafTy1bf6iK0e4uVPdwN5sR3B7MATiTLCekAw2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 01:07:27 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 01:07:26 +0000
Message-ID: <570ad01a-ef15-476e-851d-ee78973fd79d@amd.com>
Date: Thu, 27 Feb 2025 18:07:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 07/45] drm/colorop: Add 1D Curve subtype
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-8-alex.hung@amd.com>
 <423ed019-f668-433d-80e0-4018f53c31c0@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <423ed019-f668-433d-80e0-4018f53c31c0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::16) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6e531e-b60b-4ddb-846f-08dd57944412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZLTkZKcm1lVXU0YVRkblJLTUZ0NXdBUXpXZ0l2aVRWSER2VjNJWjIxb3Vh?=
 =?utf-8?B?dDZ6ZXRmbVhsSndFa0dXbmxtM2xKSzRxSjJtby9HMjE1R0lhTzRYU0htK2gx?=
 =?utf-8?B?Zk5FL0NhQ3B5Nmd4aFN6Q2FmdEVUbkJwVVRIbTdidTNjc0ZOaDYrcHR4emtJ?=
 =?utf-8?B?T3RwbzBGYnBITXJNOGt0QlgxUTFyS1ZtQytISkpreGVBV0tNS1pFbmFFT2ll?=
 =?utf-8?B?ekJIUTV2dHdIVlVhRlJtZzQ5dFoyYXBkWFp3Y2FGZHdhcWRkWmpvMDNLRXEw?=
 =?utf-8?B?ak1FM242WjhHTWhGa1ZHMjFBY1A0akp3dHcvOHNZanA0MHNpcEhjL0J0ZmJQ?=
 =?utf-8?B?RnBUcVRLekdSR1pyQWdWOStmWWhBU2p3T2pmUGl6T1VpTDVhdUNBWUZOM2Fy?=
 =?utf-8?B?SlF1ZS9UTFJGcFdodzc4cWR5VXhiNzN2QUFMa1hDa3ZWYVJzTmVEdmhXQU01?=
 =?utf-8?B?TnBRa1lyVTVXTHM1YlVGcGlFakMvRUJrYVhvTlV5ekdZT25qd3RSYTFsbG5G?=
 =?utf-8?B?QXhPU3dxZmkzeU5FMUhZS3NjeXQ4Uitmd3Z1anlDSG1oajZwVHJIS21hWlph?=
 =?utf-8?B?S2NXN0dtVXliL0U0TVM5dWVEd2tjaGV2S3VsdWgwSHN2UjMyeXhOLzRQWFda?=
 =?utf-8?B?MFF3UTQ5dUF1OHZsRDU0SGRNK3pJelNOUkNVRVNESUxBb0hydnlGQ3JKOFBU?=
 =?utf-8?B?TDJJOW43dEc5R21aZjFxNzVCRXpHREhxYmZYcGpSdDVzb0tLVVI2OXE5citz?=
 =?utf-8?B?WXRJbnJBdVlpckhSWFFseWJyM2J2c241aEtFcVhlRXdzTDFhcElabG1Ca3Jp?=
 =?utf-8?B?K2dlQmFUSHp4S29CRXJJMURJUFVCR0Z0U1BwRW02eUhCY1BFbGVseGhGaUpu?=
 =?utf-8?B?a1Y3Q2s1MVN4ZVhUd0JPTUVTNHU5SmlvQm5NZnlXZFFrU2dsOXlGTDBsYU1J?=
 =?utf-8?B?Qm1XZ2dEL3o2YkV6UkQ3TWQ4cXlobkJ3Wk9NRVRuL2ZwbkdQWERJQjRTM0tQ?=
 =?utf-8?B?R0tPT05jeXU4U28vSXVXYjgyU1VQTzVaR0xiSndFNTI2RjRCTW5HOTFlSW01?=
 =?utf-8?B?UFA2eTFONzdYakd0UHRIZGNNbGlPZXlYZE03S1J4cmlrN25rdnFMdUZodnNF?=
 =?utf-8?B?M1U0ZmVCTlpOUWNSNFRzYjkrTHFqOTJRZm9wRWorb2dGU09EQkxVTk1TcGUr?=
 =?utf-8?B?VFgwcVlLU1ljKzJoWU1nN0VYcnRzOHVOc0g1Q01rNGhrVXVlcWQxTnFVamRy?=
 =?utf-8?B?ZEhmVHZLcElRMTBVVFp6TXRDcXQ3a3AzSmN5NjlJdWFmQlg3TkhXRjI5S2xT?=
 =?utf-8?B?TURSQ0g0SjhaVDBtVkZ2YmlPV0Y2aDROMU45U0g5NjFkaWtHZXdGMk5jMWY4?=
 =?utf-8?B?QzBPaXR4cEE1dVkxUUtqc0l0Um5PRm5tR0R0NVVWQklwQndoTktIRGNaeGJr?=
 =?utf-8?B?QWpVa1FtMHl6U3B1M3M1V2NobEpLTUk4eFpKYm9SbEVGK3krdFIwTU16Y1Jq?=
 =?utf-8?B?Q2RuV3E2WDErWCtZbzVqaVppaFR6Ylp0WUdYN3Q1SVZmZTJ4VTI0SGpOUEVr?=
 =?utf-8?B?eUI4T21ZVXZSTmZxRlkyK0dxdjlpYWVxTnJYUWRmaXJ1MzlmK3pMa3ZDL01s?=
 =?utf-8?B?eXFiTUdvRWNjSm1YcXNMQ3piaVYzWjhiakZPT0tRaGhTYXJwMHdZM2huRnRX?=
 =?utf-8?B?Rk8zdks3L2o0RVd0UE8xRU5BTWc5SFpqQ0wrVTlrZWs1OGxqS1o3R05ac3NZ?=
 =?utf-8?B?d3NSUmVIV1pncVdLbU9MRERGTWVyQ1U2b1NubGpTMWFSdG1mZlBUdmxzakhP?=
 =?utf-8?B?b3RLelhKcVlkdnM1dithbTRkeUtJdVFHQUpLUTNENGkyaC9iZDd2c1RKdFFK?=
 =?utf-8?Q?Z9mC9gNMolqjM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXd3blpkWStDdG04MEZ1L0xtOVJGcUZNUTVxQkExTkIxNWx2MW1abFBWQ1lR?=
 =?utf-8?B?VXdySXdVbmw5QXJKY3ZTelZOd250YjJSKzJCd0pWaU1TNWV3TTNwZ0dWSTls?=
 =?utf-8?B?czdpOVp6OXk4SnNNZWtLRkJEbW93ZklNQnByZnlSTU1LU25lQVVtQnVKMVZz?=
 =?utf-8?B?YXI3d1B2ZnlPQmlVYXRkNlo0VkU0YWYrZGJIVXZiYjQ1T2VZUnBUWFF0UXFL?=
 =?utf-8?B?aUFDY081VzhDSTlFc28rZDBRdzhacTJkNVN3ZDhWSnRMNTM3UUhKaVRuMmNv?=
 =?utf-8?B?MzUyd1RBVzM4VGFtaVZ5L0V6Y2NseWZDVUZ3Q2V0aGszT1ovM1F4cGNsYU1G?=
 =?utf-8?B?Smg2cTFrQ3pycHVrRk5qci9Oc2M2eEpJUUcxTnR4ckxzWmdqNDd1bUxmRm5R?=
 =?utf-8?B?dVpnaUZRc1pENVpGZ3lGcXIyWGh2YktPSHlTQUVKUVZvSWx1Q0NVRmszS2c1?=
 =?utf-8?B?ZjMrdEhnazBONThxWFIvWUwrUjkzdXJ6aUZtUVFtS3RORmVJK3NJV3NYSnBV?=
 =?utf-8?B?NEFldW5odU9CdWhCcTR4R2lyc203TjZsa1VsSEpHSk5YY1ZSWW82RXZRc3kz?=
 =?utf-8?B?Z21pSWNPYkFoVWNRcTM5MytXKytEOUk2ZkVTb2JjWjJaWnlnOFFIdWVaS1FO?=
 =?utf-8?B?c0F5STNOYjJoS3FVVEpoUnRPKzZ4WmhYNUI0bS9WMFNMVStxTE1NWmpkdmxO?=
 =?utf-8?B?ako1UXk0T01GSkE0V0x1dDN6RDA2Y0VKSHgzazZHU1RtQ0dYSlB6QkFDQ2RL?=
 =?utf-8?B?U21Qd0pEK2lBb0JuTHZmcDV4NENQcHdnamk3TUZ5U1ZsLzZrdHRSalIrYzVk?=
 =?utf-8?B?c2NkWjR2WWxITW1NZkxBYy9xOFdQVzdvWjhkbEpvcjJqcXhaNEF5cEI1amNv?=
 =?utf-8?B?NlFIVTVTSDFXejZLS0xEY01ubUQvTHRzTEVDL0VYeSszcjBsYUVzVkJJN1l4?=
 =?utf-8?B?a2kxZlZkMG9wOGxBSXBpM0NYMmpDZVNsQ01MYjBCQVpVR0w3bWx5NXExQy9L?=
 =?utf-8?B?b1g1bGRwUGd3M2toMU1nM09LOVNtS1BuZUs4R3A1dE0zTEhnZmhuL2tvb0hR?=
 =?utf-8?B?SG9ISmdSaUZJT3BHcXVUd0g2dnVSVW1IbmEwOXJPaU9VMTFlSlcyWDh3dk43?=
 =?utf-8?B?dnpKczBZSzd3NU5yN0RUNHRjc25ZM1huUHU2azVIbzQ0YzViSDhJOXNBWkNh?=
 =?utf-8?B?aFBvcUsvYWZ6TFFrbDFwNE1tcmJDMzZYODBhVFRGczFHazBueEpLeTg5S3R3?=
 =?utf-8?B?T0IrWnFUOFI5eGowNlpxL2Y4T2VrTkUyZHFKYVdLRXZieU5hbEtrbzZ1dHo0?=
 =?utf-8?B?TjcwNGZEY1ZhNDVpN3FSSWJhaE8vVHVEaitKcCtHZncwcmtPNWovVUZueDd6?=
 =?utf-8?B?NW52enh1eWkydlVETzl3M3R2Sm0rK2RiQXJ3cFRYTDhxcmdQQ1Ewc0Q4S0Zz?=
 =?utf-8?B?YnBiRjNzNG9aKzkrT0RyTmtBem1vT1JHNjBrN0MwdEpBeFM2dXhxNGtsN2U4?=
 =?utf-8?B?Y0J0RExIdzlic2Y1akpHUytUcld4cjR0MTIyS05TQVp4aG1LSE1tTDlOdCt5?=
 =?utf-8?B?T2lmSTd2UVVqT2M5bkZWQU94REhvWGtSRUYwZkZTSXZHdG1ab0xPMEhDa1Ev?=
 =?utf-8?B?cjVXM3ZiQnp5QllFVU9nM1ZTa3NqMUhkL0ZqQndZd3o2OFhSQzBXdTF3VkFT?=
 =?utf-8?B?OE0vQXVXQldCT09BQnVIVnpKMmNYejlvbzNLajhjeWNXRUZhbTNxNDRoYVBW?=
 =?utf-8?B?RE9MaUFWOGt5aVduK2xvelhLcU53ZS9zN3ZhZGp3RmFWbDZENmRiUVlSVnQw?=
 =?utf-8?B?L3lObkErR0tMaFhLckdGd0FzNTBSVmIzbE1jWE96UE1BMTRMUElic1hlVmY1?=
 =?utf-8?B?WUVTZ3dZMnN2YUY5dU9zZHdPeVRGNnFlb2sxVEFHS1NXcjNVdE9JbG8rTlpj?=
 =?utf-8?B?OFB3SnZIVnB4dDhjTGN3ODd5TDJJQnY3T1FUQXc1eUx2cFFMSWQ0Mkd3ZzBZ?=
 =?utf-8?B?cTMvTldJRlNYRmNXTDdKSnN2OUtMSVNJVjVvVjdpbHFNZ2l4UC93UnNVSlhm?=
 =?utf-8?B?NjI4OUJvbXgyaG1PYkZGZVdhaDdhR1pjQnFrWEpPS0t1eWV5aVJMQTZwNHBX?=
 =?utf-8?Q?+mDX9Q0D4zlu75BMGcKpdsui2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6e531e-b60b-4ddb-846f-08dd57944412
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 01:07:26.7162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3upronuy+bkn/IBYDJdrDf8EeLsDxqguwiSAIYO+mnBoCKYydITc5U7Sdwy0UV53qvOXB3DD/vwDi5pbVoH/Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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



On 2/25/25 03:13, Louis Chauvet wrote:
> 
> 
> Le 20/12/2024 à 05:33, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
>> DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>> v5:
>>   - Add drm_get_colorop_curve_1d_type_name in header
>>   - Add drm_colorop_init
>>   - Set default curve
>>   - Add kernel docs
>>
>> v4:
>>   - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
>>   - Create separate init function for 1D curve
>>   - Pass supported TFs into 1D curve init function
>>
>>   drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
>>   drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
>>   include/drm/drm_colorop.h         |  60 +++++++++++++
>>   3 files changed, 207 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/ 
>> drm_atomic_uapi.c
>> index 59fc25b59100..9a5dbf0a1306 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -648,11 +648,17 @@ static int 
>> drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>>           struct drm_colorop_state *state, struct drm_file *file_priv,
>>           struct drm_property *property, uint64_t val)
>>   {
>> -    drm_dbg_atomic(colorop->dev,
>> -            "[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
>> -            colorop->base.id,
>> -            property->base.id, property->name);
>> -    return -EINVAL;
>> +    if (property == colorop->curve_1d_type_property) {
>> +        state->curve_1d_type = val;
>> +    } else {
>> +        drm_dbg_atomic(colorop->dev,
>> +                   "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
>> +                   colorop->base.id, colorop->type,
>> +                   property->base.id, property->name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>>   }
>>   static int
>> @@ -662,6 +668,8 @@ drm_atomic_colorop_get_property(struct drm_colorop 
>> *colorop,
>>   {
>>       if (property == colorop->type_property) {
>>           *val = colorop->type;
>> +    } else if (property == colorop->curve_1d_type_property) {
>> +        *val = state->curve_1d_type;
>>       } else {
>>           return -EINVAL;
>>       }
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/ 
>> drm_colorop.c
>> index 1459a28c7e7b..a42de0aa48e1 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -31,6 +31,123 @@
>>   #include "drm_crtc_internal.h"
>> +static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>> +    { DRM_COLOROP_1D_CURVE, "1D Curve" },
>> +};
>> +
>> +static const char * const colorop_curve_1d_type_names[] = {
>> +    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>> +    [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>> +};
>> +
>> +
>> +/* Init Helpers */
>> +
>> +static int drm_colorop_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> +                struct drm_plane *plane, enum drm_colorop_type type)
>> +{
>> +    struct drm_mode_config *config = &dev->mode_config;
>> +    struct drm_property *prop;
>> +    int ret = 0;
>> +
>> +    ret = drm_mode_object_add(dev, &colorop->base, 
>> DRM_MODE_OBJECT_COLOROP);
>> +    if (ret)
>> +        return ret;
>> +
>> +    colorop->base.properties = &colorop->properties;
>> +    colorop->dev = dev;
>> +    colorop->type = type;
>> +    colorop->plane = plane;
>> +
>> +    list_add_tail(&colorop->head, &config->colorop_list);
>> +    colorop->index = config->num_colorop++;
>> +
>> +    /* add properties */
>> +
>> +    /* type */
>> +    prop = drm_property_create_enum(dev,
>> +                    DRM_MODE_PROP_IMMUTABLE,
>> +                    "TYPE", drm_colorop_type_enum_list,
>> +                    ARRAY_SIZE(drm_colorop_type_enum_list));
> 
> I think this function belongs to the previous patch "Add TYPE property".

This function is only called by the first colorop. Some pieces of the 
code in this function are introduced with the first colorop (1D curve) 
so it makes sense to include it here.

> 
>> +
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    colorop->type_property = prop;
>> +
>> +    drm_object_attach_property(&colorop->base,
>> +                   colorop->type_property,
>> +                   colorop->type);
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * drm_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
>> + *
>> + * @dev: DRM device
>> + * @colorop: The drm_colorop object to initialize
>> + * @plane: The associated drm_plane
>> + * @supported_tfs: A bitfield of supported drm_colorop_curve_1d_init 
>> enum values,
>> + *                 created using BIT(curve_type) and combined with 
>> the OR '|'
>> + *                 operator.
>> + * @return zero on success, -E value on failure
>> + */
>> +int drm_colorop_curve_1d_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> +                  struct drm_plane *plane, u64 supported_tfs)
>> +{
>> +    struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>> +    int i, len;
>> +
>> +    struct drm_property *prop;
>> +    int ret;
>> +
>> +    if (!supported_tfs) {
>> +        drm_err(dev,
>> +            "No supported TFs for new 1D curve colorop on [PLANE:%d: 
>> %s]\n",
>> +            plane->base.id, plane->name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
>> +        drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
>> +            plane->base.id, plane->name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    len = 0;
>> +    for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
>> +        if ((supported_tfs & BIT(i)) == 0)
>> +            continue;
>> +
>> +        enum_list[len].type = i;
>> +        enum_list[len].name = colorop_curve_1d_type_names[i];
>> +        len++;
>> +    }
>> +
>> +    if (WARN_ON(len <= 0))
>> +        return -EINVAL;
>> +
>> +
>> +    /* initialize 1D curve only attribute */
>> +    prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, 
>> "CURVE_1D_TYPE",
>> +                    enum_list, len);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    colorop->curve_1d_type_property = prop;
>> +    drm_object_attach_property(&colorop->base, colorop- 
>> >curve_1d_type_property,
>> +                   enum_list[0].type);
>> +    drm_colorop_reset(colorop);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_colorop_curve_1d_init);
>> +
>>   static void __drm_atomic_helper_colorop_duplicate_state(struct 
>> drm_colorop *colorop,
>>                               struct drm_colorop_state *state)
>>   {
>> @@ -70,7 +187,16 @@ void drm_colorop_atomic_destroy_state(struct 
>> drm_colorop *colorop,
>>   static void __drm_colorop_state_reset(struct drm_colorop_state 
>> *colorop_state,
>>                         struct drm_colorop *colorop)
>>   {
>> +    u64 val;
>> +
>>       colorop_state->colorop = colorop;
>> +
>> +    if (colorop->curve_1d_type_property) {
>> +        drm_object_property_get_default_value(&colorop->base,
>> +                        colorop->curve_1d_type_property,
>> +                        &val);
>> +        colorop_state->curve_1d_type = val;
>> +    }
>>   }
>>   /**
>> @@ -114,3 +240,11 @@ const char *drm_get_colorop_type_name(enum 
>> drm_colorop_type type
>>       return colorop_type_name[type];
> 
> Probably a dumb question: can't we use drm_colorop_type_enum_list 
> instead of colorop_type_name in the drm_get_colorop_type_name function? 
> So we will avoid duplicating the string "1D Curve".

Using drm_colorop_type_enum_list in drm_get_colorop_type_name needs 
enumerating the list every time (extra CPU cycles) unlike using 
colorop_type_name[].

> 
>>   }
> 
> Thanks,
> Louis Chauvet
> 
> [...]
> 

