Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E287CA5C062
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064B10E578;
	Tue, 11 Mar 2025 12:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA4SGwSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2610E578;
 Tue, 11 Mar 2025 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741695299; x=1773231299;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=F2jcA87zSUYItNZVaBti6I1b1wNvf99ZJW1Rtsa/zKA=;
 b=GA4SGwSsYpOTbgzj21KCHEiAKGZoVwuXKOtymqIgOBczGJq6wdWNwoMj
 LarA5HSqD9IQvexDdv8OlsTCQcBLAgY8YH3MTCpMpjXqaDoyzyHxxcVDX
 5LeK9O3hdCbKLT5RDXYgwbVZnigzhftp/w62r8sRw4doy4O848Ewsn56Z
 W7wMTFAZwyYUm9qjh4Zxa2o5aZVwjHr68o1on8kUr9iww8zgUxW6hRxvb
 lR2mTDfecQMr4bZ0sxRlBhJeNOV/47Y8i0OGA2yeGXgpvdQcLXLU7aLGU
 +E56IqlJcJisScd30+T7aNAv+tDxjn6gqz7KWzgPDfBqRSkDaL2Dhgp6V Q==;
X-CSE-ConnectionGUID: JNyNOmAISX6ZsZdqJjLgSw==
X-CSE-MsgGUID: y9O6xoo1S76W2JJ3duu+hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46511605"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46511605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:14:56 -0700
X-CSE-ConnectionGUID: 0/XH09ErQduPY4KB8TFGqw==
X-CSE-MsgGUID: e1aBMsn4QzySFrkwg0sAeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151111401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:14:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 05:14:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:14:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8hzd/c+A7WEP5YVwG2H6LoO4qNBxH6BUBT5iYNSZC2IcIwuc+D1w8axdQWWz52Jr+POxdn7Tnq7w2wvk9H2cfw8dwWzz4TMIab94zdcalqXUAsnyf9OudJUGr9t7ZPf9yv78gGZbb7nB8XtBHEgeq8J12FdE4DRVGtCgnJOstCOtDBV3ScW4yJZEFaWGmvHtjmiB2zALzql6AQ3XOFnWjSC14MxZI/LjH/Oj8xvyhVaQ0+G3kip/s7x+EZV9pCacQeoSlAjxk36ysxKPRLGBcjgnyc3CxHl+ZqPdvf9Oni4ijGal/sOpIK92/zYn1oSnifaxp2gvgKMttTh1MwKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld2jH0EG4GhxuF5YNqELEC/7S4HWagcXGYZ3VgHGz+c=;
 b=k3jUVR+k9VqjTkFemPhNVcWxsJqYxK+RXYPQQDwBuolocPhXYVnO0bM3ooWjOPBoH2NxDoxPCDk5j4V4tLDVmimVzar1hM6v2Bog+ltPc2K0vOHwUFP6g5T3Uh7tQzxnbdnE9/DITu2SBOxZquF7UDp9eSggszBZoqYzTUY5O0Vk4+pxh2t/0C7EBi6pAPM7gVFe7Js6XK1FRAyI0QPCJLs1CnAWHqDqAbI0C7HWQyOzWCXE4K34Hs3JITSTXFSX/kCLViotDaXVhLWFntAYc7gbvMcieQcWazyCwEdH/ZRdNZRtqSHu3Dx8No8iKA8HhZYG5t5Q9S1earzLQuGjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:14:52 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:14:52 +0000
