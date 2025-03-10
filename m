Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F21A593CD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B019910E40C;
	Mon, 10 Mar 2025 12:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="veavDqpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4CE10E40C;
 Mon, 10 Mar 2025 12:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl9pIOx/NdcHnNcKreFtiOyd4AI63tTKJIQ4TfrUgM+9A4NjhNSNpxCs6pHW6ezycRH8qvFVCgrtKOGqZQBZW1VRph7oGhIZyjmdGlW6VUE0Xw4IY5ng22K6Hzlp+i1eLjBxsFSrttnjEFJ9CufLmcy3wxY+ARkNg2sb63/KljlkYR3G64VTy2eAEvYm+WQbc7yPaJLVwP50GHtmTsQ9E286A9xsUESa6wCuAoeZ2si2lrMHrvRtU9tOOfSys9twPgWwbVvHU4CCS+koi0ybVqrHFVQM5ASDB4qzeSOr4zCQwVO5I3iE/EezYpD+6UQA0IFOK1FCflzBYkdH59zYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82f1UyiaNYG1HG3gL1xgAhaU/JBLuE1aQWPQu9RDmf0=;
 b=n8UkmbCy7athvDx0VoTSgbFCC+8KVW8BP1e3DkjtzTIEjFxQeqfoMaMfx1L6MNhiqV8AoRH8YHIFKez5sJeran/HmonEmD7DGzeYIPlbt3Grq0gwCJAD1BQ3QBE+ysQr2wW0SGAecZ40/xSM17Mx6IWUgcUVHe0NSHvu3B0ioNhz1R4n5/1gK7vYWGCGl99S+S9xkRWfLIpa7ceu9QR6uixXW0kRLaFY+mNLK7SStsmY9VtfAKqET2hGqQsuzdVh4voqe+895LN6IQ9L91biYBzLkmZ/+sbfBifJ4aV3RP1kWUykALODL0bz0I2SZDit0Hc1OIj+TIeVwjAJ3ufqWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82f1UyiaNYG1HG3gL1xgAhaU/JBLuE1aQWPQu9RDmf0=;
 b=veavDqpKq8gzCSgsRLigggZSF9NnRvlP84jEcQ2Wxt8m+YQdLreHc14COq8wKQhZ0CjqBnVLSvtKsQykaEJ5hJrEUGLFG7m4lV5goC1iYQHA9Pe4jtydG6lUwCQfF/bfoweR+/yfmsQYOUxLTyF1yuhB8zFvFShTMxJnwrK7PPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6917.namprd12.prod.outlook.com (2603:10b6:806:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:12:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:12:02 +0000
Message-ID: <b2068f4f-c832-4cd5-b9bb-e175217d7647@amd.com>
Date: Mon, 10 Mar 2025 13:11:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: amdkfd: Replace (un)register_chrdev() by
 (unregister/alloc)_chrdev_region()
To: Salah Triki <salah.triki@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250305210809.218138-1-salah.triki@gmail.com>
 <a5b1d94e-30ee-411c-88f5-1e340068220c@amd.com> <Z8tEti/ZRbx5pt5M@pc>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z8tEti/ZRbx5pt5M@pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd902b1-7b60-440a-0dba-08dd5fccc412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHVZdmMzaVRoWVpQOW9wYWphdEY0SHdJZ3RNcW14Umo4MSs3OStlTHpTM3Jk?=
 =?utf-8?B?d2xDVTdrSmx2VWswTVR6WjBMdDZralEyd0FlVW1KbjFjMGJIRTJDSk9IUDlo?=
 =?utf-8?B?UklaU2VYMHZxOHA5RlhtRDN5aG82VUNpaEg5WE9SYmFOQ255NmRXS1ZsQWpN?=
 =?utf-8?B?SVhkL0pvdVZIMHdFTDBCRnJFU05PZ1lUMkd3eWIweDRuV3hna21qRHNJRnAr?=
 =?utf-8?B?cW94MjhxQ0JUSFlWY25uR3BHMWpOakJNeGhCOXdVOWlIYUJ0M0s4clVQelpF?=
 =?utf-8?B?SzdaUWh4VmZHclFvQmxjSEpuaytJVkNBY0Q3d1c3b3VqWENNck5aVDU0bXlj?=
 =?utf-8?B?VlVzblpIY3A1Q1gvMzMxMDlIZTByUjRvZkZVQVU4SlAvcmhFdlJJMHBjZGc0?=
 =?utf-8?B?V1pRMGhUNlNHUFpteUlWRlU5NlBDSXZkeXFJN1BOT2dCTVpLRDRjT2ZZTnhr?=
 =?utf-8?B?SmZRcSszMTBuNmNFQTNOY3lmdmZMY3owMzRadHFsU2t0K0MvWTM1aXhYWjNk?=
 =?utf-8?B?enY5U2NsU3ZEWGJOWVh2elY2aHZpakc5ZjFPQmZybXBBZHlzWGovZjlZZDh1?=
 =?utf-8?B?dDNyRmhSZW1zaHRjUjErTWlGclEzQjdpcVVMWVRwMk5ZQ0NCTUhQT3ZxMity?=
 =?utf-8?B?M3JYajAzNXBHU0xTUzlXWlJFM2VxL1R3TS9GdkgvZTBCQW5HdlhxUC9aQk1E?=
 =?utf-8?B?YkRuNG5vSWFPUFRSSVowODEvcXVHcjlscG5LLzFMU3IrcGh2Y0djbzJCdGlw?=
 =?utf-8?B?NmRTanQxNXdmd01aempLWmd5Uk1GQ1RxQlNvNCtkTDhWd2NLeFdjS3NzSFZW?=
 =?utf-8?B?R3pReXNnZHhDbVFhZVNNT3VGMlVjcVpnL1VNS0pyWWVUdEpEWjZUeUJISmhV?=
 =?utf-8?B?V2Q0T2lXQ2hrUVZySElLTnJSdGllYlNLR2h2dnRXczNDd1BpQUR3Snk1ZHVz?=
 =?utf-8?B?MDVjZTdVODQ2S09BaXRlUnNoNUpQVGM5ZTlJWnJCL3ZBZWtDK1ltbmFFL2o0?=
 =?utf-8?B?Q0ZkSlpnZllYbER1R0JsU0pTSkwxNVZlM0FsTTgwckdNUzVKdk5Xcjd5eEQ2?=
 =?utf-8?B?OTJCdnR0aW10REZYb1dya0pKVVpCMXpDUEtsNDNtSE5LRTkvZXNVb1plYS9J?=
 =?utf-8?B?amw0NGppWi9uMXdnZGxPd3NGM0xzT0k3MEVyQnBoMUhRQlJRLzIvclRXRUZk?=
 =?utf-8?B?UUtVZUZYZ0M1aytpZEVabi9VZXJqTlRKWWNLbVRGZ25EMDNrdnVmNk02Sm5S?=
 =?utf-8?B?a3ROdUNnd3JKL3hBdnFKV0NFemU4OVZ3NTE4aGppbFYrWWhiaDZ6M1lhNlFM?=
 =?utf-8?B?c2pTT2l4NHcrMVFGRE9MdExKZWdJQmhDalpMYXRCNnBIYnB1WlVoNEhGMDIz?=
 =?utf-8?B?eHR4ekkzRUpLNzEyN0tXQ0lzcW1oZjU0SERwYVRkSlZmVVVYZmxrazhKZzJJ?=
 =?utf-8?B?ZkZDa3BZVEcyd0tUb2N5MG1ZS3lLSHhMVTR4c29CVGtqYy9RS2VDWWJnTCti?=
 =?utf-8?B?Z0dpN3NJR0ZwM000cXhwSGJ5N01IZEZZa2c1Sm1vRVRhRVM2bXBzVzJSQkNF?=
 =?utf-8?B?YVdkMUI0UXErbVlxQWo2b0drN3prTG5lK2UxenJGUGxEdGhOdi9DZ3N0dkRn?=
 =?utf-8?B?aEdFT1ZKU3IvVEFPMGMyZnM5MHppRTZLZW55QWZZUWZWTnpvOXM5b0czd1Ny?=
 =?utf-8?B?Q3p2UVNQdnFZbWdqWnlJOTRuTkVBZW16elRzc1haRDFKeFJlbG0wNGhNOWMx?=
 =?utf-8?B?bUlsenNXZW5TR0QyOVJhMVNFSzFzUUxzc05ZeWYzWjNTTXNZaTZNMEFLbW8v?=
 =?utf-8?B?b3hEYkdvdEZ0akZKOHczdFE3RTh2aGxzZmRhUzMraTZvYnpoUnF0QUo4WXNF?=
 =?utf-8?Q?4tdyix5oFYBI7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9qZGd0VEV6TXk3cUEwVm9vU2VQc3VqYUJoLzEwdXUvL2pQciszR1ArSGNo?=
 =?utf-8?B?b2hERWFubjBUQUZZaDRLNzR0bUtpL0FpTzFWbVVBb0ptajZOUHcyaHRoMU45?=
 =?utf-8?B?cDM2aVNndStVdHBUdGpNQ1FqK0VSUHIyQmREWTl2QlNFUTdwckJRMTM0K2xy?=
 =?utf-8?B?RDJjOGFYWXpNQTc0bXVIbUVDaSsrei9CWitxUDF5dmFwc0xHMm1LV25QMFlC?=
 =?utf-8?B?ODVyV1hzT1NaUWx4ZkRmY24xUlN4ckVyTmNPa0ExYURJb0t3RU0wOGlDMEtJ?=
 =?utf-8?B?Vm9zWWUxSWRBQ1U5T2JUT2ViQjhNMml5Rjg1WDh2RTB0Ym13Q0t6YXBoays2?=
 =?utf-8?B?WXpHVmI5T2MxZW9xdko3RlNWcnJVK3d0cVNiT24zWDR6Ni9FR1AybFd6ZWtH?=
 =?utf-8?B?bGdKemZkQnNmRDdkSjkzbW1zVE8vb25qMDBLcUhIYXVDaGlEMlI5T2lDNCtN?=
 =?utf-8?B?VXNscGZGT083RENLTlpzZEtwUGpCTTB6WWNEbXhCY0l4aEFEa3A3QUdobHlP?=
 =?utf-8?B?RU5Hb1BNQ2Joc0lpWUZaNVRjaEZuUXBqTkQ4S1FsS093L2NkZVRmZ0xBM1dh?=
 =?utf-8?B?ODBwU1lzclBCUmlVSHZ3YjBWWkZTOHBTcWtSTFVheVdiU2VwVWZoSkdZR1Rh?=
 =?utf-8?B?ZVRXbFJqMy9nS3RKTkh6VitSM2V3VGM4SThBY3VLNHptV1pkVFp5ZHhHcVQx?=
 =?utf-8?B?QlRLWk1XNGR5cXZUdk9JdEIrL3pTL2xNVy9YZEZiOTlkRWg3azRwYWhoSVpD?=
 =?utf-8?B?SEFCeTJBcGREQW5zdmlHYlp6MVBaOGtHQkVSNmtISVBybFhsVFg5dERNREN6?=
 =?utf-8?B?bDJGTmZEemNxeU00cUJSaTJ6YXA0N3pmM2tXZU5tYmtsUUFOcTk4ZHluK09y?=
 =?utf-8?B?cGhkd3FIYzRsUmREU2lwRmZjaG5sV05NclZSVC81THN3QTJPMC9UT0tYUk1w?=
 =?utf-8?B?VWFDV2NZbG1nRFVxcEpab2E2b3Mzang3Ym83aUVuTW5uaHluUWxqSUVoU2l3?=
 =?utf-8?B?cU81SVpKYjc4aXkxdUllWlJ1eUZZQ0NNN0NOTkRIUUgxd01NeTRSQXJ5dTNn?=
 =?utf-8?B?bmhHM1lzeHFYYm5KYjNJT1BxaE9yVVErbTRlVVFPcmg1SDBYMDY1RFh6Y04y?=
 =?utf-8?B?RnRHNi9NS0dOeDdVVlBTUUZxTEQxUmdpaTBQM0xFVENMZ0NLQ0RTUmpiUHEx?=
 =?utf-8?B?SGtDUTZhendYbWtwSkNIZ0RhRFd5ZkhiM2VtdFdCbjdhUU84ZU1SZ2oydGpt?=
 =?utf-8?B?cDVnSFpaY2gwdVB2Z0IxUFEvZHMzSWVrR0pGV1Z1cHJVaFNmanVhaURXUVRY?=
 =?utf-8?B?QTk5N2hFVzFSVGtxbXl6THI3RUpscnFSTUd4bG5kNHo1clEyMFBVVGt2cllw?=
 =?utf-8?B?VXhoZVBjeHRqbFhPUHU5NjJKWVpsTEd0R3hld0ovOFNMc1hjQ21lUStIR080?=
 =?utf-8?B?cktCYmtwMW1yZ2gwRzdEU3FkeCs0dThUNVlWUHEwT3RJOGVidUpkWDRZc0ox?=
 =?utf-8?B?TVJPM2dpQ3JHSHV0QUFiK1lIdWtWeTk3bUFpbkdmUU93Y3NxWEM4azR0cnoy?=
 =?utf-8?B?NTc3Mkc1RGRaU1VnelY4VkYxWmsvTmdyUml2Vmlrd0l4aTRLdVp3U3NEUG1v?=
 =?utf-8?B?aFJpbURwdjRHMU9MdjhYMytQZlV2TTJHb0tkekcyQUNSazZONUJYZVBkV1l4?=
 =?utf-8?B?U0g4aGhWRHdEMVlDeCtMakp4Q09uOHNURE1Eb0ZId2piQnVCb1dBblRxTWdk?=
 =?utf-8?B?SUF2ZUhHTGNaaWFSb3ZFWW0yUS92Rmg2WTNDSWpDMFBmYnNLUm16dXVJWWFh?=
 =?utf-8?B?N3czc2lDVWNpVTR2cTN5UHlYc0xlYkppQWhjWlFmTFdqRUoreWNNUW0xNFdZ?=
 =?utf-8?B?NWxac3Q1aXQyalVzaGRVT2JKZ3ZmNWc2WXloNVQyaDVDNm1lZ3NIYUtINzli?=
 =?utf-8?B?cloxRWlwbkxRdEEvbE1LN0JIN0ZJMEdlNGdiOGg2d0JKUDRYU0dhZVpWNWV4?=
 =?utf-8?B?SklpSWFLWDBRZWU0bStQa211eFhuaDJMMVpHMzZQZXpvdHUzUXQwRUU2cTd0?=
 =?utf-8?B?SU1aQ3dwL2FaT0daMVQ5N3pUc2ZKei9nUElZM1QyemFkdFJ2bjQyb1ZSYld2?=
 =?utf-8?Q?ARK4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd902b1-7b60-440a-0dba-08dd5fccc412
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:12:02.5932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNxEsTlkGmneK2gHlh+3ssMjNKWfTcOnEMCq8PDlo3AQMtBgc+FD39y4y5RAss0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6917
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

Am 07.03.25 um 20:10 schrieb Salah Triki:
> On Wed, Mar 05, 2025 at 07:18:33PM -0500, Felix Kuehling wrote:
>> On 2025-03-05 16:08, Salah Triki wrote:
>>> Replace (un)register_chrdev() by (unregister/alloc)_chrdev_region() as
>>> they are deprecated since kernel 2.6.
>> Where is that information coming from? I see __register_chrdev documented in
>> the current kernel documentation. I see no indication that it's deprecated:
>> https://docs.kernel.org/core-api/kernel-api.html#c.__register_chrdev
>>
> In the book "Linux Device Drivers" 3ed of J. Corbet and al. (2005), it
> is indicated that using register_chrdev() is the old way to register
> char drivers, the new code should not use this interface, it should
> instead use the cdev interface. 

Yeah, but that doesn't count. Only in kernel documentation is relevant.

Regards,
Christian.

>>>   alloc_chrdev_region() generates a
>>> dev_t value, so replace the kfd_char_dev_major int variable by the
>>> kfd_char_dev_id dev_t variable and drop the MKDEV() call. Initialize a
>>> cdev structure and add it to the device driver model as register_chrdev()
>>> used to do and since alloc_chrdev_region() does not do it. Drop the
>>> iminor() call since alloc_chrdev_region() allocates only one minor number.
>>> On error and in the module exit function, remove the cdev structure from
>>> the device driver model as unregister_chrdev() used to do.
>> Sounds complicated. Your patch seems to open-code a bunch of details that
>> are neatly hidden inside register_chrdev. Why would I want all that detail
>> in my driver? I don't see an obvious advantage.
>>
> register_chrdev() registers 256 minor numbers, calling it will result in
> calling kmalloc_array(256, sizeof(struct probe), GFP_KERNEL) whereas
> calling alloc_chrdev_region() with count parameter equals to 1, which is
> the number of minor numbers requested, will result in calling
> kmalloc_array(1, sizeof(stuct probe), GFP_KERNEL). 
>
> Best Regards,
> Salah Triki 

