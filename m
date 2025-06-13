Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C0AD90AD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5410EA19;
	Fri, 13 Jun 2025 15:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fsmlbSRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A080310EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 15:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK9RDxqTt3G/VluZUpYNroB6S8wqbi5IwpzNDXmVFnGQhMPqLHLP9VMwHuLF1q2oXm8Er8+g+Q0X6Q467JBgM37fJsYx5CHgOlN+QTW2uI+vGoBsOousQ3lq1/WjfWvGHCgWyxlQaPnX3KT5Fx/FFgsa5O1D8HDCjAu0PFXoGbOWDDw9fgKN76qWFtjl48XiHIIAvJeOtSn6TRSi7X+Ns2PqOhJFSAcrtzAxMyevW5YLipU40q6679uWDRLdf/UIQ05qShug/AarKi4o8Vlut82HL6Gxmy6u/U6dw2B3yPv/sjJOD8o2VRv3AgQGoljzIocJCsvEbcZY4xpKU4G1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7qg2bXa5EH2dKwp4t6O7p2nwz80/BGZTHeeQ3wV6H0=;
 b=mCdivAinw891vFK+7c8PsifZ0CM77UMnwJMuWNDXJj+f9FlhqeY0as0N0NZo4Z3Ra9j6wW/E+cO3EJL+NV0vcI5jYtOQsTE/XKradLrYuixGyZHKAP3YJ6Tl7F7b4Tc30GlAHrUSEdXG6n1CwNLoCe9GZeIbx8oUNSW9QS4K7BiZ1+v+4+IDbVq4+IcAXwScBSwKJxUDk7t+3uYafzU4g4vVhfyymengpgL6uYlDnkrRB/FHElW7mBmhXYFxt7Xz9E6I7YAmOhXq6ZoeVgE7CCG/QUiv4WFLimousxzUYfU9cI/1S2WHhr/fHu5FuC2av7+ToUuJp0DFhfopkQbm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7qg2bXa5EH2dKwp4t6O7p2nwz80/BGZTHeeQ3wV6H0=;
 b=fsmlbSRgtK82kUS9RvF/5rGVaxoE9iAvJqlDkLUKdQbHUmUy0zuUrczSJXeooeEH5rKPYInBw008B8TMC1+sAfSj0KFWBHy/dxefVqacB3gM2TkjfyUp6dHa8Q//c7TT7+ScEguqULAwOBMFoeFenRN1uj0TZOukUXEDFOcISe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8711.namprd12.prod.outlook.com (2603:10b6:610:176::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 15:03:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 15:03:44 +0000
