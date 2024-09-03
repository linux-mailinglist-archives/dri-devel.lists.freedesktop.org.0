Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2251B9690C7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 03:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0487410E119;
	Tue,  3 Sep 2024 01:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8801D10E0AA;
 Tue,  3 Sep 2024 01:01:14 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4830t2ND017184;
 Tue, 3 Sep 2024 01:00:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1afbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2024 01:00:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhbzX4IaK+jE2gCOydo99+eqCR+o8zQ+if8LMpCM7/QxikvZ1EwfVCGKE0jKfAQPaZGxwIt88tDHwBDhYFxub6+BoJt2EFUyQLygIp+3jeHwrPOf1w9dwUxfyd/cXjOSkSJrrVQ0TkWS8YCWNyFUrDesYNS3ggiJ926qsfu5cP47RoGWkyp33Rh6GV9WJv3xXXZOYI1r22ThKWY4RWfS8ejhM/CiRdXBriR7U9YYZapcojrkvuqh5dTOiOfhvA57iiLnR8tsHr/sbP012TjphYN2ukPh4AhSkLWeI6rdiidPRpEyksO57jQkDC5Mt28p/g9cmEZ0dDI0SUf/3Yi5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia2bW20aIuzH4WQMaF1MtNU8NNr5FtROzrHxd3gByGg=;
 b=E0rj6DHnF2PNrwc0XDkBRFJuWgkRJmJUIQyPt0J3ZQ0xGZZcJBTTdUT91Vmly+tNvuKAiUyKxTwSNswJ5YSRCl9ci8RdfCxSAlyr7TToz58UEZdDO5dw+IH0Teme0K/t3tWWEUBfejCPruU16A7YH8Z1K4wH5B1ojF+lhfgkAZUbtxftfeRqGer5ZFQHn5s5fNZZulU+DjRrO11/SxAb/7Gz5Y4gCaGnzysctHtbb0IeiWF/nVbGavT563kXww2ogVR5YxfQi9YESlTr2mfISwv9VPdRajf7eqEEvi1Si5P5xYbZaJCDo9lrt7xav//OWd7A72IhHWysTv/Zs0O78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 01:00:51 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 01:00:51 +0000
Message-ID: <33eace43-477e-4d06-86e5-3574019cdaba@windriver.com>
Date: Tue, 3 Sep 2024 12:00:42 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in GFP_HIGHUSER
 with 32 address
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <MW5PR11MB57648F441CEDD36E614E31EA95812@MW5PR11MB5764.namprd11.prod.outlook.com>
 <e0d206be-7ad1-4b80-9f58-88eb0cf1ce74@linux.dev>
