Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBFC9E9ACF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 16:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E1110E4B2;
	Mon,  9 Dec 2024 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="49paTqTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516AF10E4B3;
 Mon,  9 Dec 2024 15:45:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLaoTrNqKask82yaYFEaq3M1NUY/tLFauZjpx04x6a6+Fm+HBaCnti0Hp2dhoDH49CUUiSZ8XerLlMOL085eDXrXHJPtRfASVq1a9BLRuaaibsCb6a/jiE1yCHevOZWIF4f1RpxpWSCWtLmdLjA2R3I2lozu8f+gkwJJ8lfcjTh4ZhAQYwMuR2wCrXa2tLEXamWI7pgyJvVbSur0+wS++Qct+0hB08fRglTMONdb29O07qcUDKRf/pyeksA/+yeCWLBbtb1UXKgA/PT7vkPZ50bI8bsSxRBl6yq49UFRk+RaRIOxRr1fcMG45rIlp4vUhU3zIgXhcNHHhZaV63afHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDqErJDvrd9RCjuJTV4sUzxboABXwZMQtHVFfs7eFn8=;
 b=dglysoy+Suz/tJjFMUzxNPairY7cyeymzasTXT8hJMfxJ26rnMclIBR91YLaWj0UnyHMl9yOqbHffLSQErwpPhdeNUIQuJOWI82G2WrS23ts8fDYDGGzRKm/HUS5B8lVNMO6Ls8838IrbYanx9sSvzoAWAXUUCozim0LdlLPZZQtspkvlrpMd+X50Dt2Mlo6wBywTv/SUidtDHpjzcKYGMoZeJ5NQxKGmlmk0RHd0ixN65Mxks/laRgnC2gDVktTE21TJ/LUaJx0Isj3Yi+iLPD9tr3aWx1R5bwByeWmzeqU6YjZ0ERu60CMeA9eZyKFV0B0R0l8a36PiKfZiiSESA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDqErJDvrd9RCjuJTV4sUzxboABXwZMQtHVFfs7eFn8=;
 b=49paTqTlkA6/UtCPG2uiS63MEBHrl8jsAuQfn9WrtHf9pkmUoD9Ip7sSMY07Z7JaOmydJyv/uyXuaxwOwSMOLdtXmkenqi/ksnUldZfcstLFWVNLK15ZOiez8GHgEOirRiSR/ST/ePUvtAr8bUJxljxyw1TriWnk92sezf7O+Tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6050.namprd12.prod.outlook.com (2603:10b6:a03:48b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 15:45:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 15:45:51 +0000
Message-ID: <7295956d-9e00-435a-8a7f-946582883a6c@amd.com>
Date: Mon, 9 Dec 2024 16:45:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
Content-Language: en-US
In-Reply-To: <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: cf40c750-356a-4673-cdb6-08dd18688eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEg5a3diSVgwTGhvK2dEZExxZThsTUxid2p5R2dNU3pyS1hTMU9ZbjR2MVph?=
 =?utf-8?B?M1F5MmdyU3YrSVFleUFvbXpYK1c4MEFxSVhtZ2s5Ukw0NVNQMmd3MUVFSlV3?=
 =?utf-8?B?cW5lc3VLQnBNQjhWdGxnb2tXdGUwZWxhazZiTm9JSC8rMkw2cnRJNWRKLzkv?=
 =?utf-8?B?andzTEhEa0FxT3lndWtJZ0tvQUxINm85a2tyQnU4cTQ2YzlqT2xGNlBJcFRV?=
 =?utf-8?B?TzQ0eTl3cHYyWWJRNExrd3RjdWpmcmlkYjdHdFFJd1NoSUpRQ1ZXb0NMYW0r?=
 =?utf-8?B?VisyYjdCWWtlK09KQ1N3Q1RZUmsrektGLzJ6ZkN4c1dObG1FekQ2SWEzelZX?=
 =?utf-8?B?bm9NL0dReGJDV2RNeVlQcFJLYjN3c2FaWGdHNWZhbDNmZmZHOE54RE40dXN6?=
 =?utf-8?B?S2Z5SjNyemRNTU1td0FmNkR5WU1JK2pyTFV2ODlJTGhGOHBsRm1BWmZZNHVr?=
 =?utf-8?B?dlRSNzJKWnJUeCtidTZPTGpnSm5DZVdOdldOM2hqVkJybHRuMTBUQVpXdUNn?=
 =?utf-8?B?ajlDcUlDY2JFUFhQL29GcWkrclRQclV3Y3hnY3pSYU4vT2YxZ2R5cWh4eWhG?=
 =?utf-8?B?SzVYM0hhT2pKVjFHOURWSmRKYklzTGcwOG1yVXJvc251NTE4Y3p4SzRkRTRu?=
 =?utf-8?B?WFRwYjFFb243ZmVaT2Vnam9KNE1ydmJ6b3pzdytBay9LTW5RbE9ZamduRHc5?=
 =?utf-8?B?dzlLR0Q0WElLK3RObU9sTC82SWJIQ0luZStkR3hvWWUrYlkzcGhCNnN4aGdo?=
 =?utf-8?B?Z09OaXo0aWhBS0s1VEF0eHBzcDFMaXllcGNCVXljZTdpaHZPWUNEd0hCc2FY?=
 =?utf-8?B?VUlnZXR5UE93RWZOaGswM1NCZlYvUk9vZTRPajBmZGppVWdrdzhidzEwV2hL?=
 =?utf-8?B?bml3VjZCYlpQblZNU3pSb3dvbHh0VHhmczczZVVid0gzVHdQNjZCaWJNUkYz?=
 =?utf-8?B?OVlPeWxjRlp4SjNwTHVVYldQWGxvSFpZOW9HRnFLTGt3aThBQnh5dzFvUzJJ?=
 =?utf-8?B?d05QdHVHQWNoMkZjWkQ2NjJMd1lMY3ZUVFdKSC9sWEliejcvMDJGWE1FQkNz?=
 =?utf-8?B?QWlSUnJHbHZCcytUTDZXZW5SZHB3Ung0L2J5SGpicjUrRGJrRTU4bjlVdVVi?=
 =?utf-8?B?NmcxRTJEMldLMDdGOUhYOHdwZHpUNEp5b2JUN0trejVuSUJqVTdjemFqdmZE?=
 =?utf-8?B?eWt6TDBzcDMxZzUwQVZHWFhvc0xzdmdGQVpUdlB1akZXR2MvRTQxSFF6M3Bq?=
 =?utf-8?B?alM4MmxWbURKQWIwQTdvZjNoSUhIaVphS2Y0NmdPajF6K2VqTkM3a2pCMVN6?=
 =?utf-8?B?V1VIbzFsVnlVdWg1a3Nic1dGblUvZkl3Z2EvTDRpZ1dYUXFxenFqd2NoZmt1?=
 =?utf-8?B?d0lGdFp1bGVRYU5Lclh5a3RzczhXUXFmeDl1MlROY0M0QXdILzFsVUk5c3hL?=
 =?utf-8?B?Y3dWVHRtaC9UTzJiQW44b2U4ZDRxdUlSMnFlMEEveUVGek9hdlc5WlhuYmZz?=
 =?utf-8?B?Z28xT3dRQUdTNjkzQXh6aDM4dEtFMmVNOXFPbXVlTEhLSm1uZmt3NllnZDdj?=
 =?utf-8?B?b2dTQ0ZJcElidjV5MWw0WmEwVUFtUC9aQlcwTUFNdmh0a2hqdWxHZ0lReEZz?=
 =?utf-8?B?dnFESklOYVU2cXIwU3dmT2xESU1oZVM3OHI1YkRRNTRoUzBtRDh3OWRCNnlB?=
 =?utf-8?B?c29CWG00ZHhhcUhQcGlCaDNNbzhHL1dCM3VSZHJCdWtxVHU1clg3M1NCU21n?=
 =?utf-8?B?ZW5sOHlrTFQrbllXUU9KblBwZEQ5VjE5OFp3ZHRrSzF4dzNQRm5pMXVTYjBl?=
 =?utf-8?B?L2FhdFdJd2RYMUo4ZVRGdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTNGTy83dVhQRElVYmU5ZWFwV2ZYWmsyVVZHTTBWWmlROUpMRnYvSE1MZTlY?=
 =?utf-8?B?RGpYd0Q2S2xRaENSK3FjcDhQa1M0bFpJdHByZkhiMmRHYTBPRy9hMTlsUDFl?=
 =?utf-8?B?R0QyNmJTMGV2UE41ay9TSmEvMkpNaWRtTlRFQVB6OGRNNXVIY0F1dFU1Ky9S?=
 =?utf-8?B?bVpRMEFRSDhxS1JRSG1ybDR5eTBlblB4bU5sYzdTL0phSnNWdTh6YU9DUDhW?=
 =?utf-8?B?OEtOWFhZbGhGVkJVU3pWM29FV3ZwZVU4WXhmQkRjdWlhSVB1UWI5dUtTbmlI?=
 =?utf-8?B?S3U0K2Q2NThBYnptY0ZzYnhzeHhjQTArUXoyUlJJUElMSzdTV2VRdW9oa3Iw?=
 =?utf-8?B?S0FHeHRtK2pJaGdFQ2Zuc3lldTZrWFVPN3VUUXdiem1jWnlScFZsUFJlYW85?=
 =?utf-8?B?RE8zbVlnR0hmZEtGakpONDFRMDdiSFh4OHozYzRKM01WMitLK0s5Y0N2N094?=
 =?utf-8?B?N3o0VHdOeEFOWmtxUVo2YUsyaU1XQkdBTk5VS0hJdUVGdjJmK3U3ejJMbDgz?=
 =?utf-8?B?UFBKeUVnK0huWm01bjFUcmlZeHdkRlNOQlVHWFNWSkFUT3d4cjdXclJTcmlY?=
 =?utf-8?B?cFlRQU1aWUtQbVN4ZkFEWXN4dmhDRWJwTVAxVVU5NXl1am5oUU01eHowUGxV?=
 =?utf-8?B?N1dMbHNRV0tSM3dTK1ZzUDNZbzd2YmVzalU1VEs2NDRDN0NHMEZUYWg5V2V6?=
 =?utf-8?B?K29LWlpCN0FSSmU2cGJDSUlQdTBSbUtPVFNpZ3VadWtCRjlTNmRNQTZZaDhy?=
 =?utf-8?B?ZnBDZkZ5Z01sQUtZcjNMQStpeUl4Y1RZYUlvNWdWTmxPRmZ4MzhQNEJCYXV1?=
 =?utf-8?B?V2MzWnhjd0tIMFhJd3BOUnFUQkZwU1ZCMDk0cFE2eVpYaWdncmJVMjB0eWZr?=
 =?utf-8?B?UnI5K05UOEp6QndFcEloejhrbmM5VzdnVHpJaXRvcXliSjBmRmpKZEZ4cjMw?=
 =?utf-8?B?bmFabVFQeDh5NlFyb29WMnZtUnp4ZnN5MVNTZWFXWjc1YkJmRmFoVTVQRkZl?=
 =?utf-8?B?VWJqYWR5eTlQVVVnU29RR0FIUlRJU2RuT3lFaWZWMHE3K2FDeUlhVFBWaXVq?=
 =?utf-8?B?aUcrdHJDaUdYMGcvc2IwbDhyYXcrQ2lxd0FZZFNrTDJxWGkwYkF2N01pZjlv?=
 =?utf-8?B?aFp2aCt3T245azZtb1JiMzI5QlFuNVJxbllTU09TUFl1cFNrcWZKSDY4MTFW?=
 =?utf-8?B?Q2w1Y2p1US9rWlhaK20rb0pOQkdSS1pWUnl5bWlYaTZoR0dQaW5XWm1TWERC?=
 =?utf-8?B?aVVKbFJ0K2dlOTI1aFFDeW9TSTM4eGRXZnJqUWZvOGJtU1I0UFN0SnVERkYv?=
 =?utf-8?B?cGx3ODQ0VG5zWmZSSldEMVFKZmtkcFZVbXRMbmVWUzVla0txSHU3QUR1SGg4?=
 =?utf-8?B?ZE9KU08wZUhPN1J6TGlISVBwaTdjbmphSWhLZi93eVpCVDFidmJScVk0ZjZp?=
 =?utf-8?B?RWpZc3dRYXpROS9Kb1NISk93djAwRU5XanZYRVRxT3NUS0VKNFdKNkJ6SnBl?=
 =?utf-8?B?Tk5ncU1jNmsrdjByY1I2dmZYS2V2OHJsWktodEhrd0RMOSsvbVJGU3VPNUJs?=
 =?utf-8?B?LzdpT3BzbXZ1QzIvQ2xZTmZTUnZ1Wk9YMTBKR2lJYklKMXVnNnVZS2lzd0Jn?=
 =?utf-8?B?ZStzdFJvTkpOeDBoSm8yMkQ2cTQvamVjR0tIRXJwWVZ4elo5Q3NUQ3Z3eXda?=
 =?utf-8?B?N1FyUWVUZ2NSeXlDbTN5S0ZKeVJ3SlhrK1IzT2FqNmk1NDNqYk80bVgybUN5?=
 =?utf-8?B?aVU3Uk5hWjJmZ3p6T3h1QXliUnkrQmttTmdCeDZmcWJhRDVKUElvNTNDc2VD?=
 =?utf-8?B?dkgxeWxQbDl3b0xOQlhEQllueGJWaThqZVowOFluUkZsb1JaRERiMDhWczUw?=
 =?utf-8?B?QnA3WXNnbW9kNE54T0ovMUJacDRDYXRnckc1NFEyUWJGVzNMTy9vS0p4WTA5?=
 =?utf-8?B?YVpnOEZBeVIxYWZ1bEZmWXJuQ3dvT3JXMTBYMHBCVktzeUM3MTlHN1hmd2Ni?=
 =?utf-8?B?WmlIaGJuek5XaTRQS05wdy9NaE84Rml0L1FpZkplV2VNVWRBQWdOTHFpaGhW?=
 =?utf-8?B?Vlc5RVVnT0NKbWtSLytFaENlOFI4VVVab0djM1BtQ3Y2ckVyVVpDQmV1TVlh?=
 =?utf-8?Q?/nSuWoT0LGnig+J8siMJIq6qp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf40c750-356a-4673-cdb6-08dd18688eb0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 15:45:50.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URaccGSuwUDI7KwptIdlM3bUcSK1vmvbZjHJkCk5akjRLu/vrSd3xpqkhkkjsz1v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6050
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

Am 09.12.24 um 16:42 schrieb Christian König:
> Am 09.12.24 um 16:31 schrieb Simona Vetter:
>> On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
>>> Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
>>>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>
>>>> Debugger needs to read/write program's vmas including userptr_vma.
>>>> Since hmm_range_fault is used to pin userptr vmas, it is possible
>>>> to map those vmas from debugger context.
>>> Oh, this implementation is extremely questionable as well. Adding 
>>> the LKML
>>> and the MM list as well.
>>>
>>> First of all hmm_range_fault() does *not* pin anything!
>>>
>>> In other words you don't have a page reference when the function 
>>> returns,
>>> but rather just a sequence number you can check for modifications.
>> I think it's all there, holds the invalidation lock during the critical
>> access/section, drops it when reacquiring pages, retries until it works.

One thing I'm missing: Is it possible that mappings are created read-only?

E.g. that you have a read-only mapping of libc and then write through 
this interface to it?

Of hand I don't see anything preventing this (well could be that you 
don't allow creating read-only mappings).

Regards,
Christian.

>>
>> I think the issue is more that everyone hand-rolls userptr.
>
> Well that is part of the issue.
>
> The general problem here is that the eudebug interface tries to 
> simulate the memory accesses as they would have happened by the hardware.
>
> What the debugger should probably do is to cleanly attach to the 
> application, get the information which CPU address is mapped to which 
> GPU address and then use the standard ptrace interfaces.
>
> The whole interface re-invents a lot of functionality which is already 
> there just because you don't like the idea to attach to the debugged 
> application in userspace.
>
> As far as I can see this whole idea is extremely questionable. This 
> looks like re-inventing the wheel in a different color.
>
> Regards,
> Christian.
>
>>   Probably time
>> we standardize that and put it into gpuvm as an optional part, with
>> consistent locking, naming (like not calling it _pin_pages when it's
>> unpinnged userptr), kerneldoc and all the nice things so that we
>> stop consistently getting confused by other driver's userptr code.
>>
>> I think that was on the plan originally as an eventual step, I guess 
>> time
>> to pump that up. Matt/Thomas, thoughts?
>> -Sima
>>
>>>> v2: pin pages vs notifier, move to vm.c (Matthew)
>>>> v3: - iterate over system pages instead of DMA, fixes iommu enabled
>>>>       - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
>>>>
>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
>>>>    drivers/gpu/drm/xe/xe_vm.c      | 47 
>>>> +++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>>>>    3 files changed, 52 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c 
>>>> b/drivers/gpu/drm/xe/xe_eudebug.c
>>>> index 9d87df75348b..e5949e4dcad8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_eudebug.c
>>>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>>>> @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct 
>>>> xe_vma *vma, u64 offset_in_vma,
>>>>            return ret;
>>>>        }
>>>> -    return -EINVAL;
>>>> +    return xe_vm_userptr_access(to_userptr_vma(vma), offset_in_vma,
>>>> +                    buf, bytes, write);
>>>>    }
>>>>    static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 0f17bc8b627b..224ff9e16941 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct 
>>>> xe_vm_snapshot *snap)
>>>>        }
>>>>        kvfree(snap);
>>>>    }
>>>> +
>>>> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
>>>> +             void *buf, u64 len, bool write)
>>>> +{
>>>> +    struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>>>> +    struct xe_userptr *up = &uvma->userptr;
>>>> +    struct xe_res_cursor cur = {};
>>>> +    int cur_len, ret = 0;
>>>> +
>>>> +    while (true) {
>>>> +        down_read(&vm->userptr.notifier_lock);
>>>> +        if (!xe_vma_userptr_check_repin(uvma))
>>>> +            break;
>>>> +
>>>> +        spin_lock(&vm->userptr.invalidated_lock);
>>>> + list_del_init(&uvma->userptr.invalidate_link);
>>>> +        spin_unlock(&vm->userptr.invalidated_lock);
>>>> +
>>>> +        up_read(&vm->userptr.notifier_lock);
>>>> +        ret = xe_vma_userptr_pin_pages(uvma);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    if (!up->sg) {
>>>> +        ret = -EINVAL;
>>>> +        goto out_unlock_notifier;
>>>> +    }
>>>> +
>>>> +    for (xe_res_first_sg_system(up->sg, offset, len, &cur); 
>>>> cur.remaining;
>>>> +         xe_res_next(&cur, cur_len)) {
>>>> +        void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
>>> The interface basically creates a side channel to access userptrs in 
>>> the way
>>> an userspace application would do without actually going through 
>>> userspace.
>>>
>>> That is generally not something a device driver should ever do as 
>>> far as I
>>> can see.
>>>
>>>> +
>>>> +        cur_len = min(cur.size, cur.remaining);
>>>> +        if (write)
>>>> +            memcpy(ptr, buf, cur_len);
>>>> +        else
>>>> +            memcpy(buf, ptr, cur_len);
>>>> +        kunmap_local(ptr);
>>>> +        buf += cur_len;
>>>> +    }
>>>> +    ret = len;
>>>> +
>>>> +out_unlock_notifier:
>>>> +    up_read(&vm->userptr.notifier_lock);
>>> I just strongly hope that this will prevent the mapping from changing.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +    return ret;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>>> index 23adb7442881..372ad40ad67f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>>> @@ -280,3 +280,6 @@ struct xe_vm_snapshot 
>>>> *xe_vm_snapshot_capture(struct xe_vm *vm);
>>>>    void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>>>>    void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct 
>>>> drm_printer *p);
>>>>    void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>>>> +
>>>> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
>>>> +             void *buf, u64 len, bool write);
>

