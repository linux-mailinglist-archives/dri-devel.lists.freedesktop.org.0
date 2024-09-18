Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30B97C596
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED8110E11E;
	Thu, 19 Sep 2024 08:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1617 seconds by postgrey-1.36 at gabe;
 Wed, 18 Sep 2024 09:14:20 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A0410E1A1;
 Wed, 18 Sep 2024 09:14:20 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I4u3HE019190;
 Wed, 18 Sep 2024 08:47:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1uyk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2024 08:47:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbh1kkL56G22akCveaWUw2qQYsDYrWwEuvQ4nZIzniJvJRGwMF0My5SgRMCjy/7dFNm6fr5WScXlwDLrvLSOcJrshCIFjbUX/vx1mVJkh0wm5rE43Fc+4MS0ndxLyMc3P7z0S+o4/s8GxPFQ8H2mSvB6oTC3Os4Ojmhuk10l1y7HvaBffSMSUOJwj4njokXYFgSLRGDTljgKeowWeB+vRjwZrU6CjgSWA0XzTicALXdr5ZsDX4b1H0OZynGwSTIIYCN6PC2+IdzTUrPlabRz12ke52LkpfwhjCWyZAuJ0jCMu4oZxpf74S3n56+BIBYb/4GTr+ivME5j2GP25uopyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeCwyBfnUvE88t7iCwKde9ZBYwxekJy2jZjBYYBrhIk=;
 b=EnrpOC3xO5pgdtTitWHm/U/x5jhM5F0WO93IyKM1VGiqLCYRUVJIvTiAqYLq0qh6UcF1xZkjgDSk03kbYNHlrh0PHiKpya+JlwYWFm2JwRb4MkhW0APmjzYbHW+BJjmcfpcN6YdLJmtwx3gpHl3vjLibeTDfjDOEEqXkrt8QEGv2Ctwk7YmXVnojLKUVyzDm4XJFp8v6OUADtSsRgJ+GP7gHB1WqZCGZdN2ceRfws9pt9+DPu8ZfnkmPj2HyzWzjg+0YWzrOTWQAgXVmlvlME2GF4fStUggfcizAvs+d2OundkWnjV+VMh3X6NresRhfWdqyI4rqv7Zgc8UfoKNgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 08:46:53 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 08:46:52 +0000
Message-ID: <6b23d060-3973-4bb5-9f28-dae7d68ad971@windriver.com>
Date: Wed, 18 Sep 2024 16:46:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix OLAND card ip_init failed during kdump
 caputrue kernel boot
To: Lu Yao <yaolu@kylinos.cn>, mario.limonciello@amd.com
Cc: Hawking.Zhang@amd.com, Jun.Ma2@amd.com, Tim.Huang@amd.com,
 Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, andrealmeid@igalia.com,
 candice.li@amd.com, christian.koenig@amd.com, hamza.mahfooz@amd.com,
 jesse.zhang@amd.com, kenneth.feng@amd.com, kevinyang.wang@amd.com,
 lijo.lazar@amd.com, linux-kernel@vger.kernel.org, sunil.khatri@amd.com,
 victorchengchi.lu@amd.com, dri-devel@lists.freedesktop.org
References: <5dcd603a-7d62-439d-9a07-9d7d9324e0b6@amd.com>
 <20240829081141.134471-1-yaolu@kylinos.cn>