Message-ID: <a1d6c39b-a21d-4990-8926-529287c7f7fb@intel.com>
Date: Tue, 11 Mar 2025 17:44:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/i915/display: Enable/disable casf
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-10-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-10-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e2459e-ce74-4952-d09c-08dd60965371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V01VZ3o5ZEY0U001emxTVzFBL1FkbnJnK25ON3Bhai9pSkYzUWRHTU1nRVVX?=
 =?utf-8?B?V0pWMGZFQndXbGpJNlBWSUlZMncvaitYKythM0JTZDh2T2txNjBEczF2NXFw?=
 =?utf-8?B?aWJwS25EYlh6dnlDWkc1WW5KdytjMzhLOC9LVnlCQVlZL1hoSGFGcDk0dWds?=
 =?utf-8?B?RWcrUmRSSnFPVGJ3Yjh4RkY4b2F3UTRJdWU0dXVhVHhteVgwck5pbmdvYmVC?=
 =?utf-8?B?UitrMDlGbS9LMnVHNThWSFhabjJHREpEdGU2SUhFSGpZVTRuaUk2QTBLVWNp?=
 =?utf-8?B?YmtuUWxlQzlpMDZFejI2THVJcERhd3VJV1FxRlFxTDN6blZaRi9WdSt2MmRG?=
 =?utf-8?B?MGJWL1FVNDkveSt0bjJuQU9BdWdrcmcrTy9HQThoZ2xvalIyTVlWN2dKMmZH?=
 =?utf-8?B?aTljSWJMZkVsb2NKWDhIUjFtWGU5RVU3QkJObm9aZHowa0ppdE95cTJvWG1U?=
 =?utf-8?B?VVU0NWVkdktmUXFRWnoyT1ZHV3BvNkJ6RzNOZHRFYjcyT3VmeTJEaGNFc1Y4?=
 =?utf-8?B?S3duVlA4ZC9BYmZxL054T2YvVGNlSkxWdTd4cmtVTU9DVkdwampOT09pejB2?=
 =?utf-8?B?Vm13N01iSmlFTm03UkpvMmNjYzNjVzhRZFB1YU9YanR1djlCRHR2OVdTUllB?=
 =?utf-8?B?dzljQzQzNFlFdmQwcFMvSERTU3ZiaVY2MFdWVThOdTl5OHY1aUVIZzlGMjlC?=
 =?utf-8?B?VUlxdlBnbUhObVh2Yk5UUkZRaHNIVnJqUkoxV3YzY2pUR1VBdHloQXFkVlRr?=
 =?utf-8?B?WDZzaStmRUI0c25rd2VZQXZuSVZ6UlBYRFhPYmU2RGRvNTdLeldvSFJlZmFa?=
 =?utf-8?B?dE5vZFRDREVKdFRqVFR6VG1LVkRXc2E0LzlNMjY1blh0WC81bXhXMkZsT1ps?=
 =?utf-8?B?cnZYenl2RXVpbjdhRUhxdndKZGdJU25NNFA1R0tSTVFtaUs4YTlVKzZITFR3?=
 =?utf-8?B?em5uSTlHVEFHaWZvY2Q5VjJ5R2srT1NGVnJ6MXB4WjF0MGxrSnMzelN2STUv?=
 =?utf-8?B?TWpEWWZxNWgxTzA2MDdGcjlZVUxNeFZ3aWpUNnN0b3JkME1STFQrejk2VFFk?=
 =?utf-8?B?UFhobUlHZWJjbExMc3V2U2QrWklxRDd1MUhZRFdGVWttU2QwQzIyN3ljOFhX?=
 =?utf-8?B?dlp6U1cyODd3T2dEN1JuUzVMQzN3VlBuYmI3VUFtOC9BZXlPYUtFWW1EK3Nh?=
 =?utf-8?B?elBKOWcwMjBCQ0NFcGJLNVQ2MHdHaFJVRjUwY1lFNGpIWThqNk5qNW53ZDYx?=
 =?utf-8?B?TmdDaFcrWTU1Tm9rNGszdENrbUZWaGd1MVBkMzdxL0kva2ZFczNWZHBxak9S?=
 =?utf-8?B?RUJEME1xd3RQeGU2aFFIL1hzS2lYeU90ZDJrYlpLanhMMFAzNUYvbkZudE00?=
 =?utf-8?B?akxyVnhkS0FsVTVOeXJPL2YzL1RaOWl1emVyMlhZeFFyb2o2RkdpbzlHZkdz?=
 =?utf-8?B?ZDJPSGdQN2NOcUZOSW9XMlF6WS9mb1pmSERmNUpDbnlWZzNua201TFFtdk1G?=
 =?utf-8?B?R1lxb2lCMHU2MmFPN1RpNlc3UjVZbVRoRGFzc3pwdFNZcm96YXgyRlJZb1hy?=
 =?utf-8?B?cXhDTDZVZ1NtTkFhVFZkWWpkbUNvU2xwdUFEaTNHQkdMWjlqVWd2QW1VbjhB?=
 =?utf-8?B?cFRXQTFaMkRRQktUaWNNUnlJbGtUYWk2U2dveEtTUnRmcDhQWFRFWXV6U0hm?=
 =?utf-8?B?L21MK200eFByWGw0OTVCUUtYeDBDSVN6Mk5GUGRDckVjVGdRYXdXbEVRV1BH?=
 =?utf-8?B?SXR1bDhvMVZHdFJFR3dRb3k2VERVL2ZlMWRNNVJKYlZBK1U4ZXAwU0cvRk82?=
 =?utf-8?B?Y1RtYk1wckFwUXBqMEpKbGpyR0YwY1U3U25NSFI0cHVaNTJ6ZEpMcEJXMWI1?=
 =?utf-8?Q?lMz7uqOUzYocw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUg3VEFSdTVsNVBveitQaGZoSHFwQ2FrTGVDZERLS1pXSmRSZzRicXdGOUZR?=
 =?utf-8?B?N0Foa1llZWIyL1Z3b3Ezc2FQOUhONFZPdkVSSjJQUHNrTktTL2ZlcHZYaTVF?=
 =?utf-8?B?N2VVUVBnK2ozQWo4QWdBZmlqSUluSEdkSTBOK2tpaUZKMUtOSms4VVc3cGwr?=
 =?utf-8?B?M3RCOWg1Y1kzb2RyRURjdGZGZHNENTZ6dHh1SlNaZ291LzZyME5mdCsvSE1y?=
 =?utf-8?B?MVhhVktkWWZKeXR1d1FUcDJnVzRHeEFhZUVUZ3hZWndYeEZDU0lXTnNiQnVr?=
 =?utf-8?B?b1drejVZQjgrRk8zUVpZQWhpWXE3S2Y4THZmRUtYSVR5OXRMcGhHRkRCR3hD?=
 =?utf-8?B?M0ZWUWQ2RnZaSFMwekRPekdJdzIzQnVvYnlmeUZZbFhKZkk0QXpIdTRscGNL?=
 =?utf-8?B?WnI2NDh1YjZ5ZEM5VWg3MDFJYnZ3ZzJSckdudU0xVlo2cjlNQlVqeGJNbkpM?=
 =?utf-8?B?US95bkU3cm8wQUk5QzRPS2c4bXVhRmx3Q2VBb010QVVCUUFicllvNnR1SEc2?=
 =?utf-8?B?MVpHeW0zeTFyQ05yekpjclppU1UwenpUM2haMFJZeVpLYUU5VnQ0RGtFTTlQ?=
 =?utf-8?B?TzVwVVN1Tnh5bHdlSVB5Y1JpUndhV1dIWkw3WER2OG1pbXdub2xRMWQrQkV3?=
 =?utf-8?B?clJoQ0hUMERobVJYWnY2d0tGcTc1WEkvNkRMSWFXTGVlYzZIeC9pT3dPK2Z3?=
 =?utf-8?B?WmwxdktOU1dIdE8wT1RRZHVUU0NBY0c1YzNGTzRHM010VXc3Qi9ueVM1UHVy?=
 =?utf-8?B?OFRQcHI4bGpPV2UxM0FoYVd5RDZVQ2xiMyt1TFNYU0pGYzNESW5zdzlZTEZy?=
 =?utf-8?B?TTdSY2NZeTRQcm52VUY0bStveVpiLzBSVjlQOS9TTHVsdU0rMzc4em9tT2VI?=
 =?utf-8?B?MC9nODVTa0pEVSs3UG56MEJaQ3ZSeE9vUzBTY0g3K2tSKzBGWXEreVFwYm1L?=
 =?utf-8?B?MkRhZjNQbzMwazJUdUVQeHo2YVo3TjVEazVNN0pRN2hEZmcvZDJJRC9LMWhl?=
 =?utf-8?B?MzRuVW9TazlldjlUQWVCNEhYcHpwdVBCK01RejlLYWxrZ2FIKzJ0bno2eWRp?=
 =?utf-8?B?Mm4wQThGa3BZa3g5WVlEOGFTd0ZWdUVHZHUzNFFUOC9qQlA2ajFvRTlDT2dz?=
 =?utf-8?B?bE1PbGJPbTViT2xTbHJRL0J2RWtNejZhUExpbWtZcUJ6UkZCODZWek9icm5j?=
 =?utf-8?B?RHVKS1NrU3B4R2s4bUtkaGYrMDJCb2p6a2ZrNmk4SVZrTFh1OFpJRm9sODBF?=
 =?utf-8?B?S1hmRUVCZjc3YVN0M3ZxRW5GZzN6OXZCclRtUDhydmVtci9uS3J0YmcvYVo4?=
 =?utf-8?B?SnE2ZEQ5QjJmYzFWQ2c4YmhoUjdXa2hFU3RiY2V5YTIwTEp3UGtkTFF5OHJ6?=
 =?utf-8?B?c25wWnVRYU9oYUlxcEVYNVZMSWQzTEVuSWE3MXFLbmJPZHZRaUk1cnhWaE9P?=
 =?utf-8?B?MkwyTWw3ZUd3MG9aNmRKWnQwZDA0TXhScE5rQ3pUUnl0cmVLYVYwUTVRR05m?=
 =?utf-8?B?TWVYellLRzkrNCtJaVd6OStuZTBJMk85SVUrdGZNNEUyN3dZSUtGMHpaby9m?=
 =?utf-8?B?Sm1NbUlzc2RNaXhKajhKdFFwbmU0RThuNzZOS3B0VGFwN2oxd3ZiTWNrSUZG?=
 =?utf-8?B?dThabWEvck03VmxwRjY3eXNydDhrM1NiaEx4M0pZQlVPWW1tU3FLVEdsa2hj?=
 =?utf-8?B?azk5L21sV2FxNGE5MEErK29valRQSWVyNVRtcHlIeE0wUGhkanF6VmtUNlJG?=
 =?utf-8?B?WHJqeFV5NktuNE0xaUVmOUJHcUFBbkV1ZHJKVXMzNkJhSmhranJlalB0cEhr?=
 =?utf-8?B?MTRWMk5qV3Q3Tis4UW44cTdhY250OERienA2S082M3pId0Q2ZnVlR0pNcmZ3?=
 =?utf-8?B?V20wNEZLSExLendTa1R4RDMvNHBZRmkrRHFPSkdpTi9VeHNWaWtsRkZLbmtU?=
 =?utf-8?B?Ykxjb0s2cUZTVUNoczFCWXhkNVRkYjlLa0poN3h4M1Qyai80d1hxQ0NBTzdu?=
 =?utf-8?B?WkFOdWNqc1lWelBCU2liTk5nd2tuMER4NEZxNVFqR1k3Uk5Yc21nT2F6M2ht?=
 =?utf-8?B?bVIrUWVNR0NOYzI1N2VleS80b2VXTEdJZXU2c2xKUlVDZUJobmVWbjMxckdB?=
 =?utf-8?B?NkhNV1BxRTIrSWpJOGk1UVNyZHJpU0t4ZG5zeU0rNElPMjl6Tm1UMjJCVFJ6?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e2459e-ce74-4952-d09c-08dd60965371
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:14:52.1247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRPdFrcub5pfxwKtf7EdP1YJHY7TnewBKNkKiPbvu9I+Noo6Al5wE0e5lpaeDia3eo1/jbpzX4V02rxnxJaiGhKbVNYVtUx6s2i9ZtjblKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
X-OriginatorOrg: intel.com
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Add a check for enabling/disabling the casf
> and enable the sharpness bit. Also load the
> filter lut value which is needed one time.
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    | 18 +++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_display.c | 32 ++++++++++++++++++++
>   3 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 9f14418dc3c9..1a4362788d30 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -230,7 +230,25 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
>   
>   void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   {
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharpness_ctl;
> +
>   	intel_casf_write_coeff(crtc_state);
>   
>   	skl_scaler_setup_casf(crtc_state);
> +
> +	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
> +
> +	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
> +}
> +

