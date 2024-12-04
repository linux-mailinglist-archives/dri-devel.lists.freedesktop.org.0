Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F69E37FD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEA510E0CF;
	Wed,  4 Dec 2024 10:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="feFxyF0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C76610E0CF;
 Wed,  4 Dec 2024 10:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEpnYa1O97h9Nb8k4utcbWWiiYxHEYoA2TXkIdt/pBktMc99/F7EKexq17qxbDOerXeU9hf/zZdKDkYn3xyhd17K0TmUngvzpc4MgNfbvErG7zpyqvt1ZGxTLZ5e1lN6iosLBo8xaqZzUa8nt/0tlnkI0tH5ybAstriDSATu4mq3ojkB+5nXifDwRNEY09QvYoGbAT7vBLpZxLv4UJGm0IXb+s3/O22p8gfi+yhEizSy7Ih7EG8n+JuN322aknn00e8oqqbSz4LZ3pwg6RPqj5sF3xXQApt9R/sfL5KfvHAHkp6fXAaVvPyxxp6kbPQs15Kx0JxVNNc8JksuYYsUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh8qZH8VaRqH6EiVfgOnEUvXRA4GOZbqMYxcqMCLPF0=;
 b=jzJEc4UrBmKmuSaEu/fl2NnTcuHTE0UJjSP7kw2ydzdenqVMxFOY+1BQpdDkhvUUE74GSpLjLbLG9p0CGV1+rQdsDJhZpANwes0FSI+8O+hCZRzSICbvAQ8RjVgxwUQ7/+KSLPyb0Mf2LrdlIR91r1D2gvRKibmEk1tI5yZqgpo/m9cZBGyi8zg1BTjp75Bjo+yOa2Jgif5XPoootwcpruKh/LswLZaQ8k40y1gs8LyUUMhdc92HGdIlm8qgwg1b+KR00J93q8ya0OY5o3fXPDvJ2cBoZiejwj6fxxLcHEMwuV517X0W63VOuSg7u6BzcmRg1PHzy1ar+1U6h+HpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh8qZH8VaRqH6EiVfgOnEUvXRA4GOZbqMYxcqMCLPF0=;
 b=feFxyF0BXS+pnQ8N7q+zrJGMzb7/crV6LUmuGorIFSnMfe8VPxBzf8lHIjEmEsjhLTg7vBoDjfvFJlP8AWlXMsEdhUeCIuwTNqduze2E8KssRPNN1FqRZ/A6GDpmZGPW1+1Uqi//UEAalkj21JsW2J/Bi+4fhN5xknLzHv3pZ2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 10:56:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 10:56:21 +0000