Message-ID: <26705733-0c24-4f3b-a6ce-d5f2fd8c935d@amd.com>
Date: Fri, 13 Jun 2025 17:03:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com,
 tursulin@ursulin.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
 <aEw3IRn565keDO6B@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEw3IRn565keDO6B@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0bfc22-6873-431d-8425-08ddaa8b7da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXJvdzRRbGlJUjhDTmE5L0pna0dPNEFieTg3d2ZmdTNENkJiQ2kzZzM3T0xv?=
 =?utf-8?B?UmorSnNTMVd0RlVDa1RjaVRJR0Q2Vk5scXVBZ3ZBcEsrYlhwUnZoNFlGcG1O?=
 =?utf-8?B?YWhUdUI0NDlabEthQWNwMXZlS2NxenYvSGpLY1NyNGhQZ2ZrVGhZREl3YXA5?=
 =?utf-8?B?RzUrTWNPSlVjQmptMkNURVk1WWtvMlZ0OE1pdG40cTY3cjVDZVQ1RGVSMU1z?=
 =?utf-8?B?RnZhQU9CdXdGWG5MVm4zZlpCVFlTcis2K2xxZFZrc21idU9ROEhNZnRPKzRS?=
 =?utf-8?B?S0hCbXF5UHJOck5zbjlOMUFnUjdaemx5VjVaRHpUdkZjd2dkRHVBaEhsM2RP?=
 =?utf-8?B?Ym9XazlDSVRRYzl1aUc5MFAvN0YrdHJJMUQ0VnIzeXZyYXA1b3JhRXJ0TVpW?=
 =?utf-8?B?dVhLeGNLSmFaK2NpNW9PUE1YSXJkTGlFZVdQZ3E4VU96NE1nNlhVZW95eUhL?=
 =?utf-8?B?MDF4bkUwZklHSVBQMStVTE9yMUZ4RjFVMU5MaUtrWjVmbFFYZ09ZQVU4c2xj?=
 =?utf-8?B?Z0xjMStiYUx0Mi80eTRDdEhzUnBNK3c0N1BlKzZkZEJLbHA4TGVZR3cyZkVx?=
 =?utf-8?B?R3dESG1SaU5RQWcrNE4vN0tsUkU3aFJ0NEF1VTRQTlVFWWdyTWJuZW9MZWhp?=
 =?utf-8?B?K09xM3hJWDQ1dEJPNVdKS2NaTUtHREJuL1pLeVI0N0pMaG83V0tyNTVkckVB?=
 =?utf-8?B?Q2pVaE41SFY4QklRMUxTekNZQVM5NkRTcXMramo3Qi85WkV6Vld1NHNneGFu?=
 =?utf-8?B?azV1dklBdUwzWHd1cmpSeWMzN2VzRm9ialExNmt6TEtBRWE1NWVkcTJ2U1NW?=
 =?utf-8?B?bkd3RmZyWGtuYmIwSDFSMXJTMDdDM3RIeU1lcGVWcjlBM01Jb3djemVrbm5P?=
 =?utf-8?B?bWVsR0l4alU5YXJ0dTRUTktaZVh1S2VCODVydENOdDg3MTFSdG90RlBFS2pT?=
 =?utf-8?B?bGhZZmNEWDJrU1lCRUMrc1ZqVTFEYTNyWW8rVWZHeXg3cFRLZlN4UWk5Ni9G?=
 =?utf-8?B?VDF3Wm9ySlhHZGZpZVlXcHpzNUlQM0ZRTmdwM3JzTEpEMjdJME5aampRanRK?=
 =?utf-8?B?eVBuYU9BbDkrdWVoTnZsOGlHek1LRURJeGh0TFNDblVIYmdrQU9EOE9MR2pW?=
 =?utf-8?B?WGFmQjhnZ1FVV1ZSNkhrL3JDV2tOdmhPZ21UMjFHV0daS3JKeTBBbmtwUm1N?=
 =?utf-8?B?NHdjZmNqeUQvaXRmT2k4VDd0alZKOTY3enRBTkFGbGh2N2hyS240bGFwTGw4?=
 =?utf-8?B?U2J6VnBqTjdZaFNPSUlFa2phcUNRMEdXdUM1b3N5a2JSR004d1VkT3FNZ2VI?=
 =?utf-8?B?NCtLeVFQOWd0LzhUTVorbWhyaHlwWjVCV2dzK3YraUhtay8xM0YwTW40QVla?=
 =?utf-8?B?dnVHaERJdDAwR3FHRlNPeXg3aS95SkgrSFEySFlZcFIwbG5mTzlFd1c5R2lP?=
 =?utf-8?B?cGx5Y1RVYnhoQ3dqRUUrVjZDdVVLZmZkbDNyNi9Zb2ZDNG5IQXo2bGpiMnBD?=
 =?utf-8?B?ay9idUFTY0g4UDh4Sk1tSE5OTjUrSWJKVHZVaDNCZkluK1FMbmRvWmVYbVlK?=
 =?utf-8?B?SGxsSG04U3BIMEx3Nk5xTTRuU0F3dnZEMWxwMWRLQmtUTVdtTThSZGtYdnVp?=
 =?utf-8?B?cHFpSWNOTzJHbWlaYnBRRENxTHRyL3ZSWkQ0MUxLK0lQRSt4MUpQNHZuV0t5?=
 =?utf-8?B?T25NVnlzNk9neUI0T1p0bzBDZTZkOGxmei8vTlFDZW5xTmR2NmlOeVlkclli?=
 =?utf-8?B?WG1nQ2g3dVg0c3BMTk5YenFWVHNwMVZOTllObjh3b0ZmRU9XTkh2bkpSSHRs?=
 =?utf-8?B?R3FETHUvSEFiV3pHRFFBbkQ1dmJZejZMajlraUNKNXd5OUxDZkgzZm5MUUhD?=
 =?utf-8?B?VlFLZmVVbm5DMFlzZm5jKy9HUmFnNWtXelZjbGpmOG1XOUdWRjE5azBka2kx?=
 =?utf-8?Q?sqKSBuYWo+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTk2UEQxU0FjWW14OTdBSTF3MExWSlBWN09jNEJ1dmx3dkdrdVZMTmdKdlZh?=
 =?utf-8?B?MFRIM1VjWHlKcHZGKzVSek9jcHg2V3R1bHl0SGxSVW9uUEtINzFGRFBENnc5?=
 =?utf-8?B?cWdJRUUvZmxVWGdPL0JrcFVuSGwybHZhY1Vkejh4bTVQRVhQeFcyVGlNVkRi?=
 =?utf-8?B?aHRUa1phZTVOUFpVWjRzV3FWRGZCR3h1NUVjM1VwODkwMGJUcXpsUGt5Wm1q?=
 =?utf-8?B?VzBROElzYnhoMUx0bWpIcTBlVmpEdkE1cTg2TStYTUo0U1B6R01OTUE4RXA2?=
 =?utf-8?B?N1lBOVhQSnlkbEtVdGdRUHo0MW9hRzRjeHZFaFBWQjFNR2NiN3VIRWtVUWZy?=
 =?utf-8?B?WjZkZ3QrYjJ3RUJnRTBHKzd5dk5BUTg4UmtKaTRPWHZTZG1MQ1BLYmFkWHNK?=
 =?utf-8?B?cVcweFVoSXhidURIYW5LcVZYZ1dLTVdya3VoNnppZU9SdjNCNW1iL1pOY2lq?=
 =?utf-8?B?UmQ0aVVEbDB2NXRXOXNIMWY2cEovdmkvSmhzWWIxS29xVFlUN0NjdGJtNkpi?=
 =?utf-8?B?MGFsMk40SFZXRG9aWVlGWnBRcm1BMEV2a3NPczJka2R4L3NYcU9ZSHI3VkFU?=
 =?utf-8?B?QnhkdDZiaStRTWFwUGhLU2JGZWVaaisvZXpENFptc3RtMythQU4yb3QvaG53?=
 =?utf-8?B?UlFPN1hManFnS0g2bVhWNy9aSXRyWUlRMGx1VlM3eHhIT292NmY0WHNWcWx6?=
 =?utf-8?B?RGxPKzNDNEZJVkUrajZCL0hpZS84Uko0NElDbEh5ckRLMGNmVUJCemJZZU1C?=
 =?utf-8?B?S2Z4NTNFTnQ3QnI4UmVDRUt2Q3IvTUxyQW9zNVMwOTF3em02UTMzR1FVSHdo?=
 =?utf-8?B?QWVvRGlRWm5WMWxxZmRGYzlINGlWeE1RZEdCSFRFMTRhOGhOR2pmT1Z6V1VB?=
 =?utf-8?B?MWVWKzIwYkhiVXRqZ2NSU04zM1N4V2Zia2VCelBKQWczUG9vMDhUc05pUUxR?=
 =?utf-8?B?eDFyUjRKcUtUSnB1ZDl3NnlISkVyR0hIRjBZMVFCOHk3OWxSU3RwNGhnNER4?=
 =?utf-8?B?N1FsdjUvVmdKOFhzUkFERTIzMk92UnNyVzlkWUlEcWNXOEExRVNyU1J0bGNa?=
 =?utf-8?B?YlJkTUdPRWpnbWU5RVhGMjhTNkMzZG5xRGxzSnF1dUpGeXdxTU1WZlZjdmtY?=
 =?utf-8?B?TWJUbUd0NWZHMUR2QmJXaFU2RVhBRzhxdnI3WW11ekxhUkg2SU82WXEzbCt2?=
 =?utf-8?B?OEZMWCswdjRRU0VXeU5xbHRYaVM4U3ZlZVh5ZEhWTE5xZFIwNnNiK05rbk1J?=
 =?utf-8?B?M3BSblVnRC9JaVE5QWt3aXpQM0VoZkpKTUJrYm14a1k3U1lqQnR0S3pHT2Rs?=
 =?utf-8?B?dlZiUGN5TXFhN0E1NW9pMjJkMXptRDVjYmJiYnZGMllTdkZMKzZxWW1lbHhr?=
 =?utf-8?B?d0FMTjN4cDRUcG1BUzdSbkZSRGpGZ2xIMHVPSERJWjhRRlMzTkVUbUpmMk1y?=
 =?utf-8?B?KzNMdWZyWVhiTWpuUmN0UHE4NUYxWlpxOGJ1U0Y3VHdSbTlXOUVYdFFUN1A4?=
 =?utf-8?B?Z0V5SVNkbjNYRmN1Qy9sVGRxcldHRWtjZEc4N01oeEhaMk5SY2lKaWxBTEtv?=
 =?utf-8?B?VEwzc3VjeGEzME5nV0w5bG5hUldJRHA1N3RaSDlvbUVRQStsUGdoRjJFejBn?=
 =?utf-8?B?NlJ1bUUrRVJBK0NHWnRKaGlEb202dGs3djBOR0FnZWs2Q0NkU3JVeU8zalFG?=
 =?utf-8?B?UWhySEdaZ0tLRDBISk1QZkVYa0pQQmRMSUR5VHVabkQvTndta2RobWYwMi9S?=
 =?utf-8?B?K04rb1ZZbUJFVm9KZGtCSFZkOVBpNSs5T2tPZHhkK1RCR0NCSitVU2J6bnE3?=
 =?utf-8?B?QVhvVTFwaDdpSW1GdGtPN2QvZGJXS3BYbE81RFVnbVJZb1lHRGRoY1NBRjJ2?=
 =?utf-8?B?S25rUnhjclZ5aTY5YS9NYkJWWU91M20yZWprVXNzZXhJMEFFbXhVVG5ONElj?=
 =?utf-8?B?aHJMbVVOZ2cvWnQzdlZKclhTQW11ZU5obWpMa3JsTjJMRHRkQXFnODRpdlBF?=
 =?utf-8?B?RWxGVWJ2QkNJREFhZDdqcXgrdlNkZkl5Rkd5RXE0NFdXOXVuQjBkOWMrdm4v?=
 =?utf-8?B?cnRHUWNMR0t4TGtETkNIdHlkZnlvQXl4eDlRMjl5VzdSMDhFd0IxcTNLT2Qr?=
 =?utf-8?Q?Kuo0SLR6QXliBdUG4TNy/DZAN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0bfc22-6873-431d-8425-08ddaa8b7da0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:03:44.4263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUXYMsBsadQV9x8C88Y3JZj5O1MA/H2nEmTFTaLXofeKafibE8J1VFBdN9F4mkyJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8711
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