Content-Language: en-US
From: wang xiaolei <xiaolei.wang@windriver.com>
In-Reply-To: <e0d206be-7ad1-4b80-9f58-88eb0cf1ce74@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd58576-20c8-41df-3f9c-08dccbb3dae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWtIaFUzTUZUdlp4UXFuMVR6dVRXemdTdGhUQSsvb3N2bUg4QkMxS0FrRXBR?=
 =?utf-8?B?OGU0OEZybnlIT1lxY3VZR1JQa0hyN0R5VkhCMVA3RjRtRWhGUWl0NVZHbDkr?=
 =?utf-8?B?eXdPTUI1OVBIcldKclczMUh1TlV5bmc2N0lNZW9MRGdCQ2kwajQ2VnZlUEdr?=
 =?utf-8?B?cXVWZ1BPSktBd2wzSlF0UWRKNThwY3VjY3JPQUhMR003djVXanBoRE9WTWxK?=
 =?utf-8?B?cXRTUmdrSURaLzIyQ3BzOXFlb3poMW5vZWx0ZE4xS253aHZBeUV3ODVKVzlG?=
 =?utf-8?B?R1pFdURyYkYwR1UveTVIeTJmZzhmWkZoTmdjV1hodExzcyt6OTVyUU5RdW5K?=
 =?utf-8?B?WnlCcHgraEoxU0p1cnJsWGIzMHFjOVZLNU10bVNaVWY5YkFGTW5mV2dmYUJr?=
 =?utf-8?B?RGhXREx0bDBCMnlNMWd4b0pLeXNEQmtGdTV5S2MvUVZRSkE1Vng5Vjhta1hM?=
 =?utf-8?B?N0VUR3VYY1RDcGFDZEVSTGlTalJ2MkpXb2J6aCtLaFl1dVc3dFFhR1U5ZUFG?=
 =?utf-8?B?T0dPUS8vdTd2RE9Dc2JWdzNkYnJVakZDSEJDR01TQUozZ1FFdlBhaGxJUDFJ?=
 =?utf-8?B?T1VkREQvUGU5OGtsbnlwQk9HNnZqYWQvMTNWSXBnUElDZkZiTm5IWk9VbWtz?=
 =?utf-8?B?Wkp0NENmR2Zoc25YVnJjSHJLVDRlSC9KV1BOUGZLRHd1Q3NIWVoxa0RZcTV6?=
 =?utf-8?B?Z05HU24yMmxnZUdaRFYwSTZjelFMTHJjUW9lblFMcENSdDIzN2hraTF3Tks2?=
 =?utf-8?B?MUk4MVh1U3VESnhIUTJ4enBxbWo2eHQ4MzErcG5rM1QrcWIxMi9lWHB5cEdh?=
 =?utf-8?B?OCtGdVNwMEdwRFhvVVQyNHcrbFNRQ0hsWVpqWC8xdTJ0cVM3NFhrd2U4RVJ1?=
 =?utf-8?B?NEdHTnUxeVpsMjJyeGtlU1FVbnZmazFqR2JWb3FsUC9sQWRaUWZ1cjM1bm5K?=
 =?utf-8?B?U0I5SGQyd3U5a2RsOE5XTi9aWlByQkFvamhtaG5hRUhDMkx2WjBVdENxRDZt?=
 =?utf-8?B?TkltN2ppemJBQ2g4SGM2TG9OQUVLS1FnYS9HQnlTdzZHSTkydnZ5VWNkTHho?=
 =?utf-8?B?ckkrQlBJNGcxY1hWMFFjdjFIL25pUStXTXhEU3VrTTRoUE9aalZ0aFBvRmlB?=
 =?utf-8?B?WExmVUpxdjQ0dDZqbWhabVRVV2JsSnNWZ0xqMUZhc0RuY0xXbUppK3lYMC9j?=
 =?utf-8?B?S2tEeG1rTVVjMC92YWtESGtvVmx2TDBEU0UyZXFDTGJONFltRHJMNTFxbWwz?=
 =?utf-8?B?QjBkc2NFUU1yTUI5M2YyUlIwN1Foem95TVAvK1VWVjMxZ1RjK3o2QWJub2l6?=
 =?utf-8?B?bCsvNUNpMnhNS2pqb0d0bUx4YjJ2cnhoNE9pL3cvNVdPNm11cGlWZDNUWnpK?=
 =?utf-8?B?MzZ0WUdxN3d6L2k0YjJGV0JicTBLWE82Z05BTG9MZkVCNktHY3EraVc3Z0Mz?=
 =?utf-8?B?UEY3RVRpM0NHNWN6MlR4SXU2QlFoYkJLa3B5OHJpQ3N2ZUI5VE1ZdWE3YkND?=
 =?utf-8?B?VXl2YUJHV2gzSFpyclgxSFc4RUJpOEF3SGpjT2xmazlmM1M4bEg5dFJjTUE0?=
 =?utf-8?B?N2I3Nll6V0xJYkp2SXJWTyszOVo5RmtTb2FEL2QyaWpJekhzSndsaGJuc0VK?=
 =?utf-8?B?SHR3eE0xc3RESEpaSHNMSlN3aWttWkpENnJ1Rk9SdXRJRkxtaCtqem54ZTR3?=
 =?utf-8?B?Rm9xa1ZrVmRnYzJFenFjMlBqTjExQ2NlNTJZblZEZ3JoTnZVb3pVa3NNSkZq?=
 =?utf-8?B?cHFnaExVbEc2VG5FdUIvSFN3R2V1enVlUlJQUDd4VlhsNE03VTRCK01VQVI2?=
 =?utf-8?B?WXBuMExNMkY1U1pyMjI5dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1VhcExvSEkyTDNzcTlCOXNJLzNtdXc3bXJwYVJXL0FtNXF5T0E4Q3FZZUpz?=
 =?utf-8?B?VkNiZ3RFU1V2ZU5CU0phLzh5S2puK3c5eW15MDNTaGIxLzNBdFhyOWlHdjZL?=
 =?utf-8?B?N3hVd3k0SHNNdmV5Y2pVdVFFVHJ5SS9JWCsyS0JPWmdPaWdoK1lrR3VBdCs4?=
 =?utf-8?B?K0VPcHhzZnlheVV0dDJ1LzlxemtPODUrWjhqek9zREc1dHVFNTFBSE1aRTNo?=
 =?utf-8?B?U0pvNStnd1diSmRVZWhadGl6aTBEMGJ0RitRK0hKdDNBQzRGeTFpMHpSWGli?=
 =?utf-8?B?RjNLckI1cHZkaGg1cTkzbUtScmZzQ0tEMnZrU2MwNWFUOEhXY2NvNi9MZzNY?=
 =?utf-8?B?MjNuU1NZSVZtOVgvT1BUb1M3YTlxK3VhaWV6RytPR3BMZXJxaVhlNGM2ODhu?=
 =?utf-8?B?UllTT0xKOC9NSDRGa1hrbFZmclRaYTd0MzY4MHFMTjl5aXdoS2QxMzBQdTc2?=
 =?utf-8?B?RE5yWEFaWVhBRFJGR1FuU3I0Qy85L1k1b0ZCUkphd0dwMVpOTUJqSXYvT0g0?=
 =?utf-8?B?ZUxrbzBtMkhScnU5cmNmWjJzUGhEaThFSDdFTEVqVlV3c1QxU2pIRGlWWm9s?=
 =?utf-8?B?Ukk4bFhDbWxBQS9jRHhmeW0wcFdjZjkrZVM4Vk9wUGZuWXRzcTA3dXVwc0Zl?=
 =?utf-8?B?Y2RRbjcxenNZQzlUZE9zR2dyTS9UV0hwUDJKeEMyU3E0TUlVZjdjZUM0M3hv?=
 =?utf-8?B?UDBiRUlab3kyVWlXTW5SZjFkamJrYWQ5UDh1NFo5VUVsVjVKQyt6VFVwOHhj?=
 =?utf-8?B?LzhlSUQwTWpKYVdBQzNQL1NmbVhOdmZHZW9LSVAwN2s0NWZLVnRTaVUyM1Iy?=
 =?utf-8?B?UG1nU3hINE1aRzYyRlBkTHBjbjJKWXE0eFZaM1lMRHVPdnFWMnVXYkNKQTdx?=
 =?utf-8?B?NE5wQjl2bngzQ1ExUGFTTHoyTktPck1NQXRnQm1WK2cvUzNNc0w2emRQQWxq?=
 =?utf-8?B?SVRhZkJkNFFDOWxwUURxK0wyZ3dCTDJSdTVUMTlROGp5QXg2aG1yVDNBeGlD?=
 =?utf-8?B?dGx2bDZObzBNTWhGemwrUlVta0dmajVOV3lDaXZFbk9Vd01kVUV4SUp0T2Vl?=
 =?utf-8?B?SVNHOEQ5YzR3c0h0ZlZmcEdnYmdaT3BXNlY0Y1Nmekl5dlA0QW5YWUVtaldQ?=
 =?utf-8?B?djhNbHFHNEpXdFcyUjF3c1paRjVRQlJXUHlTcmhCdXBlc0R4RjFtbWxoRUwz?=
 =?utf-8?B?TW5MT2JiazBRME05ZWVOaFdLM2xoLzdoYnk3WFNYYktzallybkRIMlhTT0to?=
 =?utf-8?B?QUdybFA2TTNGLzVJNDZSR3M1TUdac203Uk9KOHlablMwcnZvUVVCK3Myd1Aw?=
 =?utf-8?B?ZVFiMHBoZ2ZRSjFQWVhTODBiNjEzUThCOXB4VnBsMmwvQnVJUHUrdVRLSkZq?=
 =?utf-8?B?eW5aNHZ6dHhLcjVOanlLdWZNcUdTdTlyZ3BwQnhqK1FzejZ1RGZCVTYyaEZG?=
 =?utf-8?B?ajRxamxXemc1aVZwZEFIRi9HczhFMDlMakM4V00zVHViWDVDMUlRVW9DNTJY?=
 =?utf-8?B?TTI5NjhCdzM3V1hKd1d0Rmh1dzNHQXpzY0JCK2tVOGJWdW45SFlVUUxENDM5?=
 =?utf-8?B?Z0J4Y0NaZDZFT1VVZWE2cDNnZm5YNjIxNnN2VFFDRG1uSmNLbDl1dDl2b2pJ?=
 =?utf-8?B?UFFlK2tGMmRkTmJQNm9SWWI0RWJtMkc4SU0xY1BwSUxVNjAwaHljNzFIYklV?=
 =?utf-8?B?U0NDNi9EMC9pazhab096ZmxSWUhCYXFFcVQvVE56aGptcG5wc3ZGcU9laVN5?=
 =?utf-8?B?Q1R4cWt3ZFdZbDFEV2dyV1pFZzN6ZXdWN1NublJ1WXVrSldzOUE3N0ZEM2J1?=
 =?utf-8?B?M0lQQnhpaG1VbHlOWTJETmNUU1hpZnNKamdTcUkxUDJOcndaR2pGNE5FbS9R?=
 =?utf-8?B?Yll1eEI5SGVLMm5wdlZEOThNWWdZMFBuYzFTampXM3RYcjNWR3d6Y3hSVlRh?=
 =?utf-8?B?ZVkzcW5EdDdkV041R20zTjNwYUw3cG5uRm9uZWoxeGNEVU45V1kxYzluRWJP?=
 =?utf-8?B?U1daZkMvUUZ3cFFFQnlEemluazFqMHZ4WStRMU1XcUlGL2w1YzJ1RDJBdkhp?=
 =?utf-8?B?dzRwaDVZdVlKUVNtckp3MFZzWVZGbWQvNktXLzlqL2NmSk5hak45T1B5bE15?=
 =?utf-8?B?VFhBV0R6akJXQVB4NzQxWEpwc05pdkVreHphMkZLMk4zZ3BYVkg5ODBNbEYr?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd58576-20c8-41df-3f9c-08dccbb3dae0
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 01:00:51.2430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rT9hZoCcsYCL118tqjommYhgue9BSHbs+T4f45UNAcLgo2vLyI+Eny9v3ZIkhKVGbBMgzzmMEd3VikCFxxyWGWiVS+ok36tYR2w3nprV+AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
X-Proofpoint-GUID: EpBVxVOLJAm7vMBPJ7DatP6Nm8Iy7Uny
X-Authority-Analysis: v=2.4 cv=Qdk0vdbv c=1 sm=1 tr=0 ts=66d65fc6 cx=c_pps
 a=DnJuoDeutjy/DnsrngHDCQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10
 a=7fB-LM26dz4zeeh1fgcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EpBVxVOLJAm7vMBPJ7DatP6Nm8Iy7Uny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030006
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