Content-Language: en-US
From: "Liu, Yongxin" <yongxin.liu@windriver.com>
In-Reply-To: <20240829081141.134471-1-yaolu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::12) To SJ0PR11MB5072.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5072:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: e737a9fc-1d31-4591-5e37-08dcd7be70ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2RKdzF6T3FiUnVVSXZkQzF3S3pKeVV3dzhmOEpnN0FwQUNkTU0xcUg5NFVV?=
 =?utf-8?B?UndVUzdLaVdla3Rja0J3VVY2NnIrUjZPakRCTk1PRmh6L2lLNjZLTmFJTWlJ?=
 =?utf-8?B?ZkYrcU9qNG9nejZQajRZcEdoUWhhVGx4eWJXd2p4UVNlZTZYaFErcXhZQnpr?=
 =?utf-8?B?VkZMYll1aEdSVXo0Qm5uNHI0MEhEV2lRSlpVajJxcnJaVUJYSnJVVHBoUGxk?=
 =?utf-8?B?ZUlWZzRqWGZld2xuRzJNb3NIQkcrVWh2bDBzb2RQblloUkgyMjdzV05oYnI3?=
 =?utf-8?B?YjZLbklJclpwVGIrNlREdzRiU3FaK2JUNkxFZEVzc21lNTUzbk5qelROMDlW?=
 =?utf-8?B?cThTVzRCOG1oRFFHRUdGM01hWjVmZ3ZYRy9QYXBlY3hRSm42MnYvVlp1U0Rj?=
 =?utf-8?B?VTZXZ05sZHoySk9DZ2xPQVpqcDZYR2VXQ1kvK0dibWVkYUtIVUxZcWppdkFw?=
 =?utf-8?B?V3pMSzVXclR4VFFpbU9zVXhIakQyRklabGVlbG5ZNFhKWTJzY1FFeEowcEZh?=
 =?utf-8?B?U3phTlRqbEJxNFl6bEo0cklTdDhjVHU1bmhjWHE3YzlxeFlvdGlBU094Znpw?=
 =?utf-8?B?N1ZQNFVmUVNLQWd6Z2FuVFloVDdKMVduMDkyVUZnUlhCN3dkOW4waTFzaUgw?=
 =?utf-8?B?WmxqYmVHWkZHQW4zWnJUZTQwQ1liNEh3TVpKRTFMMkdGaG1aRmJoRTdVOTd4?=
 =?utf-8?B?ZXV5dWQrNG5ZUEVjQ0p4SGllZnE2dVJLaDhxekxia1Vqb2IvMURORWNnd2di?=
 =?utf-8?B?aks5OWhoTjg3MGMwenY2Q0RiWkFBVS9KVyswKzQ2c1VpSUVNU0I0UUhibXFB?=
 =?utf-8?B?cVo4K05oV0pLNDJ5YnZ3ZHQvL3dvcklNOVRRVG02VUNJaFFsYmJaY0R2OTdK?=
 =?utf-8?B?NlNMMkQ5QXdraWxpblYzT1hpSTRwV2N4cFVldlAzdG1maWxpeEFSSVpHQ1Jk?=
 =?utf-8?B?OTJvMXZwUlRRcnBpL08yTXpwWXdGRFhKdWRUMDNyNzdoZ05Za1gyZ2RyVFRk?=
 =?utf-8?B?bWdFRVNNZDVCRUcyaEorNXZEcjNIQW1RYkdVQ1BnQUFPZU16SXNhQnhac3N5?=
 =?utf-8?B?azY5N0lnV3A0SjJOQjFsdFJ0RUN6YnkyVkxFbWRJZHdhUWpvSi80U2djV0tX?=
 =?utf-8?B?Mjk4eHlGRFFVWFpOcm9kM3g5Y1NEMjNMR2JrdmdWdXRrd0NIcjEybFp6d0pr?=
 =?utf-8?B?MDRLSEhOeUJueEpUd1pIYWh5dUR4d2RvVDRBeHRaZnhVY3U2RHQwRHhqM29Y?=
 =?utf-8?B?aTY4d2ZmUDRXQ3dabndEVGhibC9KVldLaDdPeWtyWXhwQ3ZIRUlLVHhGV25R?=
 =?utf-8?B?b0t0aGNsRjZuM3RFdmtqUFVBRVd1Q3lMai9rbGtuOWtsL0VYaW1qblZMaHJ4?=
 =?utf-8?B?R0p5a3graFdWS3FNZ2pYMkRjV3Y4cGdUVElhMHU1djJ3SEN1S0NpTE5QMUNS?=
 =?utf-8?B?ZU5yR3ora0l5VVQ5QVNKY3NHOEtXN1h1OGpKNU9IZmF1QTY5SUdMRE5pak5L?=
 =?utf-8?B?YnVlb1Z5Sk5nRlZ2RzQrQUxid20yaTJEbERiYmhydHV3eGlaNzhNQkdSUGxW?=
 =?utf-8?B?YW95REIzZzFoNDlnaDQrcXY1SXZWNkxJQ3h4Y2xISHJnUjlFWXNVV3BSaXlx?=
 =?utf-8?B?aXUzYVIvYVkyMUE1Qm1YbUpMRll5SWdTZTk4di81ZmlEajFUUXh5WGlrZ1Z2?=
 =?utf-8?B?L09OWXdaZ2o3RHVrTTN6eTdyRkhKRHl2Vkw3ODljSGI2azhCcnpkNUp5RHlE?=
 =?utf-8?B?bHh1VUhNZ1R5RDd0WHpXSWEvNENtKzAvY0FJUlpEcFh5RC9aN2RpbGdOWFMv?=
 =?utf-8?B?Z3RpTWtia0F6TlpVZndXZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VncwNkRwRnUyRURsT0JMbkFYaDVlUldGZHVxbStHeXM2U3FKaStIZXVuMkgv?=
 =?utf-8?B?RXNkV3g3UlVCdnRoc3V2MUw2eGUyeWppUWsxZjh2WWEvYmVMTDVmYUsrQ3pU?=
 =?utf-8?B?b3lvOWpDUXhZY1UxK0ZPNXdQNHBCR00zNEpNcWNSUFBCT2tEOUMzV2dLdWNS?=
 =?utf-8?B?T2RTUW01Nmxxa0V6VjBKTEZTdytNOUU2em1DRlB6Z3pmcmVnMTVUdFZiaU8r?=
 =?utf-8?B?NHljVUZWeGpNRW1sdjl5aFZJL0duS0w4QkxLWWFEMUIrc1ZocFVrekw4d0xH?=
 =?utf-8?B?RHBCT0UrWUdHMkY4Mjd4QnVLU2x3UzladVBxaS8xV2k2UkY4M0Nudk9EN3kv?=
 =?utf-8?B?cEhWSlBVbDNUOTZxZTF1NVVFTGgyREp5UU15aUhkUlAwV3pLTGlIV0NCTmIz?=
 =?utf-8?B?U3poeHh1aEh6WTdlOFg3UkZwa3VLYzM1VUhiT0JDT3k5VXl6THp5ZWpHdmxz?=
 =?utf-8?B?UFE4S3JhdUN3V0xaME9tcC84M2dWWVZOY09qVXlVQUN2a29xZmFOOHZTUUhK?=
 =?utf-8?B?RVBvNEY3YmdtZUw4RkJDVHEwci91VDkyaDJ5bStLYjNkYkhkbk1pa0JsNFp6?=
 =?utf-8?B?V3g0dExyd0RFZDBoRTVBUXl4U1NBOWUveWFib3BNeFczQllPNXFmblZiWXhz?=
 =?utf-8?B?TmtrT05ORTJzeVIwSlJ6SkMvblZBRCtyZmgweEc0WTh2TGEzZVd5eUJrbE8r?=
 =?utf-8?B?cExRbjY3bUxCRFgzL2U5T3c5czN4Y1Z4c2lVRGNmUDlJUHJrSm8yZGdlMkRx?=
 =?utf-8?B?SjB1ODhtSGtVMVpNcWdidWt0SmcxeVNZSEZ6QW9pd2NFY0dYTDFqMERNOFIy?=
 =?utf-8?B?UlNOcWFUcDc5dGVacEhZSkJUd2h0RFFzUU5yaTQrWjFrekhqQ0NQVXRrejB4?=
 =?utf-8?B?ckptdm9Ka1BxekZaZHMzZGMxaERCaHo0TThsekQ5dGhIQWtIcXI3VWE2NFYv?=
 =?utf-8?B?WXh4b255V3lOdkQvR2s5c3BrSFNUcUdMTkpENjZyNy9CS3N6M2dhMlg3M3Fk?=
 =?utf-8?B?RkMrNXZybEYvcEU0ZTRaQlgzU0pOWmxtbVBicjYzVTVUdW5XWGxScXVMUGZo?=
 =?utf-8?B?UU5kR2w1Tmh6RnVjeWo5SmMzN0pmTkpFTjJ0c3kyQ0lWOFZKSHpyKzM3UjhV?=
 =?utf-8?B?UXFQd3NqYnN0d2pCaWo3dXlzYktRRW5KOVNHNWFJbVhqdXpTY1BOUFFaMmtY?=
 =?utf-8?B?ekZ0c2srWWlHUDE1VVNnaGowd3ZpcEtoaGpKK3pxdmg5NUlFcElOakVwQUt5?=
 =?utf-8?B?eVVuR09CSDRhaklSOHY1TnlGODVQdFYrY3hKTGU5SVJaUGtlOWdOVkN2VXli?=
 =?utf-8?B?aGtTRjZiZ3JnYkp4bGZiQnVHcWpSYzg2a3VHczQxaG4zWnBlbE83Z1VQOHBG?=
 =?utf-8?B?VUVNSG1CdXF2TjdhakcvMkZObisvdnlCQWhQUXJzQ0hWV05reitYYkN5VG9h?=
 =?utf-8?B?QTJNRUZsRUZzQmh2UXkwSktUenh6WmlFb2oyUWFJM3FNT1l1Vm94T1FKMEVm?=
 =?utf-8?B?OURrVFJQd09nQVRCT3ZzanBqZENCc2pNeVdIRFlFUkF5cisrMmpxbytpeTdO?=
 =?utf-8?B?NUpNRWxCVXI3aE5NWmtFL1NIckpDcEFBZ2J3ZVRPT0Z0OHUrSTNxaFRTS2hP?=
 =?utf-8?B?Q1lMZTkvOTNtdFlpWjZPMitmWXh5T25SNkgrZkgxWXpmRU1DWGV2Y0NHTmNk?=
 =?utf-8?B?d0kxLy9uR3BzM0tUR3NySnZaUXZlN0tqb2xMZktOVUp3QlJLdTRGMkJTV2lU?=
 =?utf-8?B?Zkg0Wk11MVNYeDg2bk5Hb2wwa0Q1YmxiVGt0VnQxTnhKQjRkV3hDNlljazBu?=
 =?utf-8?B?WGhTZDlWZThacWdMSW1kVXRUenhib0FLRGZnYnlOVWdaTStEMTJPa0pRVXhT?=
 =?utf-8?B?ckR1a0J2M2ZYaXBGcjZBRWcreEUrVTBMWU9wMkpleVRIOWdoS1ErYjNxMDZX?=
 =?utf-8?B?aFZZRnEwOWFGQ3I1KythRlh0aUpHcnJqeHB3YkJ5ZDR5Y0tuWElKNTlkcUt0?=
 =?utf-8?B?VlpNTHJSemtHYjk0SXZMaDhHeGxRdWJlWDNlYmJsK0VHYTUzRnNhRGhqRW1n?=
 =?utf-8?B?S25RK1RoYjRndXZIUTN2c1BYKzZsRDBza1h1TDhRQlZwKzFnQURRK0VuVWp6?=
 =?utf-8?B?b0pRRFljeE9TMUZUOXBSemtmaXV6bHpjUDVaU3A5RGhDVElzeVVZWHBWWUIw?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e737a9fc-1d31-4591-5e37-08dcd7be70ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 08:46:52.7917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8ss4XjGScmCrBkpo+F3MMx6+bWQmyVeRf/lztmxkDJM7dZtzQ4xl3BntaFqJNesDbLlapcuZbsmpe53k6EMlU/iiWFjykMv0BOLq8JqD7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66ea938b cx=c_pps
 a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10
 a=20KFwNOVAAAA:8 a=zsV8aoxCpfEpN65H77cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tRZvUmx3yhsuhEQPayJFOxsGVzHdnwDJ