On 6/13/25 16:35, Simona Vetter wrote:
> On Fri, Jun 13, 2025 at 04:12:47PM +0200, Christian König wrote:
>> On 6/13/25 16:04, Simona Vetter wrote:
>>> On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
>>>> It is possible through flink or IOCTLs like MODE_GETFB2 to create
>>>> multiple handles for the same underlying GEM object.
>>>>
>>>> But in prime we explicitely don't want to have multiple handles for the
>>>> same DMA-buf. So just ignore it if a DMA-buf is exported with another
>>>> handle.
>>>>
>>>> This was made obvious by removing the extra check in
>>>> drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
>>>> find it in the housekeeping structures.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>> index 1d93b44c00c4..f5f30d947b61 100644
>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>> @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>>>  
>>>>  		rb = *p;
>>>>  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>>>> +
>>>> +		/*
>>>> +		 * Just ignore the new handle if we already have an handle for
>>>> +		 * this DMA-buf.
>>>> +		 */
>>>> +		if (dma_buf == pos->dma_buf) {
>>>> +			dma_buf_put(dma_buf);
>>>> +			kfree(member);
>>>> +			return 0;
>>>
>>> This feels a bit brittle, because this case should only be possible when
>>> called from drm_gem_prime_handle_to_dmabuf and not from
>>> drm_gem_prime_fd_to_handle() (where it would indicate a real race and
>>> hence bug in our code).
>>>
>>> I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 
>>>
>>> Otherwise yes this is the functional change that I've missed :-/ Note that
>>> there's no race in the original code, because it's all protected by the
>>> file_priv->prime.lock. Which means I think you're claim that you've only
>>> widened the race with your patch is wrong.
>>
>> Yeah, agree. I'm always confused that there are two locks to protect the data structures.
>>
>> But there is indeed a problem in the existing code. What happens if a
>> GEM handle duplicate is exported with drm_prime_add_buf_handle()? E.g.
>> something created by GETFB2? 
> 
> The uniqueness guarantee only extends to FB2HANDLE, because that's the
> case userspace cannot figure out any other way.

Well that sounds like you didn't understood what I meant.

The problem here is that we mess up FD2HANDLE if I'm not completely mistaken.

> For flink import you can
> compare the flink name (those are global), and for other ioctl like
> GETFB(2) you just always get a new name that you need to close() yourself.
> 
> I guess if you want a unique name for these others you could do a
> rount-trip through a dma-buf :-P

I advised that before as well, but exactly that's what is not working as far as I can see.

Let's go over this example:
1. We have GEM handle 8.
2. Export GEM handle 8 as DMA-buf and get an FD.
3. Import the DMA-buf FD again with FD2HANDLE and get 8.
4. Now 8 is used in a FB config.
5. Somebody calls GETFB2 and gets 10 instead 8 for the same BO.

6. Now FD2HANDLE is called with 10 and here is what happens:

	drm_prime_lookup_buf_by_handle() is called for handle 10, so we don't find anything.

	obj->dma_buf is true so we branch into the if and call drm_prime_add_buf_handle() with handle 10.

Now we have called drm_prime_add_buf_handle() both for handle 8 and handle 10 and so we have both 8 and 10 for the same DMA-buf in our tree.

So FD2HANDLE could return either 8 or 10 depending on which is looked up first.

I'm not 100% sure if that has any bad consequences, but I'm pretty sure that this is not intentional.

Should we fix that? If yes than how?

Regards,
Christian.


> > But the reaons dma-buf import was special was that before we had a real
> inode or the KMP syscall there was just no way to compare dma-buf for
> identity, and so we needed a special guarantee. Probably the funniest
> piece of uapi we have :-/
> 
>> IIRC AMD once had a test case which exercised exactly that. I'm not 100%
>> sure what would happen here, but it looks not correct to me.
> 
> Yeah I think the real-world GETFB are only for when you know it's not one
> of your own buffers, so all fine. Or we haven't tested this stuff enough
> yet ... Either way, userpace can fix it with a round-trip through
> FD2HANDLE.
> 
> Cheers, Sima
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Cheers, Sima
>>>
>>>> +
>>>> +		}
>>>>  		if (dma_buf > pos->dma_buf)
>>>>  			p = &rb->rb_right;
>>>>  		else
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