On 8/31/24 8:03 AM, Sui Jingfeng wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> Hi, Xiaolei
>
>
> Thanks for your nice catch! I have more to say.
>
> On 2024/8/16 09:55, Wang, Xiaolei wrote:
>> Ping ...
>
> 32 address -> 32-bit address,
>
> Perhaps, we could improve the commit title a little bit
> by writing a more accurate sentence if possible, say:
>
> drm/etnaviv: Properly request pages from DMA32 zone when needed
>
> or
>
> drm/etnaviv: Request pages from DMA32 zone on addressing_limited
>
>
>> thanks
>> xiaolei
>
> Vivante GPU is a 32-bit GPU, it do can access 40-bit physical address 
> via its MMU(IOMMU).
> But this is only possible *after* the MMU has been setup(initialized). 
> Before GPU page
> table is setup(and flush-ed into the GPU's TLB), the device can only 
> access 32-bit
> physical addresses and the addresses has to be physical continues in 
> ranges.
>
> The GPU page tables (GART) and command buffer has to reside in low 4GB 
> address.
>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index 7c7f97793ddd..0e6bdf2d028b 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>>            * request pages for our SHM backend buffers from the DMA32 
>> zone to
>>            * hopefully avoid performance killing SWIOTLB bounce 
>> buffering.
>>            */
>> -       if (dma_addressing_limited(gpu->dev))
>> +       if (dma_addressing_limited(gpu->dev)) {
>>                   priv->shm_gfp_mask |= GFP_DMA32;
>> +               priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
>> +       }
>
> The code here  still looks itchy and risky,
> because for a i.MX8 SoC with multiple vivante GPU core.
> We will modify priv->shm_gfp_mask *multiple* time.
>
> For the 2D core and the 3D core have different DMA addressing constraint.
> Then, only the last(latest) modify will be effective. This lead to the
> probe order dependent.
>
> However this may not be a problem in practice, as usually, all vivante
> GPUs in the system will share the same DMA constraints. And the driver
> assume that.
>
> But then, we probably still should not modify the global shared GFP
> mask multiple time.
>
> Now that we do assume that all vivante GPUs in the system share the
> same DMA constraints. And the DMA constraints information has been
> assigned to the virtual master. The right time to modify the
> `priv->shm_gfp_mask` should be in the etnaviv_bind() function. as
> this can eliminate overlap(repeat) stores.
>
>
> Please consider move the entire if() {} to etnaviv_bind(), just below
> where the 'priv->shm_gfp_mask' was initially initialized.
>
> or alternatively we can just hard-code to use low 4GM memmory only:
>
> priv->shm_gfp_mask = GFP_USER | GFP_DMA32 | __GFP_RETRY_MAYFAIL | 
> __GFP_NOWARN;
Thank you very much for your review and suggestion. I will move the 
entire if() {} to etnaviv_bind()

thanks
xiaolei
>
>
> Best regards,
> Sui
>
>>           /* Create buffer: */
>>           ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
