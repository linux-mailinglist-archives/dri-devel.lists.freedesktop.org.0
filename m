Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055C8CB4F9
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 22:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F5E10EA1D;
	Tue, 21 May 2024 20:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KRtHag5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A3410EA1D;
 Tue, 21 May 2024 20:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA2UG1w1PjH+lNduz/V31W6Sbi+XOrtegbPKuZLykDj3jis06kBwOrM7WpNsbW2P0pVJxYqKq5KfDvKzMAyDRCSZPAMLGP8eioJ0A75tehMQ3YOzK8mChtL7rAjdg999UKcyctHcS2/vprG7oiSOBV0I/5UlQx2Qbfw3IuY1Z2JZlCy+hOjc7Dx2UDsEZNNqsP0qu6v1s4nxNNSzuIbqoF6eJOQqmqRThfMxfCjRI+DH/eN00nejANRSOHgJPWoV4J0bTk6ouiYQsHZ/+wDolSXxg1f8Vf/XiOR/pz+1QhlYHVnp923fI6QgyRaTeFvzCbs2BwOHz/4coEymKARxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra/m8SPhuAFG8yVTiJt7GuzOH9Erjcn7Go7B5oFpukQ=;
 b=Fv2sRdmkyjKXDPZkfe1nU3dr0QEAQbSfSIoyza7oW5iU3SS5fimREhzgNcrlgSET+pIjh8E96TBDzsrNSB2av2Xmxi0HoX/BDSJe6NxX/d8ExAk55PYRS/duR7GG1jHnsurD7sv51u9JI3LorPjizmtAW1Zf12F+TVvHM/tI0pKV5HIuZekX9BjrXykPpKleEO+eXMuEqQVgF2ijLG3Z4NJbZ832z4G+nrs5g2TU/PzceQ2lr2oCrkUY4VauD+xed620fM3vvHAGmrx07gnmgvUQBbH9dXXnSEmfeNsJNlrPOQJSXyIRu5EeDaBhT/Lj2d0Li+LrBHDQzSN8pmfxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra/m8SPhuAFG8yVTiJt7GuzOH9Erjcn7Go7B5oFpukQ=;
 b=KRtHag5v37vTwp2Sw3OT+sr9fK0BBfPXlAP/I9jEPnUYK5fyaVZmXUdTI1aJ+s35s9fhQzAB1gxQmOYvxs6kh+f0+D8PaQPdCrSNGv1LOW+Je9jxNBsuHbFtJswao5gUMHfjC3xUW4rIBzHz2hZ2Efcv9Q1fl/Sk3C9lqAuVIMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 20:55:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 20:55:38 +0000