Here the intel_casf_enable should be introduced for the first time as 
mentioned previously just like the intel_casf_disable is introduced.

Regards,

Ankit


> +void intel_casf_disable(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index c75a4b2f3133..64821aafdc2f 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -18,5 +18,6 @@ void intel_filter_lut_load(struct intel_crtc *crtc,
>   void intel_casf_enable(struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
>   bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index a2fb68c7cf7a..7d500bdc58fb 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1036,6 +1036,25 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
>   		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
>   }
>   
> +static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
> +				const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
> +}
> +
> +static bool intel_casf_disabling(const struct intel_crtc_state *new_crtc_state,
> +				 const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return (new_crtc_state->hw.casf_params.casf_enable !=
> +			old_crtc_state->hw.casf_params.casf_enable);
> +}
> +
>   #undef is_disabling
>   #undef is_enabling
>   
> @@ -1182,6 +1201,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
>   		intel_encoders_audio_disable(state, crtc);
>   
> +	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
> +		intel_casf_disable(new_crtc_state);
> +
>   	intel_drrs_deactivate(old_crtc_state);
>   
>   	intel_psr_pre_plane_update(state, crtc);
> @@ -1650,6 +1672,8 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
>   	struct intel_display *display = to_intel_display(state);
>   	const struct intel_crtc_state *new_crtc_state =
>   		intel_atomic_get_new_crtc_state(state, crtc);
> +	const struct intel_crtc_state *old_crtc_state =
> +		intel_atomic_get_old_crtc_state(state, crtc);
>   	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>   	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
>   	struct intel_crtc *pipe_crtc;
> @@ -1742,6 +1766,9 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
>   			intel_crtc_wait_for_next_vblank(wa_crtc);
>   			intel_crtc_wait_for_next_vblank(wa_crtc);
>   		}
> +
> +		if (intel_casf_enabling(new_crtc_state, old_crtc_state))
> +			intel_filter_lut_load(crtc, new_crtc_state);
>   	}
>   }
>   
> @@ -6722,6 +6749,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   			intel_vrr_set_transcoder_timings(new_crtc_state);
>   	}
>   
> +	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
> +		intel_casf_enable(new_crtc_state);
> +	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
> +		intel_casf_update_strength(new_crtc_state);
> +
>   	intel_fbc_update(state, crtc);
>   
>   	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