X-Proofpoint-ORIG-GUID: tRZvUmx3yhsuhEQPayJFOxsGVzHdnwDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_06,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409180055
X-Mailman-Approved-At: Thu, 19 Sep 2024 08:10:55 +0000
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


On 8/29/2024 16:11, Lu Yao wrote:
> On 2024/8/22 22:05, Mario Limonciello wrote:
>> On 7/23/2024 04:42, Lu Yao wrote:
>>> [Why]
>>> When running kdump test on a machine with R7340 card, a hang is caused due
>>> to the failure of 'amdgpu_device_ip_init()', error message as follows:
>>>
>>>     '[drm:amdgpu_device_ip_init [amdgpu]] *ERROR* hw_init of IP block <si_dpm> failed -22'
>>>     '[drm:uvd_v3_1_hw_init [amdgpu]] *ERROR* amdgpu: UVD Firmware validate fail (-22).'
>>>     '[drm:amdgpu_device_ip_init [amdgpu]] *ERROR* hw_init of IP block <uvd_v3_1> failed -22'
>>>     'amdgpu 0000:01:00.0: amdgpu: amdgpu_device_ip_init failed'
>>>     'amdgpu 0000:01:00.0: amdgpu: Fatal error during GPU init'
>>>
>>> This is because the caputrue kernel does not power off when it starts,
>> Presumably you mean:
>> s/caputrue/capture/
> Oh, you're right. It's a mistake.
>>> cause hardware status does not reset.
>>>
>>> [How]
>>> Add 'is_kdump_kernel()' judgment.
>>> For 'si_dpm' block, use disable and then enable.
>>> For 'uvd_v3_1' block, skip loading during the initialization phase.
>>>
>>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
>>> ---
>>> During test, I first modified the 'amdgpu_device_ip_hw_init_phase*', make
>>> it does not end directly when a block hw_init failed.
>>>
>>> After analysis, 'si_dpm' block failed at 'si_dpm_enable()->
>>> amdgpu_si_is_smc_running()', calling 'si_dpm_disable()' before can resolve.
>>> 'uvd_v3_1' block failed at 'uvd_v3_1_hw_init()->uvd_v3_1_fw_validate()',
>>> read mmUVD_FW_STATUS value is 0x27220102, I didn't find out why. But for