Message-ID: <86410711-9b88-448c-9148-109f81b1ca55@amd.com>
Date: Tue, 21 May 2024 15:55:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
To: =?UTF-8?Q?Rino_Andr=C3=A9_Johnsen?= <rinoandrejohnsen@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
 <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
 <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:805:de::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: cc825d0b-dc1e-4438-2b25-08dc79d85e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0RQZVY2VkdzZS9aTkVjeDIyVDFlS0N4eDM1VDhUOVAvKzRCZUNPdkxRUmwy?=
 =?utf-8?B?Z0hVUENoM3NvdWphSEdxY0ZMbHc2bEdQVjBodWg3Z3R1UkN1aFJUdTI1TExG?=
 =?utf-8?B?SnpZcGNDN25INjJVSjZDME04RW1QbGxZNXlEVGhMR1ZhSFdUZW9nR3FUOG9I?=
 =?utf-8?B?SFB6YmpydkEyaE1KV1FLMkplYzVKc1c5RTdxRDNWRytDUmJIUmFENy9QWk0y?=
 =?utf-8?B?d1FLcWIya0ZBL1F4cnpsODUyVlY4RDJod3BxMERMWlorbitSQjNXUHo2TEZy?=
 =?utf-8?B?TGJQVmNVNmlKd1cvTWZET2Z5Q3J3N09BNmY3YTBpL2d3eS85M3puUGdLUmNN?=
 =?utf-8?B?NGFZb3R3Wi9RTnU5MlYrQTQzTnRjUHJ0ejRhQXlmVkd3WEdHT05MTkhqVEtG?=
 =?utf-8?B?TWEvWkI3ZkdRUVUrb3NycGVSQk85NVlEMzBxeW50dUxoSjU5eWEvcmpaVDJN?=
 =?utf-8?B?ZEhjMEl4QXBBU3FpMG9TamlDNEFyc3BlQ29UUXcxMkMxOWNqUk5SS0MxaThY?=
 =?utf-8?B?a3FSaXU4cFJvNTFub01mS1J3QU5sMmpjMGVMcFRzb2JoVFdPaFFBUGlnOFZH?=
 =?utf-8?B?ZDZ2YUQ5d056emV1Lzk0UUpDR2Y1VTZ6dXhVdlYrQWlqcnVzOG83NzB2WU0x?=
 =?utf-8?B?bzZQc24ramVDZVE1a29lUzNlOENDeCswaWk5V0E2RHMyZVgzUzNwMlR6bXB3?=
 =?utf-8?B?S1JEVElOZlg4alRKQ0oxK0dJVFJMRDY4c1lJN0Y5Zm9pQkY3amc1NXNqbUlT?=
 =?utf-8?B?SHErV1F1U3hVQ1pxTUdHUzd4Kys0ZGN3Q2FTdkxCTi8rSnNFcFNEOWthUjBX?=
 =?utf-8?B?dktvOEpQWEJTeHMxVFZNVzVmUFZLNXBuaEJ0dkgrTWN3YXdldW80eWRQYjNK?=
 =?utf-8?B?MkNGcEhiblVxTXRHNkpDWnkzdHk1ZFZHZ3MrbTlCN3lPdk9MM1lJUjFUV2hJ?=
 =?utf-8?B?NENDZjF4c0JQd2JxMlBhMDNHcmp1cG1QN0ltdlR4QmNQR1ExM2RMdWNycGZQ?=
 =?utf-8?B?VVNmNjZXcms4dTRnenFjS3pSckhqZWtkUEg5VUU0VlRUa1Q3UGpaWmtUcmNp?=
 =?utf-8?B?ZDA4S0ZjbW1La1Vlc0xRN2dseHl2QjFRTzVqeUhjTmpKOVYwOGdJaUJXSUJQ?=
 =?utf-8?B?dlhvU2JoMzN5OUFFcm9ndWxoU3JtOEtVVTlVK3JPNS9TenFGSEJoMGpublV2?=
 =?utf-8?B?ZHZOS0djU2xpYlJsTnJ5U3BLRUFkSmxybERMVExkZ0JBakVyVTZpa3ZpSGd2?=
 =?utf-8?B?M200K2FITy8vZGFJMVlJZGFMR3dvRDdGT0tBSGxFdFVIV3VCNktKd2xKSG80?=
 =?utf-8?B?NWo0L0o1NVhRZmtRRnAxby9NUnpXR3RleUx3SlBJZE1KRUpVcHdzeEltYzI4?=
 =?utf-8?B?dkhlUG0vTHhiRm5FNGJ2Wm1XdHVrRTJSM3dMNVpPVzFpR09yTTQrVkZoVnls?=
 =?utf-8?B?S0x0dDRRd1hia0QyQmZWTUI4Wlp1RFFsaEpvaXczQmJtTVFyU21hWitVczBQ?=
 =?utf-8?B?OGN6VzJodmlFVkRpZnByMmpXcG0vSnFpdjlIdnhjdm1EZTVGT2JucFJ3NXNm?=
 =?utf-8?B?L3N2a3dla0c2SDUwS3FUMDRzYytaYStoczM2MW52UjU5eGIyQkhac0pSZTV6?=
 =?utf-8?B?TWxjWkI2VWxSNklYd3dzQXdWTytCNlNiM3h5RmRuajd5MWlFb3Q4WW05MDho?=
 =?utf-8?B?TUNyTDIzWDVjRGRzLzlyVWFuaGYrNzFXTXJ0N1FiQnZYenhWQXBoamlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU94Y09rajRBSll5Y0RpMThXTGorUzVrTGtHSm5hQkIxS0N3NVQyTTZsdG10?=
 =?utf-8?B?anh6bTJ4MzB4NVNCTW04WXZ5Mm5vQkRhNU9ia3djK244K1MyNFVaek1ObzNx?=
 =?utf-8?B?bnNFenpwZ2lLTnhzK2dmY3c0K0QwY3NrRFBLSENOaktIMHRHQ1hEdHBFcWhH?=
 =?utf-8?B?ZzU1UFV6ZHNLN0Y4OTJ6dFdOTjV4UFltckJLL1RFMW9qNnB5Q3NBQmt6OUFO?=
 =?utf-8?B?RlNCREs4aGQyVWVZdXdSUFh2R2s2SkZkQVJ0QStzY2ZlOW13WUJwRmR0bWdl?=
 =?utf-8?B?UURIZDdtT3N1UG1POEd0ZVhZZGNSK21OV0VlZC9rTEg2YTJ4SXNCQnFsd25E?=
 =?utf-8?B?RTIvamdMY3VlU09VVkRYa0FYSGw2VUFBMzVUUWFVc2x5NmhLYyszazEwMmEw?=
 =?utf-8?B?UzRvd3B1bkhzcm9RdzBuVVltNXBRYnBUZGVVbW96cVZjMnpKZFc4WGt4eGtn?=
 =?utf-8?B?ZWhhZGxjQWU5djBuY2t3MVg5WGVSVDNPTkNqb25udmI5eTlGSFVCc2J4aHVp?=
 =?utf-8?B?WVYrRGE4T3JrbzNENEJoNUQwMTdvb2dRUTRMeFZoY2Z5WmdKalZ2NnVBMG91?=
 =?utf-8?B?V0t6cWI4Q2JPRmVnaEI2czc4MTlnSW4xK01scXRDYVV3T1B0di8vQXhucFZG?=
 =?utf-8?B?UzJldUV0NEwrdjNsanVtb2dBbkhXV25SL3Z2V01IcmV1OGprbnhQb2VmMlhs?=
 =?utf-8?B?WTYvU0QrZGJjSUY5ZnlNdmh2bHJWNXVrVXlFME5md3FjU2JaQkoxNVpicmdO?=
 =?utf-8?B?TGJjeUFpWVByRFNOcEIxNlMrdTV4cjFJNDVNYTNubU1UKzRZUjROVGdhSkty?=
 =?utf-8?B?aEVOVlVNZi9taFY1d3MxRjFVWTQyYnl3Umh0blphVlEyMnUvV2s4cFF6T3BP?=
 =?utf-8?B?VWl4MFcxOEc4akp3NEw4K2JVVm1IcFFuZ3ZsdnhLUFZQeVZydUw1OTFXZFVm?=
 =?utf-8?B?U0J0ZG5UWnJxU05JNzl1OXpxUVQrb1VCSXEwR25DY0J5SGFJT0VJbFRLam1J?=
 =?utf-8?B?UWZ2c0FIaUVEVWxmang1bHN0QXhjQzhIaHZ5U1RQUE11dTExTk5mc0dYQTEw?=
 =?utf-8?B?SzNYejJoY0IvekpXZC9ITVVEZ2hKZHlHL21vYVE0eDVjTGdocG95dzBxWHg3?=
 =?utf-8?B?amNCWWVCcjVUak1UaVFrRlNac3hZTkhac29VN2FsSkNMa24rWWtGSllLKytz?=
 =?utf-8?B?aTRxU2ovUmdXVVRaSTlTMkV0WGpRL0xtNDFVaFBjRUJ6NUI5bGZPbGsyMC9V?=
 =?utf-8?B?bDFoNEUzaDVUbFNKN1JqK0dXeU5WNVVtdDNRdjNQQnZSSUswMTJwNzUxTnAx?=
 =?utf-8?B?Q1Bhb1o5QlloQkl2c1hNWmtCN1ZSYys0V0x4VEQrRk01azhOanR0Q3Z1M1B0?=
 =?utf-8?B?R2pSc1BhQ3dTeFBwMk85ZDduVkQwZDJWL1VpOXpETXBFb1ZVc2VJZzgrMUti?=
 =?utf-8?B?MTdYQXBRZHBTaDMzQXVsTUxiTTlacE5ONURvdVpIQ0VxWGNGdCt2ck5UZGU0?=
 =?utf-8?B?aWdXMS9RUlRLTGg0VW5YZE1DZktJdzc5c2kwZkZXTG9kWTBmQXp3c2o2bVJu?=
 =?utf-8?B?M1U3WEVzb3hqUmtFWVhXWXJJYjYyYTBjR0FlN2JmM1EyVTBQd2xPSUxmWHBE?=
 =?utf-8?B?ck5EY1N5MkoxVHhWZGNCYWdqZDB5bUV6aWJQbVU4Mm9nSjhNSnArTkpKTm0z?=
 =?utf-8?B?U0YwUnR4UGNCWTdHNE9ETjdYN2xJRjlwYjVlKzlxRXlFbkE1VDRZTWRjTjYx?=
 =?utf-8?B?cmJWY0tqeXFHYVhXUmhvZDVJSVZGd1F6Rnd4U1JJN3I1N0liZ2NZeEVBbmow?=
 =?utf-8?B?RElmZDJUNU9kVWFsUUlpZngvNU5FMWlVVEZTYWlQQzU2NkxUY0tGYVVSaXBm?=
 =?utf-8?B?cXkzZVhGOTJ4MEkvZVluU0VqR24xb3R1b0dWSjdIcjh5R0tUNmRob2d1U0pt?=
 =?utf-8?B?TGxnZjNXN29vWWFBTTNONDdKZXpBMjcwNnU3VENTMkcyVWVwWXd2d1FMWTVV?=
 =?utf-8?B?ZHY0aDZYTjRNeWdadStxaWtuUVZzcC92VVpwaDFZS1hCTDZQbW12eUk1KzdT?=
 =?utf-8?B?c0FiM08vU09JQkx1WkM2U2V1SWVkWEtjWnYyb2grZWIyOExlV09hSWR1VUlX?=
 =?utf-8?Q?lnnSjnlyKiWeRsNRwmQUaNIST?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc825d0b-dc1e-4438-2b25-08dc79d85e2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 20:55:38.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9damzV22SyGcmymWHphXOz8FcHfkFRVi7Ftoe+Nss9Y1qix/lebndvDaZwL7kOL8Zjw+3PxWSOi0TZoJKxezEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190
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