Message-ID: <1e378253-57f0-46b1-b6a7-a6b8997d7e1b@amd.com>
Date: Wed, 4 Dec 2024 11:56:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
 <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
 <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
 <c74e9f5c-3201-4083-8b79-80fdbbd903f2@amd.com>
 <5f3c04297fd6f008cad0415d6b6c04ba8c3b5a8c.camel@linux.intel.com>
 <26747cae-d66a-4bc4-9efb-4fdda4ac766b@amd.com>
 <e7654f8140ce2bd1afdca20b21b139cf810b6070.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e7654f8140ce2bd1afdca20b21b139cf810b6070.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7325a4-b618-45e6-4e5b-08dd145249a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzBoQi8rNndvcndmQ0Q0em8wSW84YlQ3V1Nvdk12R2tYSElXUnNOVzcrLzJy?=
 =?utf-8?B?SGs5bi9lYXYvYmo0b2NBby9ncTBXMGRPTXFlTGZQeTRjMVlLZjQvVHFyYlNZ?=
 =?utf-8?B?Q2Q1Wm0vanU2MXFFUSs3Zk1LTkdJVFkybUlKbmFzTFdUL0F0Z2pOVEt3S1dG?=
 =?utf-8?B?cklnZ3dNc3ZCSzhJMU9vdW5Md0tLWEpkcFdVS3BJcFd6d0pUbm5vTEIveGFR?=
 =?utf-8?B?TUVjcVhBRC83UE9yTzM4cmVvaUdKWVZNclI0aFI0b25DYlJVUVE4N24xaE84?=
 =?utf-8?B?c0Z4ZEVDbjFxOHVXSitVY3FFNDlHRjh6NHlHNmovV0NTeGVGY1EvK0o3c29Y?=
 =?utf-8?B?YU1aQks2Y1JWSmRYZDJWUGszUzU5YWwxQk1GcFpxMTFDQ28yNXh3Y3FHb0xz?=
 =?utf-8?B?aFYxbzJUWE5CN3NiQk5vQzAwaEZzNVdmVWxPYmgrSVFFOUdwK3U5TGRJcFhq?=
 =?utf-8?B?RUpnRlZrNVkxODlHRkRzcVhFd1AzaTVkczdrdUJhQjJla3B2dEdZWkJ6aXlJ?=
 =?utf-8?B?b1dRVnRBTDhNWjZLLzlOQk5raUxmWERiNFZBeUdaY2pUQ3Q3MGJpei9oT1dm?=
 =?utf-8?B?dTh2S1AyM0lFM0kvTTBjZVU1OEpCajhOOUxPUGFUdGdQSksrczliOFZUQzhh?=
 =?utf-8?B?VTNTQm9oSWNQZU9LbTdwaEh4OEc3N3BueEZkV3dtRWd4RUNYVDZpcTluLzRm?=
 =?utf-8?B?azRXa0pTYlBjT2tXdXdjV3BhWlZuNUoyWEtWcEZTWjdtc3FGYjd1RXQrY0Fq?=
 =?utf-8?B?K0RFdHBRdCtRYVpuWlFvUndJQ3orT0xIUkU3VFF5dFFRcGZFN2VmUFJnenVz?=
 =?utf-8?B?TWkyazFFMG9WNEVQY1p1K1EvTnpvSFI0VUc4Q1VlTEFoOGo4dzgwazl3b3ds?=
 =?utf-8?B?QXl5dmRZandLR21SS01zbFVGNWkxZjFJeUpCdklmNE5jakFCd3RmTzE1clZH?=
 =?utf-8?B?b3A2ajUrZjdHOGZyTk5zSFNhTmp6eTNTYTZEUzFld3hDNWROZkFjSzdadHQ3?=
 =?utf-8?B?UkpaY0xmTTUramJPaXdZZDNKdFZMUXJ5UmdBR2ZKV2ZkYjRpbnpObWg2OFJz?=
 =?utf-8?B?N2dERkdNaFFsU0pLd0h6WjhKanMxR0NjV3BxcnJIOXFVcWlQTmExTVZvajFN?=
 =?utf-8?B?MHMweE1UQW40UVFkOGNjWTJIQkJkM2lIOGlJNVFKMmlGMnB3N2FrUzR2VWVy?=
 =?utf-8?B?US9kUWdtUFQwSElaR2hKak1lZDRqSnEvdFJTTmpTeUZPZGhuZ0NIcjd3TERR?=
 =?utf-8?B?RVdEdjZuR1Z6UndjWFNCcXZ4MGZrNjZqWU9RamZIUjZoMDNxeGpoWDlNcTRi?=
 =?utf-8?B?eWd2WjJDeTNDNFMzZ092U1dOTWZRbjVBcEh3NEd5cXZNRkFGM3VDcmlKTGVJ?=
 =?utf-8?B?WXdGUWZBTHhKNUVuVmtxSUdUekZJWkdibjJ6Z1FNR2l2QW1ZamlpbUZ5c1R6?=
 =?utf-8?B?QlFoclE1ditiWWY4eHVNVXp4TXd1NGVzYVk1NjZIZHFia0tWMXNza0RqRHU4?=
 =?utf-8?B?WG42V2wwZ0dvVlIrVWZDVFNPakhSYW9Zam1oZzdtczFzTTdqV1d2WW9pWlB2?=
 =?utf-8?B?MzlQUmhGa2RKTTVVYkRqMWoyMThLS3Rua0hBOWorR0k2QzV4MzVtZzdZWjJX?=
 =?utf-8?B?OWZTRlc4ZWVGK2ZEdWdXc1RyU0R5V01vbmRNVTVwM2xPaktkeFVvRnk5QzBR?=
 =?utf-8?B?UkM5aVVsMHB3OXI5QlVTVnMrRWptWGhhNVdoNHUxRlNtYWFyWUh0RHhQWDcr?=
 =?utf-8?B?ZmNFWVcwVmJYNEtZMVpJMTcydDJ5ZTRaNXdLeTJTNDdVait1c1A5WGxIbFcr?=
 =?utf-8?B?TklYbjlFTUZMaExpZmI0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5mUmtyQ0hSRWQ2MU9SZ1RZVXZtb3MyMFd1dUdSeUsrdmltQ0FoVXZTRWV0?=
 =?utf-8?B?SmdXMnRzR1Q0em9lK3E5VE1EaHozeXIrRVlhaE4wMytiUnF2aEZSK3lISWRX?=
 =?utf-8?B?a3pGaDZiMXh3OUpidnhmNC9MN3BrdG5ZTithcnMrVTJmc3JiVG5rdTRjQkJp?=
 =?utf-8?B?MGkrS1pHVkp1UXNpVCtDU09zSktkT3hvYVdia3lzUXgvRkVLeXkvMGV6SjZF?=
 =?utf-8?B?UHMzL3RkNy9FdWJrZllOckhCUVJJYWdCeTlMRjladkx5STF5aDlEY0Y5MU1y?=
 =?utf-8?B?am1zd2pNZFFRVWFwNDFPOENPUzlWZ2YwTlVwTTJwV3ZHc1pPZ29SazJ3bS9R?=
 =?utf-8?B?YmF5YjRmL2llYURuZHFRdTJtYzlSODAvS2ZvS3B0WlBFM1hiMGJHUHJTL2dV?=
 =?utf-8?B?RlVyaWJZVWR4OER2d1dpRE05NUFRckZDMDlERjMxK2ZuVGdHUnBodWtYNkZz?=
 =?utf-8?B?UVRiL1ZmZEpCckZ4Y25kZHhRODM0VUxsQzhpcTU3UlJZaSt6aktvQVpFa21X?=
 =?utf-8?B?Tk5IUlFwaXg0dnlHSFBBQ2VRb2lpN3djNVBMcXNrVnZkTXNoTDloTGlyUEFh?=
 =?utf-8?B?MzNnL2Ezdmx2K3p6Rm9oZFZXcE1RNXR4OW1SbXY2QzJuUnZqMDBzVE0wZWVQ?=
 =?utf-8?B?UU1lTHpnWHNyM1Znc0liV2ZKYXcwRG5wUVBsNlUyZm9wMlFtaG10dVpac05F?=
 =?utf-8?B?K1NuNDRxQllNenU0aS9OM2NXcnZCSEF3M1Q3RFJaN1lOa0hPakNTRVcyZXhk?=
 =?utf-8?B?S0tOUFdwWTB5SE5uTGVQdkZBUEhrRXRKNVZpcXI3Mys0VGU4aUJqQVQwVGZ2?=
 =?utf-8?B?RDdyTkNCclQ5bzZ3NUQ5NXQ5cGNaNm9jZEx1T3ZEOTdSRU1XdWdHc08vV3lS?=
 =?utf-8?B?YlBTb0crNEMwTGFMZ1JIOGQ5NVNZaTBmUWJVSUdINDZlWnhTWmdaSlBBK3Fk?=
 =?utf-8?B?REpqa3Ezd3dXRmlWeG5lYTRuKzk4Z0orcFZiRmJuZ0RmVWZmUmxBN0hEY2Vt?=
 =?utf-8?B?VTIxR3lsaFVsZ3R3eEpGU2poTWNDNENPS0w2RHdwNkdFcDdSQkVsR0ZTVFB6?=
 =?utf-8?B?MFQwbmZZK0lNMUcxOC9oQlFjcTU5ajQ2YmNQSWdOaFU0d1Bsa0ZveFhoUWYr?=
 =?utf-8?B?eUV3OHZpcnVpbGdYTXpDV085cnB4Z0kvbDU1anpKRFpySWJhK1pORlMxYURt?=
 =?utf-8?B?VFdBVndiZDZ0elZmUml6OVd1dEZuUW1qdk9abG9Qa1BOeFZZbUU4K2hjSDhQ?=
 =?utf-8?B?TCs5N2VSYmx6TDRQb0RDV214TTFNV0JGQlJrU1lzQW14aUp1NGp2ZUVMZ0RE?=
 =?utf-8?B?eUtqNFRmeEUrQTFwZDQxNTR5M0s5Lzh1QnVqVGRsT0JmQ01QZUVYdUlLMVBs?=
 =?utf-8?B?VFRwdFlxYTFyM0hoTzdTSjhtU0RESUQxUmdPeitmd1dGZXRrYTlTZC8yZWho?=
 =?utf-8?B?Q21BNEVXR3NPcmNZcUxJQjhnOGkvWHV3bkR3cGk1cmVVY3kvcndjZi9SbExx?=
 =?utf-8?B?SkRraFRwNXd5a1NidURrMzh5Z2F4TjJmT2F2TUw0ZTRBcFdJSFRlREdvMi9D?=
 =?utf-8?B?WVB3WmJUakFieWhwVTlOb2t1bXBLUnVxSFQzNEh3QnBhNXNyY3M1Q2tLU0pp?=
 =?utf-8?B?ZTFtUjR4WHU5NmZDNHFnYVRtdkhHbWN5YkVnRTJhV3hMR0doeDlhRUlnNUlv?=
 =?utf-8?B?WHkzeWxXbS9nTHp0MDlhaytQUENXVTUrZ2pIMVcrclRFQmNtc3BTcU9JK1Uv?=
 =?utf-8?B?SnhmaHJ5cTNqVW9WUm5jb2N3RzU1UitsNVB2bGkyS3Rlenh6WlpORm5oUlZI?=
 =?utf-8?B?VHNFOW9tQWpyUVc4NzdHYllPMVJ3K3djWk5TMzJ0Y0Z6UHJMMFJSdVJETjN5?=
 =?utf-8?B?cUZBM0tsZmthUHg1M2ExSUJyc3htQ3MrU01HMzkxVkl3TTc4cFFPaGVOa1FE?=
 =?utf-8?B?TlV2L3hGSEZodzNEWnI1ZVhoSG9hcnhuaHFzdGVzSUEzbW1TM2FBcTludWdY?=
 =?utf-8?B?ekxYZzlqWGZNb3k4RlFSOTRhK3JQTXpncnRxcW1NcHBBR2Y3Y1RDbnZuT1Qy?=
 =?utf-8?B?QVhTVUE5VTZRMExKQU53bDBmTnA5b2JDZkJLWUJKMFJnQ2tUQ2E3Z05ZZkNN?=
 =?utf-8?Q?dX5ib7RALt5lv9rA4EJlNBOOz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7325a4-b618-45e6-4e5b-08dd145249a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 10:56:21.4253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ys79XEtnvUTqiWf4Ac5llIVAQQep+ENT2nhPqn4EA9jK1p/7yp+LxdnR7byXGdu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350
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

