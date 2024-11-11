Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75899C3D65
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 12:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69CD10E47E;
	Mon, 11 Nov 2024 11:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0IfKMm/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B854B10E1CF;
 Mon, 11 Nov 2024 11:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDpV4GY4WbwT6pyFR0De3NnHkDPXuCZXAhEtPGQUkqESm+rinrDZo5IizePFapK7rsBKuRKyZg0ISUkU1Did0wgzduR2fW3H4ekQLIPuV9CPRjnNQTnQJZ7xrds0qx1Mg+EZpZ4vazcY50hJBRKwPTI4RIu6RNiciSEV1Nvwgs313R/65hFSgyMCwCwRod6Qtnlfv/BeSuLQnTHHvhbBcQgdFmtqfjeQBykqTap1PPtRcD7oqcJ3eBjt6Gdq4dvZjn00axHtK+0hoKfzCAIzK5n7GxZr3Tb7D6gfPlZ5zVGQ9fUdCds4Y8rxQ7N/snQdYA7UlAUz3aLrH4TxBmbJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkt14NENGl6RqMQmG00NXQMvh5zFkY7cMG6NQcz8Hyc=;
 b=Xfhwia9CU9dsDQwP3FhD001j0B7e/shawYe8THjINDzbWpGvM+JPU93+bH5uxVvnSA8CkavDmtLd8fznAfE4aG9/8TVe3Y5D6xoq5M5+olMZ4n5LAeJdab19PtJ8q+ceyTHmyJXkGBfkecIChrh+XrzfqwgKvUjInlbYd9vPEfKRRMUdGOg3fnLMG4HF9uZBGju2c9uNMMLOEIoFOp2t8SVi7NrelFz6nBj1jnM0qiT1SJ9Mjwzq0QA4WPusnZZGDcCmIItVh8N2EW3t9xbJCV+ixFsIrfKl8Kv17d5Hp+FCGKQcwUwvj1gTMCfDuVzYPp7ZiuFxpOvx+CH82sxDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkt14NENGl6RqMQmG00NXQMvh5zFkY7cMG6NQcz8Hyc=;
 b=0IfKMm/Kql3edwoDSj+bMxCHXjGOh/KPj4ZCykDH/lTIlk+AdsW6BdibriUOgFnIbgdz/Jq8/7c4o/PhJDi+WwmK/OVJxpGk/nQJsAYyOym8T1QQFCnttpkkLUGd0hxPstfPeVlIMsqh0XB08tGuDz0Viho7CJJVEbC2hFRX/LA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5768.namprd12.prod.outlook.com (2603:10b6:8:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:34:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 11:34:18 +0000
Message-ID: <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
Date: Mon, 11 Nov 2024 12:34:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4cbce3-2738-4ec9-bc75-08dd0244c78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUJydlQxMHM5RVJodThnUy9xQVBrU1p5TGo4S1V2NWpSQ3hXN1VYVTVYUk9J?=
 =?utf-8?B?OTRRMU10dVh5cnVVbmw5d2pMVGJTSVpzUG90Wm9QeWp3RFdVdW1teXgwSFBH?=
 =?utf-8?B?aGZuOGNhejJ5M0wzVTRpTkh2cm1PN3lUUERKQTBlWVZWRnFKOERlWFdSN3k1?=
 =?utf-8?B?THB6dm5oajh5bmdTaUxYcDlGbEhDQy9iTStjbGQ0OExEQVBOdHVpMXJaaHcx?=
 =?utf-8?B?Nmk2Q3JzYi90YW5oVndOTzhRSE5ZRWY2RGt6NVA5VFl1TU9KWjgyRm53T1Nw?=
 =?utf-8?B?cnE2U1BFeDc3SVRaYWdXVzBmRDBYZWtqazZWVmM1OUtwV3MxWlhVVC9pK2p1?=
 =?utf-8?B?cHVhWjNKZHVsM1NnY0hoaThnZU15UXVXU2xhZWorRGV5WlF2a3JlM2swUmdM?=
 =?utf-8?B?aG8xTHlEcHFDNHBlZ1Q5UEVxdjJ4VVFoUitKN0p0V0MrcTlDQ0o4QzNrNmo3?=
 =?utf-8?B?d2wvSzhxMnpzcW1LbWdOYnpsNFhYYWVORGhPL1l4cDZkL3pCTzdQTWxqdkdG?=
 =?utf-8?B?UHpMOWxPNUtOVkE5VDRwQmh6ZmJsRHFlcTRsTG1weldXR1Qxd0FoQVRYaVQ3?=
 =?utf-8?B?R3dUWDBJNGdldHp0ZzFONStHQzMvQURVRGdsYUQ4UWJIUS81VUkxTXFWRGcv?=
 =?utf-8?B?Z0ZzOEd3M3Bub0lVZXhLNGdub2hmV1d3aWc2WVdaWXJiamVXd1JSeXQwUUVx?=
 =?utf-8?B?dUpGVytyQlUra01teDlBYXpzZklhRXovV1FuTVVXMlVHb0hOZUlJVHV4RHRI?=
 =?utf-8?B?NG5VenV0dlNDZnJLcGZ1aVVZVTJQUVZxUTE3VGQ4TnY3d0FMRUlyd0ZCTDlu?=
 =?utf-8?B?MzBOTmx3dEdEcGRLUTJmdzJSM3gvT3p0Skp3bVlEVGE0OFllNzZFMHBGS1Zi?=
 =?utf-8?B?Yk4wVVlwZ1pKdFZMcnVobVR3UjlLRHQ5MjIrY3hwclA4UFpIYzJkY3RueEM3?=
 =?utf-8?B?RkxtVis1a25xQkRyRkNUTGVqbnl1OWhvN2lrNHduZ0draGNqM1ZUNHA4S0FZ?=
 =?utf-8?B?amUzb3FDcDhZaW1SamlNVGFJUnpUcjgramdMejAwNS9ob2NieXd5eWhrNmdW?=
 =?utf-8?B?L1EyZHFKSlp3UCtXTituTXFVdUVVcElsMTRiK1hQWWJ2a2RIL1JmelJMY2pr?=
 =?utf-8?B?Q090cFY3Mjl5OGJ6d3pBRnZNZXhsNHdPT0lrYmx3Wk43QVB2RnNHTTlaY0Zr?=
 =?utf-8?B?ejk3a2h1UnR3SWxpeGZ3alZxMEdzOU1lN09tYmh5Z1Z4c01LUkZ3dzFvbHpy?=
 =?utf-8?B?OXpqS05FTWU0T1htMnY0Sm51NTVYMnBCWGhaeXNiWG9YOTNMVkEwU0FwK0ho?=
 =?utf-8?B?YTNiWUd2QUxYcWJieHZvaS9FeFBjWGt2aVNxQ2ZtNitiV3dIZ2FzWHc2cjgz?=
 =?utf-8?B?cVZlY0pNR0pKSktjME9RTHY0VHY5ZUVwMGREc2FKVGNsZE5IbWV6bVBZT0dG?=
 =?utf-8?B?RkNVRFRZemtWM1FNUGFGZzNpVEhKd2N4Lzh4RHVac2xpNFViOFVFUjM3eU1i?=
 =?utf-8?B?Y21KQ2lXb1lCMCs0U3huS1JuYUw3dGZlYmpwMko4Vi90bmNBMkc0NHhxM1Zu?=
 =?utf-8?B?Z2E1Ui9BbHhmRWZzeTJpNmFMVGF3WDROeVZFOVBjTUd1dURaYnVWeHRBcUps?=
 =?utf-8?B?S3NlcDU4RkdxR0doSnoxczJSMG9PUUtrZFpjMHNCTFpwWXA0dU9HeU5SVkxE?=
 =?utf-8?B?c29UclFhTHA0bGJQSExIdWxCY1VJUXVIUGFkYmNSdFJVaWJJdWxoUUh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9zZ2VuVEEyRmRBV2lHZXpqMWFEM0dKQUxMRWNaVkc5Q2lxakNDK0NIUS9G?=
 =?utf-8?B?T3BZZXNOeXBlcGN0eFF6YzZ1eEVRaWgyTVdmSEV1bWU0aHF0dk85VElGT1do?=
 =?utf-8?B?TXpCVms4bk5Zd0tncnpENDA4TEZUdlFxa1dDVGpTeE1MeVRTWng1ejZZUjU5?=
 =?utf-8?B?c0JwR1pXZ0REVTNiWjU3UEg5bHBnRUNlYWRIZmZBMTQ5b1ZYbDNhekZTRlFB?=
 =?utf-8?B?ZDBsRlZHRDRBVHdsSzc5TDNxZVowV01xdXRheTNLdnRZaFgyd2QwSDRSa0JQ?=
 =?utf-8?B?MlNYTWc3KzMrb2Z6QnlyTVd5MXZNVklEOGQwUFd5ajh2OU8zNzgvT1pNWWl2?=
 =?utf-8?B?QnFNVVlGVjFkU29rS3I5TkRnaWJha0xveXJMV1VlY1U1bU52eTFmRnRERk1j?=
 =?utf-8?B?T25ERk5FUDZ5Q2J1YmJxN0RlR0tHdHZBL3ZldTJUY2Y5VTUzSU1aUThvOEFS?=
 =?utf-8?B?L0tNUElmT1BLb3lBSHhEUm9BMmdMMENzSGI0cjg3cno3U3RyZFdSM2RPNVhL?=
 =?utf-8?B?NzR4WnlJY2pSUkk2TkU2SitocUVqS0xYa2tBaGxWbmZHeXp5akFURUp3RTZo?=
 =?utf-8?B?Y0h1OGpCYm94Rmd2aHpqbVRTbXdrY1p1K1pqRml2Mm5Ka0JQa3dCRmZRc3lo?=
 =?utf-8?B?OXd6cTJrKzdwN0FGcUk4cFFGSnBHSXZTdm9Va0p0a2g0ajBPNklZL1RhSUxr?=
 =?utf-8?B?MXRIbm9kendWNXVyaFovRVhnS2xUT1JUSnhLVlRLUnZiVElVSG8xcHh3V0pF?=
 =?utf-8?B?bXJpTGZ4NGFCTi8xVDNDN29Gaitjcy9pelFwVll5RVpKSThiTUNjVG9wUWF0?=
 =?utf-8?B?Y3FkdlAyMkNJbi9vakpNdE9RWUsvMkdpM3JzcGFNeG0zQ2hnVVMyUlI0SElI?=
 =?utf-8?B?UkY0b3pnYUVidHdScEJWOHl0UStydTlVbnpHb3VHT25yOUI3UnpVNlE0S09m?=
 =?utf-8?B?cVZIVVhWbXpYNXRUc3hBL2MyK05LeUsxOW9XWERONXBTYkp0dk1ETjRLZzdU?=
 =?utf-8?B?Y3pRTzQxQmt4WDE5QSs0SVJJRTlLQVNBdWE1TUhRTUNxUjN3VUhvSk8rQ2J6?=
 =?utf-8?B?N2x0QmsrVUxFMzQ0S0d1OGNtcnF5ZDJRQk9YTDlneWp3RUFub3hTMjhLYm9q?=
 =?utf-8?B?ZjZRWC90ZnpWY1lOM3VtenhXMTN2dlNFQ0dLc1JNTVN4ekVZZGxFTTRtUStZ?=
 =?utf-8?B?YTZ3V3BweTlEY1NLOFdmKzQ1cDcwcWljNGVOZzA1Q09sa2ZENVB5aUdnVjl3?=
 =?utf-8?B?dUUyMFJRdGd5VG9SL29ObmJKK1lmVVM2SGhienhNUTA4c2NobHRTTDdxSGd2?=
 =?utf-8?B?VzJSNnJ4Z2VlYWJZU3pqQS8wMlpzVDdseno0ODh0SE44TjR6Rnp6K2RYaVRp?=
 =?utf-8?B?QXJzdXQ3ekVYK2J1dnhCWDBEUC9iTDlRb2ZxZUxHejNKWWVwUzFGdnRlVWxV?=
 =?utf-8?B?ZTlTZVZxYlo5ZzZ5TE40ZlRtV0FHTHNaRFZqQ3NIcVozeGNqbEEvVTJlU3Bt?=
 =?utf-8?B?SS85b0V5cmRXVnBFUFg4ZlI3cFVrMVlES0UyR0VXbXZEQ1lKcnd1ZVJFSytz?=
 =?utf-8?B?b1B3SGFMTEp5YUZzS3ZldkxRYnpQR3RKUjhHam5xOW01QkdqUjZKd09Va3Jk?=
 =?utf-8?B?MWVpVUFMY2s5SEgyaTJ5Y1lsRkptUDMrbFFwWUVqNDE4anhFVUV0ZjFXNlZ3?=
 =?utf-8?B?aG5aVHM3WUw5dGRvWDJ4NXJuTE1Wa1dURGJMdis5NTRBVnpJejRtSWdUR00z?=
 =?utf-8?B?alhicXpCVmhvdXNseHpqbTB2a3JQTjZKemJhRFdHeFJoMWx0QXIyblZ4Q2Fk?=
 =?utf-8?B?TzZMZGU4TE9uL2ljTDdIajVRa00rNFFUOUhVM0p3RUpMQ21mNTBKY2xzbE5l?=
 =?utf-8?B?OGVqYTA3eHBCWGllVUo1dURneGIxRERXWWNMSWZsS1VLNDZLL2VRaG9UdlRj?=
 =?utf-8?B?ZFlCS3VDcTRySS9nTzUyc2FPZ0VoWGU3QjJkbDdSaUZqbmI3S1JYbGptTEVj?=
 =?utf-8?B?bUI2NnlLTml6NXFRQUo3MTYxUm5CWDFjSmp5ZncwQWJvbUltR1ZDVUVXTUx1?=
 =?utf-8?B?ZDNvbmNtWmhRaWx4Wk55Q2pUNnBISHlpbVF0eE1MNnFMSExiMFBFZGJab25n?=
 =?utf-8?Q?dX3KKtnDY4Js7qwPHOgbFUlbq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4cbce3-2738-4ec9-bc75-08dd0244c78b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:34:18.6438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJeUKMeCfw6oQhJvBUi2Des9Xn4RcOUET3Jvxo4JYeLrZb06ggfsEN1AIDxTsQvg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5768
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

Am 11.11.24 um 11:10 schrieb Simona Vetter:
> On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
>> Back from some time off and will try to answer below.
>>
>> Adding Dave and Sima as this topic has been previously discussed to some
>> extent and will be good to reach common understanding about what the
>> series is trying to do and what is the difference to the AMD debugging
>> model.
> I chatted about this thread a bit on irc with folks, and I think an
> orthogonal issue is the question, what should be in ttm-utils? I've asked
> Matt to type up a DOC patch once we have some consensus, since imo the
> somewhat lackluster documentation situation for ttm is also somewhat a
> cause for these big threads on various different topics. Aside from the
> fact that gpu memory management is just hard.
>
> On the uapi/design aspect, I think this would serve well with a patch to
> drm-uapi.rst that adds a debugging section? At least once we have some
> rough consensus across drivers, and more importantly userspace in the form
> of gdb upstream (at least I'm not aware of any other upstream debugger
> patches, I think amd's rocm stuff is also gdb-only).

Yeah that seems to be a really good idea. Similar design ideas came up 
AMD internally as well but where dropped after pointing people to 
pidfd_getfd().

But the bigger problem seems to be that the design doesn't seems to take 
the dma_fence requirements into account.

In other words attaching gdb to a pid seems to stop the GPU thread of 
this pid without waiting for the XE preemption nor end of operation fence.

I mean if the GPU threads are preempted that could work, but yeah not 
like this :)

Regards,
Christian.

>
> Some wash-up thoughts from me below, but consider them fairly irrelevant
> since I think the main driver for these big questions here should be
> gdb/userspace.
>
>> Quoting Christian König (2024-11-07 11:44:33)
>>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
>>>
>>>      [SNIP]
>>>
>>>      This is not a generic interface that anyone can freely access. The same
>>>      permissions used by ptrace are checked when opening such an interface.
>>>      See [1] [2].
>>>
>>>      [1] https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
>>>      [2] https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
>>>
>>>
>>> Thanks a lot for those pointers, that is exactly what I was looking for.
>>>
>>> And yeah, it is what I feared. You are re-implementing existing functionality,
>>> but see below.
>> Could you elaborate on what this "existing functionality" exactly is?
>> I do not think this functionality exists at this time.
>>
>> The EU debugging architecture for Xe specifically avoids the need for GDB
>> to attach with ptrace to the CPU process or interfere with the CPU process for
>> the debugging via parasitic threads or so.
>>
>> Debugger connection is opened to the DRM driver for given PID (which uses the
>> ptrace may access check for now) after which the all DRM client of that
>> PID are exposed to the debugger process.
>>
>> What we want to expose via that debugger connection is the ability for GDB to
>> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
>> the EU threads would see them. Note that the layout of the ppGTT is
>> completely up to the userspace driver to setup and is mostly only partially
>> equal to the CPU address space.
>>
>> Specifically as part of reading/writing the ppGTT for debugging purposes,
>> there are deep flushes needed: for example flushing instruction cache
>> when adding/removing breakpoints.
>>
>> Maybe that will explain the background. I elaborate on this at the end some more.
>>
>>>              kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
>>>              failing to see the problem with adding a simple helper based on existing
>>>              code.
>>>
>>>          What#s possible and often done is to do kmap/vmap if you need to implement a
>>>          CPU copy for scanout for example or for copying/validating command buffers.
>>>          But that usually requires accessing the whole BO and has separate security
>>>          checks.
>>>
>>>          When you want to access only a few bytes of a BO that sounds massively like
>>>          a peek/poke like interface and we have already rejected that more than once.
>>>          There even used to be standardized GEM IOCTLs for that which have been
>>>          removed by now.
>> Referring to the explanation at top: These IOCTL are not for the debugging target
>> process to issue. The peek/poke interface is specifically for GDB only
>> to facilitate the emulation of memory reads/writes on the GPU address
>> space as they were done by EUs themselves. And to recap: for modifying
>> instructions for example (add/remove breakpoint), extra level of cache flushing is
>> needed which is not available to regular userspace.
>>
>> I specifically discussed with Sima on the difference before moving forward with this
>> design originally. If something has changed since then, I'm of course happy to rediscuss.
>>
>> However, if this code can't be added, not sure how we would ever be able
>> to implement core dumps for GPU threads/memory?
>>
>>>          If you need to access BOs which are placed in not CPU accessible memory then
>>>          implement the access callback for ptrace, see amdgpu_ttm_access_memory for
>>>          an example how to do this.
>> As also mentioned above, we don't work via ptrace at all when it comes
>> to debugging the EUs. The only thing used for now is the ptrace_may_access to
>> implement similar access restrictions as ptrace has. This can be changed
>> to something else if needed.
>>
>>>      Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
>>>
>>>      This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>
>>>      The above function accesses a BO via kmap if it is in SYSTEM / TT,
>>>      which is existing code.
>>>
>>>      This function is only exposed to user space via ptrace permissions.
>> Maybe this sentence is what caused the confusion.
>>
>> Userspace is never exposed with peek/poke interface, only the debugger
>> connection which is its own FD.
>>
>>>      In this series, we implement a function [3] similar to
>>>      amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
>>>      missing is non-visible CPU memory access, similar to
>>>      amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
>>>      was omitted in this series given its complexity.
>>>
>>>      So, this looks more or less identical to AMD's ptrace implementation,
>>>      but in GPU address space. Again, I fail to see what the problem is here.
>>>      What am I missing?
>>>
>>>
>>> The main question is why can't you use the existing interfaces directly?
>> We're not working on the CPU address space or BOs. We're working
>> strictly on the GPU address space as would be seen by an EU thread if it
>> accessed address X.
>>
>>> Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
>>> system call, see here https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>
>>> The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
>>> process. That in turn gives you all the access you need from gdb, including
>>> mapping BOs and command submission on behalf of the application.
>> We're not operating on the CPU address space nor are we operating on BOs
>> (there is no concept of BO in the EU debug interface). Each VMA in the VM
>> could come from anywhere, only the start address and size matter. And
>> neither do we need to interfere with the command submission of the
>> process under debug.
>>
>>> As far as I can see that allows for the same functionality as the eudebug
>>> interface, just without any driver specific code messing with ptrace
>>> permissions and peek/poke interfaces.
>>>
>>> So the question is still why do you need the whole eudebug interface in the
>>> first place? I might be missing something, but that seems to be superfluous
>>> from a high level view.
>> Recapping from above. It is to allow the debugging of EU threads per DRM
>> client, completely independent of the CPU process. If ptrace_may_acces
>> is the sore point, we could consider other permission checks, too. There
>> is no other connection to ptrace in this architecture as single
>> permission check to know if PID is fair game to access by debugger
>> process.
>>
>> Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
>> the DRM client would also pave way for being able to extend core kernel generated
>> core dump with each DRM client's EU thread/memory dump. We have similar
>> feature called "Offline core dump" enabled in the downstream public
>> trees for i915, where we currently attach the EU thread dump to i915 error state
>> and then later combine i915 error state with CPU core dump file with a
>> tool.
>>
>> This is relatively little amount of extra code, as this baseline series
>> already introduces GDB the ability to perform the necessary actions.
>> It's just the matter of kernel driver calling: "stop all threads", then
>> copying the memory map and memory contents for GPU threads, just like is
>> done for CPU threads.
>>
>> With parasitic thread injection, not sure if there is such way forward,
>> as it would seem to require to inject quite abit more logic to core kernel?
>>
>>> It's true that the AMD KFD part has still similar functionality, but that is
>>> because of the broken KFD design of tying driver state to the CPU process
>>> (which makes it inaccessible for gdb even with imported render node fd).
>>>
>>> Both Sima and I (and partially Dave as well) have pushed back on the KFD
>>> approach. And the long term plan is to get rid of such device driver specific
>>> interface which re-implement existing functionality just differently.
>> Recapping, this series is not adding it back. The debugger connection
>> is a separate FD from the DRM one, with separate IOCTL set. We don't allow
>> the DRM FD any new operations based on ptrace is attached or not. We
>> don't ever do that check even.
>>
>> We only restrict the opening of the debugger connection to given PID with
>> ptrace_may_access check for now. That can be changed to something else,
>> if necessary.
> Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
> thing, least because even today all the svm discussions we have still hit
> clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
> sections with offsets). Not even speaking of all the gpu usecases where
> the gpu vm space is still entirely independent of the cpu side.
>
> So that's why I think this entirely separate approach looks like the right
> one, with ptrace_may_access as the access control check to make sure we
> match ptrace on the cpu side.
>
> But there's very obviously a bikeshed to be had on what the actual uapi
> should look like, especially how gdb opens up a gpu debug access fd. But I
> also think that's not much on drm to decide, but whatever gdb wants. And
> then we aim for some consistency on that lookup/access control part
> (ideally, I might be missing some reasons why this is a bad idea) across
> drm drivers.
>
>>> So you need to have a really really good explanation why the eudebug interface
>>> is actually necessary.
>> TL;DR The main point is to decouple the debugging of the EU workloads from the
>> debugging of the CPU process. This avoids the interference with the CPU process with
>> parasitic thread injection. Further this also allows generating a core dump
>> without any GDB connected. There are also many other smaller pros/cons
>> which can be discussed but for the context of this patch, this is the
>> main one.
>>
>> So unlike parasitic thread injection, we don't unlock any special IOCTL for
>> the process under debug to be performed by the parasitic thread, but we
>> allow the minimal set of operations to be performed by GDB as if those were
>> done on the EUs themselves.
>>
>> One can think of it like the minimal subset of ptrace but for EU threads,
>> not the CPU threads. And thus, building on this it's possible to extend
>> the core kernel generated core dumps with DRM specific extension which
>> would contain the EU thread/memory dump.
> It might be good to document (in that debugging doc patch probably) why
> thread injection is not a great option, and why the tradeoffs for
> debugging are different than for for checkpoint/restore, where with CRIU
> we landed on doing most of this in userspace, and often requiring
> injection threads to make it all work.
>
> Cheers, Sima
>
>> Regards, Joonas
>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>
>>>      Matt
>>>
>>>      [3] https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
>>>
>>>
>>>          Regards,
>>>          Christian.
>>>
>>>
>>>              Matt
>>>
>>>
>>>                  Regards,
>>>                  Christian.
>>>