Hi,

I have a Oland GL [FirePro W2100] card and mmUVD_FW_STATUS was changed 
from "0x27210102" to "0x27220102",

when system was resuming from suspend-to-idle, with the following error:

     [drm:uvd_v3_1_hw_init [amdgpu]] *ERROR* amdgpu: UVD Firmware 
validate fail (-22).
     [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP 
block <uvd_v3_1> failed -22
     amdgpu 0000:02:00.0: amdgpu: amdgpu_device_ip_resume failed (-22).
     amdgpu 0000:02:00.0: PM: dpm_run_callback(): 
pci_pm_resume+0x0/0x140 returns -22
     amdgpu 0000:02:00.0: PM: failed to resume async: error -22

Does anyone happen to know who changed the value of mmUVD_FW_STATUS? And 
what's the meaning of "0x27220102"?


Thanks,

Yongxin


>>> caputrue kernel, UVD is not required. Therefore, don't added this block.
>> Hmm, a few thoughs.
>>
>> 1) Although you used this for the R7340, these concepts you're identifying probably make sense on most AMD GPUs.  SUch checks might be better to uplevel to earlier in IP discovery code.
>>
>> 2) I'd actually argue we don't want to have the kdump capture kernel do ANY hardware init.  You're going to lose hardware state which "could" be valuable information for debugging a problem that caused a panic.
>>
> So, maybe  should skip all the  ip_block hw_init functions when kdump?
>> That being said, I'm not really sure what framebuffer can drive the display across a kexec if you don't load amdgpu.  What actually happens if you blacklist amdgpu in the capture kernel?
>>
>> What happens with your patch in place?
>>
>> At least for me I'd like to see a kernel log from both cases.
>>
> After add 'initcall_blacklist=amdgpu_init' in KDUMP_CMDLINE_APPEND,  kernel logs are as follow:
>
> [    4.085602][ 0]   nvme0n1: p1 p2 p3 p4 p5 p6
> [    4.157927][ 0]  [drm] radeon kernel modesetting enabled.
> [    4.163383][ 0]  radeon 0000:01:00.0: SI support disabled by module param
> [    5.387012][ 0]  initcall amdgpu_init blacklisted
> [    6.613733][ 0]  initcall amdgpu_init blacklisted
> [    7.859320][ 0]  mtsnd build info: e3fc429
> [    8.687512][ 0]  EXT4-fs (nvme0n1p3): orphan cleanup on readonly fs
> [    8.694035][ 0]  EXT4-fs (nvme0n1p3): mounted filesystem 75c1e96b-cef8-4ed3-86ea-45010c7b859c ro with ordered data mode. Quota mode: none.
> [    9.309862][ 0]  device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
> [    9.325236][ 0]  device-mapper: uevent: version 1.0.3
> [    9.330946][ 0]  systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
> [    9.341512][ 0]  device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
> [    9.380944][ 0]  fuse: init (API version 7.39)
> [    9.390196][ 0]  loop: module loaded
> [    9.486957][ 0]  lp: driver loaded but no devices found
> [    9.494904][ 0]  EXT4-fs (nvme0n1p3): re-mounted 75c1e96b-cef8-4ed3-86ea-45010c7b859c r/w. Quota mode: none.
> [    9.505931][ 0]  systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
> [    9.518899][ 0]  ppdev: user-space parallel port driver
> [    9.524908][ 0]  systemd[1]: Started systemd-journald.service - Journal Service.
> [    9.574209][ 0]  systemd-journald[350]: Received client request to flush runtime journal.
> [   10.118484][ 0]  snd_hda_intel 0000:00:1f.3: Unknown capability 0
> [   11.590124][ 0]  hdaudio hdaudioC0D2: Unable to configure, disabling
> [   23.892640][ 0]  reboot: Restarting system
>
> After with my patch in place:
>
> [    4.074629][ 0]   nvme0n1: p1 p2 p3 p4 p5 p6
> [    4.146956][ 0]  [drm] radeon kernel modesetting enabled.
> [    4.152409][ 0]  radeon 0000:01:00.0: SI support disabled by module param
> [    5.379207][ 0]  [drm] amdgpu kernel modesetting enabled.
> [    5.384909][ 0]  amdgpu: Virtual CRAT table created for CPU
> [    5.390514][ 0]  amdgpu: Topology: Add CPU node
> [    5.395225][ 0]  [drm] initializing kernel modesetting (OLAND 0x1002:0x6611 0x1642:0x1869 0x87).
> [    5.404040][ 0]  [drm] register mmio base: 0xA1600000
> [    5.409118][ 0]  [drm] register mmio size: 262144
> [    5.413864][ 0]  [drm] add ip block number 0 <si_common>
> [    5.419207][ 0]  [drm] add ip block number 1 <gmc_v6_0>
> [    5.424448][ 0]  [drm] add ip block number 2 <si_ih>
> [    5.429427][ 0]  [drm] add ip block number 3 <gfx_v6_0>
> [    5.434668][ 0]  [drm] add ip block number 4 <si_dma>
> [    5.439733][ 0]  [drm] add ip block number 5 <si_dpm>
> [    5.444803][ 0]  [drm] add ip block number 6 <dce_v6_0>
> [    5.450051][ 0]  amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from VFCT
> [    5.456517][ 0]  amdgpu: ATOM BIOS: 113-RADEONI6910-B03-BT
> [    5.462023][ 0]  kfd kfd: amdgpu: OLAND  not supported in kfd
> [    5.467857][ 0]  amdgpu 0000:01:00.0: vgaarb: deactivate vga console
> [    5.474239][ 0]  amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
> [    5.482781][ 0]  amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
> [    5.490242][ 0]  [drm] PCIE gen 3 link speeds already enabled
> [    5.496017][ 0]  [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
> [    5.504778][ 0]  amdgpu 0000:01:00.0: amdgpu: VRAM: 1024M 0x000000F400000000 - 0x000000F43FFFFFFF (1024M used)
> [    5.514812][ 0]  amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
> [    5.523710][ 0]  [drm] Detected VRAM RAM=1024M, BAR=1024M
> [    5.529133][ 0]  [drm] RAM width 32bits GDDR5
> [    5.533532][ 0]  [drm] amdgpu: 1024M of VRAM memory ready
> [    5.538963][ 0]  [drm] amdgpu: 225M of GTT memory ready.
> [    5.544293][ 0]  [drm] GART: num cpu pages 262144, num gpu pages 262144
> [    5.550950][ 0]  amdgpu 0000:01:00.0: amdgpu: PCIE GART of 1024M enabled (table at 0x000000F400E00000).
> [    5.560859][ 0]  [drm] Internal thermal controller with fan control
> [    5.567163][ 0]  [drm] amdgpu: dpm initialized
> [    5.571642][ 0]  [drm] AMDGPU Display Connectors
> [    5.576278][ 0]  [drm] Connector 0:
> [    5.579782][ 0]  [drm]   HDMI-A-1
> [    5.583108][ 0]  [drm]   HPD2
> [    5.586088][ 0]  [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952 0x1953 0x1953
> [    5.593937][ 0]  [drm]   Encoders:
> [    5.597353][ 0]  [drm]     DFP1: INTERNAL_UNIPHY
> [    5.601985][ 0]  [drm] Connector 1:
> [    5.605488][ 0]  [drm]   VGA-1
> [    5.608553][ 0]  [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e 0x194f 0x194f
> [    5.616400][ 0]  [drm]   Encoders:
> [    5.619807][ 0]  [drm]     CRT1: INTERNAL_KLDSCP_DAC1
> [    5.985857][ 0]  amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 6, active_cu_number 6
> [    6.346743][ 0]  [drm] Initialized amdgpu 3.54.0 20150101 for 0000:01:00.0 on minor 0
> [    6.433683][ 0]  fbcon: amdgpudrmfb (fb0) is primary device
> [    6.439260][ 0]  Console: switching to colour frame buffer device 240x67
> [    6.454578][ 0]  amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    6.816426][ 0]  mtsnd build info: e3fc429
> [    7.827506][ 0]  EXT4-fs (nvme0n1p3): orphan cleanup on readonly fs
> [    7.834021][ 0]  EXT4-fs (nvme0n1p3): mounted filesystem 75c1e96b-cef8-4ed3-86ea-45010c7b859c ro with ordered data mode. Quota mode: none.
> [    8.502847][ 0]  device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
> [    8.517899][ 0]  systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
> [    8.526044][ 0]  device-mapper: uevent: version 1.0.3
> [    8.531923][ 0]  systemd[1]: Starting modprobe@loop.service - Load Kernel Module loop...
> [    8.545910][ 0]  systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
> [    8.564367][ 0]  fuse: init (API version 7.39)
> [    8.568872][ 0]  device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
> [    8.581889][ 0]  systemd[1]: Starting systemd-journald.service - Journal Service...
> [    8.591857][ 0]  loop: module loaded
> [    8.639020][ 0]  lp: driver loaded but no devices found
> [    8.662288][ 0]  systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Setup (Early) was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
> [    8.685851][ 0]  ppdev: user-space parallel port driver
> [    8.697866][ 0]  EXT4-fs (nvme0n1p3): re-mounted 75c1e96b-cef8-4ed3-86ea-45010c7b859c r/w. Quota mode: none.
> [    9.362160][ 0]  snd_hda_intel 0000:00:1f.3: Unknown capability 0
> [    9.716497][ 0]  hdaudio hdaudioC0D2: Unable to configure, disabling
> [   20.101499][ 0]  reboot: Restarting system
>
> Compared with the blacklist method, amdgpu driver initialization can be completed after adding patch.
> >From the external observation, more startup animation can be shown (of course, this is meaningless, because it will restart immediately).
>