On 5/21/2024 15:06, Rino André Johnsen wrote:
> What is already there in debugfs is 'bpc' and 'colorspace', but not
> the pixel encoding/format.
> I have searched high and low for that to be able to verify that my
> monitor and computer are using my preferred combination of all those
> three values.
> 
> I do think it should be available as a standard DRM CRTC property, but
> for the time being, I figured that a simple debugfs property would be
> sufficient for time being.
> 

It's just about as much work either way to populate it though, why do it 
twice instead of just doing it right the first time?

> Rino
> 
> 
> On Tue, May 21, 2024 at 9:04 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Am 21.05.24 um 07:11 schrieb Rino Andre Johnsen:
>>> [Why]
>>> For debugging and testing purposes.
>>>
>>> [How]
>>> Create amdgpu_current_pixelencoding debugfs entry.
>>> Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding
>>
>> Why isn't that available as standard DRM CRTC property in either sysfs
>> or debugfs?
>>
>> I think the format specifiers should already be available somewhere there.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
>>> ---
>>>
>>> Changes in v2:
>>> 1. Do not initialize dm_crtc_state to NULL.
>>> ---
>>>    .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++++++
>>>    1 file changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> index 27d5c6077630..4254d4a4b56b 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> @@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
>>>    }
>>>    DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
>>>
>>> +/*
>>> + * Returns the current pixelencoding for the crtc.
>>> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_pixelencoding
>>> + */
>>> +static int amdgpu_current_pixelencoding_show(struct seq_file *m, void *data)
>>> +{
>>> +     struct drm_crtc *crtc = m->private;
>>> +     struct drm_device *dev = crtc->dev;
>>> +     struct dm_crtc_state *dm_crtc_state;
>>> +     int res = -ENODEV;
>>> +
>>> +     mutex_lock(&dev->mode_config.mutex);
>>> +     drm_modeset_lock(&crtc->mutex, NULL);
>>> +     if (crtc->state == NULL)
>>> +             goto unlock;
>>> +
>>> +     dm_crtc_state = to_dm_crtc_state(crtc->state);
>>> +     if (dm_crtc_state->stream == NULL)
>>> +             goto unlock;
>>> +
>>> +     switch (dm_crtc_state->stream->timing.pixel_encoding) {
>>> +     case PIXEL_ENCODING_RGB:
>>> +             seq_puts(m, "RGB");
>>> +             break;
>>> +     case PIXEL_ENCODING_YCBCR422:
>>> +             seq_puts(m, "YCBCR422");
>>> +             break;
>>> +     case PIXEL_ENCODING_YCBCR444:
>>> +             seq_puts(m, "YCBCR444");
>>> +             break;
>>> +     case PIXEL_ENCODING_YCBCR420:
>>> +             seq_puts(m, "YCBCR420");
>>> +             break;
>>> +     default:
>>> +             goto unlock;
>>> +     }
>>> +     res = 0;
>>> +
>>> +unlock:
>>> +     drm_modeset_unlock(&crtc->mutex);
>>> +     mutex_unlock(&dev->mode_config.mutex);
>>> +
>>> +     return res;
>>> +}
>>> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
>>>
>>>    /*
>>>     * Example usage:
>>> @@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>>>                            crtc, &amdgpu_current_bpc_fops);
>>>        debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
>>>                            crtc, &amdgpu_current_colorspace_fops);
>>> +     debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc->debugfs_entry,
>>> +                         crtc, &amdgpu_current_pixelencoding_fops);
>>>    }
>>>
>>>    /*
>>