Am 04.12.24 um 10:56 schrieb Thomas Hellström:
> On Wed, 2024-12-04 at 10:16 +0100, Christian König wrote:
>> Am 03.12.24 um 18:44 schrieb Thomas Hellström:
>>> On Tue, 2024-12-03 at 17:46 +0100, Christian König wrote:
>>>> Am 03.12.24 um 17:43 schrieb Thomas Hellström:
>>>>> On Tue, 2024-12-03 at 17:39 +0100, Christian König wrote:
>>>>>> Am 03.12.24 um 17:31 schrieb Thomas Hellström:
>>>>>>> On Tue, 2024-12-03 at 17:20 +0100, Christian König wrote:
>>>>>>>> [SNIP]
>>>>>>>>>>>>> @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct
>>>>>>>>>>>>> ttm_pool
>>>>>>>>>>>>> *pool,
>>>>>>>>>>>>> struct ttm_tt *tt,
>>>>>>>>>>>>>         	else
>>>>>>>>>>>>>         		gfp_flags |= GFP_HIGHUSER;
>>>>>>>>>>>>>         
>>>>>>>>>>>>> -	for (order = min_t(unsigned int,
>>>>>>>>>>>>> MAX_PAGE_ORDER,
>>>>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>>>> -	     num_pages;
>>>>>>>>>>>>> -	     order = min_t(unsigned int,
>>>>>>>>>>>>> order,
>>>>>>>>>>>>> __fls(num_pages)))
>>>>>>>>>>>>> {
>>>>>>>>>>>>> +	order = min_t(unsigned int,
>>>>>>>>>>>>> MAX_PAGE_ORDER,
>>>>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +	if (tt->page_flags &
>>>>>>>>>>>>> TTM_TT_FLAG_PRIV_BACKED_UP) {
>>>>>>>>>>>>> +		if (!tt->restore) {
>>>>>>>>>>>>> +			gfp_t gfp = GFP_KERNEL
>>>>>>>>>>>>> |
>>>>>>>>>>>>> __GFP_NOWARN;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +			if (ctx-
>>>>>>>>>>>>>> gfp_retry_mayfail)
>>>>>>>>>>>>> +				gfp |=
>>>>>>>>>>>>> __GFP_RETRY_MAYFAIL;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +			tt->restore =
>>>>>>>>>>>>> +				kvzalloc(struc
>>>>>>>>>>>>> t_si
>>>>>>>>>>>>> ze(t
>>>>>>>>>>>>> t-
>>>>>>>>>>>>>> restore,
>>>>>>>>>>>>> old_pages,
>>>>>>>>>>>>> +					
>>>>>>>>>>>>> 	
>>>>>>>>>>>>> (size_t)1
>>>>>>>>>>>>> <<
>>>>>>>>>>>>> order), gfp);
>>>>>>>>>>>>> +			if (!tt->restore)
>>>>>>>>>>>>> +				return -
>>>>>>>>>>>>> ENOMEM;
>>>>>>>>>>>>> +		} else if
>>>>>>>>>>>>> (ttm_pool_restore_valid(tt-
>>>>>>>>>>>>>> restore)) {
>>>>>>>>>>>>> +			struct
>>>>>>>>>>>>> ttm_pool_tt_restore
>>>>>>>>>>>>> *restore =
>>>>>>>>>>>>> tt-
>>>>>>>>>>>>>> restore;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +			num_pages -= restore-
>>>>>>>>>>>>>> alloced_pages;
>>>>>>>>>>>>> +			order = min_t(unsigned
>>>>>>>>>>>>> int,
>>>>>>>>>>>>> order,
>>>>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>>>> +			pages += restore-
>>>>>>>>>>>>>> alloced_pages;
>>>>>>>>>>>>> +			r =
>>>>>>>>>>>>> ttm_pool_restore_tt(restore,
>>>>>>>>>>>>> tt-
>>>>>>>>>>>>>> backup, ctx);
>>>>>>>>>>>>> +			if (r)
>>>>>>>>>>>>> +				return r;
>>>>>>>>>>>>> +			caching = restore-
>>>>>>>>>>>>>> caching_divide;
>>>>>>>>>>>>> +		}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +		tt->restore->pool = pool;
>>>>>>>>>>>>> +	}
>>>>>>>>>>>> Hui? Why is that part of the allocation function
>>>>>>>>>>>> now?
>>>>>>>>>>>>
>>>>>>>>>>>> At bare minimum I would expect that this is a new
>>>>>>>>>>>> function.
>>>>>>>>>>> It's because we now have partially backed up tts,
>>>>>>>>>>> so
>>>>>>>>>>> the
>>>>>>>>>>> restore is
>>>>>>>>>>> interleaved on a per-page basis, replacing the
>>>>>>>>>>> backup
>>>>>>>>>>> handles
>>>>>>>>>>> with
>>>>>>>>>>> page-pointers. I'll see if I can separate out at
>>>>>>>>>>> least
>>>>>>>>>>> the
>>>>>>>>>>> initialization here.
>>>>>>>>>> Yeah, that kind of makes sense.
>>>>>>>>>>
>>>>>>>>>> My expectation was just that we now have explicit
>>>>>>>>>> ttm_pool_swapout()
>>>>>>>>>> and
>>>>>>>>>> ttm_pool_swapin() functions.
>>>>>>>>> I fully understand, although in the allocation step,
>>>>>>>>> that
>>>>>>>>> would
>>>>>>>>> also
>>>>>>>>> increase the memory pressure since we might momentarily
>>>>>>>>> have
>>>>>>>>> twice
>>>>>>>>> the
>>>>>>>>> bo-size allocated, if the shmem object was never
>>>>>>>>> swapped
>>>>>>>>> out,
>>>>>>>>> and
>>>>>>>>> we
>>>>>>>>> don't want to unnecessarily risc OOM at recover time,
>>>>>>>>> although
>>>>>>>>> that
>>>>>>>>> should be a recoverable situation now. If the OOM
>>>>>>>>> receiver
>>>>>>>>> can
>>>>>>>>> free
>>>>>>>>> up
>>>>>>>>> system memory resources they can could potentially
>>>>>>>>> restart
>>>>>>>>> the
>>>>>>>>> recover.
>>>>>>>> What I meant was more that we have ttm_pool_swapout()
>>>>>>>> which
>>>>>>>> does
>>>>>>>> a
>>>>>>>> mix
>>>>>>>> of moving each page to a swap backend and freeing one by
>>>>>>>> one.
>>>>>>>>
>>>>>>>> And ttm_pool_swapin() which allocates a bit of memory
>>>>>>>> (usually
>>>>>>>> one
>>>>>>>> huge
>>>>>>>> page) and then copies the content back in from the swap
>>>>>>>> backend.
>>>>>>>>
>>>>>>>> Alternatively we could rename ttm_pool_alloc() into
>>>>>>>> something
>>>>>>>> like
>>>>>>>> ttm_pool_populate() and ttm_pool_free() into
>>>>>>>> ttm_pool_unpopulate(),
>>>>>>>> but
>>>>>>>> those names are not very descriptive either.
>>>>>>>>
>>>>>>>> It's just that we now do a bit more than just alloc and
>>>>>>>> free
>>>>>>>> in
>>>>>>>> those
>>>>>>>> functions, so the naming doesn't really match that well
>>>>>>>> any
>>>>>>>> more.
>>>>>>> So what about ttm_pool_alloc() and
>>>>>>> ttm_pool_recover/swapin(),
>>>>>>> both
>>>>>>> pointing to the same code, but _alloc() asserts that the tt
>>>>>>> isn't
>>>>>>> backed up?
>>>>>>>
>>>>>>> That would give a clean interface at least.
>>>>>> More or less ok. I would just put figuring out the gfp flags
>>>>>> and
>>>>>> the
>>>>>> stuff inside the for (order... loop into separate functions.
>>>>>> And
>>>>>> then
>>>>>> remove the if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
>>>>>> from
>>>>>> the
>>>>>> pool.
>>>>>>
>>>>>> In other words you trigger the back restore by calling a
>>>>>> different
>>>>>> function than the allocation one.
>>>>> I'll take a look at this as well.
>>>> Ah, and BTW: It's perfectly possible that ttm_tt_free() is called
>>>> because a halve swapped TT is about to be destroyed!
>>>>
>>>> If I'm not completely mistaken that is not handled gracefully
>>>> when we
>>>> try to always backup from in the ttm_tt_free() function.
>>>>
>>>> So we clearly need the separation of move this TT to a backup
>>>> (and
>>>> eventually only partially) and freeing it.
>>> Hm. I'm not sure I follow completely.
>>>
>>> The ttm_pool interface is currently:
>>>
>>> ttm_pool_alloc() -> allocs and may recover from backup. May leave
>>> partially backed up. Called from ttm_tt_populate() or its driver
>>> callbacks.
>> Yeah that this is done by a single function looks really strange to
>> me.
>>
>>> ttm_pool_backup_tt() -> Attempts to back up (the not already backed
>>> up
>>> part of a tt. Called from ttm_tt_backup(), which is just a tt layer
>>> wrapper. If called with purge==true, then frees memory bypassing
>>> the
>>> pool to return it to the system directly.
>>>
>>> ttm_pool_free() -> Frees a (potentially backed up or partially
>>> backed
>>> up) tt. Called from ttm_tt_unpopulate() or its driver callbacks.
>> Ah! I missed that you have separated that functionality from the free
>> path.
>>
>> I've only saw the allocation path and though I need to clear that up
>> first.
>>
>>> So the backup functionality is implemented with a minimal change to
>>> upper layers, and I don't think there is a correctness problem on
>>> free().
>>>
>>> So could you clarify a bit if it is this interface you think needs
>>> changing or that the implementation is better at separating out the
>>> backup functionality from the pool functionality?
>> I think we should just make the ttm pool object take charge of
>> allocation, backup, restore and free operation on the TT objects.
>>
>> And all of those are separate operations, they just internally share
>> steps to archive what they should do.
> So are we looking at an interface change like:
>
> ttm_pool_alloc() // no recover. Errors if backed-up-data present.
> ttm_pool_alloc_and_recover() // because you can't alloc first and then
> recover in a memory-efficient manner, since you need to interleave.
> ttm_pool_backup() // as currently
> ttm_pool_drop_backed_up() //drops the backed-up data if any.
> ttm_pool_free() // frees all data. errors if backed-up-data present.
>
> Is this what you mean?

Yes, exactly that.

>
>> BTW I really dislike that tt->restore is allocated dynamically. That
>> is
>> just another allocation which can cause problems.
>> We should probably have all the state necessary for the operation in
>> the
>> TT object.
> Initially it was done this way. But that meant a pre-allocated struct
> page-pointer array the of 1 << MAX_PAGE_ORDER size (2MiB) for each
> ttm_tt. That lead to a patch to reduce the MAX_PAGE_ORDER to PMD size
> order, but  as you might remember, that needed to be ripped out because
> the PMD size macros aren't constant across all architectures. IIRC it
> was ARM causing compilation failures, and Linus wasn't happy.

Yeah, I do remember that. But I don't fully get why you need this 
page-pointer array in the first place?

>
> So, enter the dynamic allocation which is temporary, and 1/512 of the
> size of the memory we need to allocate for the buffer object. IIRC that
> was discussed with Matt when he reiewed and we concluded that it should
> be ok. I think this approach leads to less memory pressure than if we'd
> keep that array around all the time for *all* the allocated bos, and
> the allocation is never during reclaim.

Hui? How do you avoid having to allocate that during reclaim?

I absolutely don't see that on the code currently.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>>
>>>
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>>> For a renaming change that touch all TTM drivers, I'd
>>>>>>> rather
>>>>>>> put
>>>>>>> that
>>>>>>> as a last patch since getting acks for that from all TTM
>>>>>>> driver
>>>>>>> maintainers seems like a hopeless undertaking.
>>>>>> Yeah the acks are not the problem, merging it through the xe
>>>>>> tree
>>>>>> would be.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>
>>>>>>> /Thomas
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> /Thomas

