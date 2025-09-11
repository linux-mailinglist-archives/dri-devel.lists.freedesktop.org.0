Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24AB52CA5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FB010E06B;
	Thu, 11 Sep 2025 09:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jw7Znys5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AD710E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4wBYdZ4gW+ngy+guCQEuQksVpj3ulOzl4GnbdCaD4mBg70jKQJ5dWyx8OLYtF1J6UOtrxt3J4n46HHTFRFSyd5DfVBnwiaNf14daQqEV1tFfrBn3gRurIKa/4DZ2cqBnr5cb8TVCUyk6jYZDCSKtQI99qPLhffWpRYxrLsXCgK6ts0Ny1xao7VTDKaEFpK3gMvw8ZToFcoC3RdvHhYF+JsJEKG6gRL6cTFi1igDVMVyY2vn+10+VbWYVc9vw5Z5DvT3Wm2wFg5Pt7Qn5imRaZ2e9PW7p2wHm5btgyfLk8g2tBalr0GpNsAMEU6reRGgxJXoA19jrnoXtKbkA6+J/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl8FXKJNR7EqlW9ISMCoVxxyKXTQJJTIybYvgPcFS9M=;
 b=C1fkYqn8jsAsxInEvRSlKnrEUUxQqEj4oH8k5rDmN0BXWHjhXicOydle6sgDqjbQyyxQ6vYAjkS2dA24s4uyDXxRPt7GJb8ThDz9JXL5PwF5v28e3u90DA5cgjyjTZQNcMBjaz9F2rwVZgWY0jK5sh9HIMfTF/XyUPHTu+4ZEwWYJYyO29U5WRhCzF1d0wtfsV0McbOdPNTVews3spAQ6XTKTdxM02wtt4v+mdaycI8QP2wNz1mtd/oA+TfL8Y2DoTrOilce3QfbvZAiuRGrHtSe7GjDf2C8Q32MLnEhn/ZxzF/IYg4xY1Eli7olzOK1o9V2HZvOx+WT7gANS0LIAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl8FXKJNR7EqlW9ISMCoVxxyKXTQJJTIybYvgPcFS9M=;
 b=Jw7Znys5We4ZaH9kRoNQ1tILbvW/EBTLgfeVvyMXS2kidWbMn2co7Xj1lsz/lGEtMze9tqhNGCQnl4A9O3EY7GxrI6RxjyizhLJ9Rb6AbijEo8RBY6RKit7USiwHFXX8ylt8J1kepgR2BCPBemBYQhck8AQUE19Sog4Rg44nlls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6155.namprd12.prod.outlook.com (2603:10b6:930:25::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:07:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:07:06 +0000
Message-ID: <b7c57dc3-ed0e-402f-8a3c-f832357f8763@amd.com>
Date: Thu, 11 Sep 2025 11:07:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ttm: do not direct reclaim when allocating high
 order pages
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com>
 <e79a134b-89de-4da1-b64b-b890227fce8a@amd.com>
 <aMF0fe7CIVD-8zVo@quatroqueijos.cascardo.eti.br>
 <262a176a-4c80-40de-96e0-c97f50c20fe6@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <262a176a-4c80-40de-96e0-c97f50c20fe6@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aab0bc4-bbe2-4108-f71f-08ddf11294eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHhCeVRLOFNoSlZjUkk3alJwKzUxYi91WUM3bjBJdmMwZ0Z3NnAyMzVNSUNQ?=
 =?utf-8?B?MmVNbGJCK2VTTHc0bUxtVml0VGhuS0czbG8rSmYxWXZ5a3o3UXlkVkxSTkFV?=
 =?utf-8?B?Z01pNGU2Z0VCaW05S3FhSmJvRWRrVENJRGtvSTZZWnBJdGVHSWRWdExsdFNu?=
 =?utf-8?B?RVVsb3JGNG1LM1JWQkVxS2lSbTJVSWt1eFVRN3FWK2dnMHBmcUhBc1MzaFBr?=
 =?utf-8?B?S29QQmZnbDRDTDdISlZDVGVpeEdac2hCV0lHc1ZKRE9QNm5zWjNTVGMydmxG?=
 =?utf-8?B?RWFiSzlsMGJmVkp3WC9IK2hEMU16aUFKNEpLdDJWWnZNMXBsYVk1VUdEZEVy?=
 =?utf-8?B?MWxPRHBUaTg2TWFsbFpFTlJOdWc5cnhTWjFlNTNGM1FueVlXTW5Ed3c5YVQz?=
 =?utf-8?B?c3dTeS9USm5sdkRzUkFjWU0yOWVvNXRBeGgxRE5RNmJlcGd3TUtKM1JHbURN?=
 =?utf-8?B?U0xvUTJnclo2QXZWSXl5UkJPNlIvUE1Cc2RLVm5uZThvalppdjRPS2ptWVVt?=
 =?utf-8?B?ZzRxaW5TU3lGRTZ4Q1VoNkhEQ0tMZGZ4MGFWblpWN3V6cWlZZFVtZFV3SVBo?=
 =?utf-8?B?dnVuR1Y4dkdxdDlVd2VMS0Y1OUhEc0s1eVZ2SElqWFd0MW11TEVGOHMySTJY?=
 =?utf-8?B?a0RybW1wdGlkZitvbnpnQlN5ZTZCTVBxUE9NSlR4ajZGZFRFQ0FqWUhleG9h?=
 =?utf-8?B?eDVaYkw4OGRCRU9VUFZIYzhjYmhEcHBFcThxVGVpQmMwSklxdzZ6aGc4alg4?=
 =?utf-8?B?MzJ4cG93ak5BOXJDMG1FbSsvMDlXbXNxRVYxV1FQZStzdHEwUjRXNXlyTSti?=
 =?utf-8?B?bWF4WHJybVRhTXNLSFpxVGxUUW13anJ6RDhHYldnQlNTdnB3eFBqbkhSTzBW?=
 =?utf-8?B?YVpvV2tjVjFIVkxLbmMzMTJaZE8wWFVHQU5lN1NHY3c3QnhJbWMrV0tnanEr?=
 =?utf-8?B?MXZRdzlNZk5BMjVNYzlOMzNoN2p3a0NYZkxrUlU1V1pKN2h0bm5OL2gvRmg1?=
 =?utf-8?B?VEVsdTB6bDBwazd0LzgwNENKK2lJVWRmQjJvZ2MwNG40UXhEQmZJUlBhNHhQ?=
 =?utf-8?B?V0xId2VPNWxZN0dtUzR3L3RPUll4REh3ajFQWHRES2pKQzcycTFmZGJVakxK?=
 =?utf-8?B?THpxVUQrMVFmWDNFRmtTUTFiTkpscmRUK2V0bFR6aTFzYk5EQXdqQjFjS0ds?=
 =?utf-8?B?NG5mQThwZSsvNVNhZW9ETjFmbm92enpERm9YMTZrdXpYYzVqMW1oL2VsUlhl?=
 =?utf-8?B?bk5OcmNGNjBHSlg0TytKRnFJbnVHUDNKbk5QRmdOZzI3djJhT3kyN3NDUXhI?=
 =?utf-8?B?ZGlwR091dGdGOEUzU1NKUkZrWk1Qem9lM1Rkem9Vb0JDSHFERG5RUFBhYzBo?=
 =?utf-8?B?TTc5aHYxQUVvVWtWQXdDZzhhNjJGTnlNdEh3ZDlWWWdEMW9BTlk4WEVHdGNY?=
 =?utf-8?B?aVZsQW1KdCtnaDhMNVZOdVNqSnpuek9lNlluQWI1Znd0NktGMkFjUzUrVVg5?=
 =?utf-8?B?RnBFb0VJNnJTTHhaUXcvSWVOaVRnOVVvWmFHTU9sRHJLNzZGcUcvV08yYndL?=
 =?utf-8?B?V0FxTTNHemg2Sy9EY21XSmJwdUZRdDRRQ1BuRDh6dVl2MDI1N3RvVkN5MVVm?=
 =?utf-8?B?enpWZXA0Mi95NHZ3SjlQdjNLWEtwYXo0ZzFNOEpsNXl1QXZtcmhEenFDUjBs?=
 =?utf-8?B?bi9iU2I4bEpXTWdzaC90QW9UdDhyaEpURWFEd1NJL2MwZXR0RTJTNWdXdkJN?=
 =?utf-8?B?a21GNmNia2lFaGVNSEtHZlI5ZXdIamZveUJDTVVJUU1oUG1OMFc4ZDFJMnVn?=
 =?utf-8?B?MEVMbzhyN1crVDl6eTlQWllvbThJNTdBRXI1Qk9CVVVKWXg0T0xDak5jZ2RF?=
 =?utf-8?B?MTdPZ0tKdXlnYzV5NTRwTUFqTVd6aG5RdVAwazZkQXNtbEFzTTh6eGR0Z1h3?=
 =?utf-8?Q?7rofW557w/8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExjRFhuMURoZzQ4MHJvTjF5MitjQi92RUFpdUl0bzZscHpaYXRkRXF5dHlX?=
 =?utf-8?B?TXBDdXh6QmcxTWZPQkhuM2oxSndZZ2VFblNGRlNMdDhPTzlOdDJNVm1NWFdw?=
 =?utf-8?B?YU9Mc3Zjc0duWUUwdVJiYXhCRnhzOTVhQU5EK2U3Z292MkhmWTNrSVdmTmRw?=
 =?utf-8?B?cnNuTHBubmxTMGFFd08rMEVQbnllZStxcEZ4SHpFenNWZi9IQXEzSTFjYjBk?=
 =?utf-8?B?Tk9SQXB4OUFKUjhXYW5TaVF4WkJLUmFNYUFUZk1CSjIwbFdzalVPTlNSc3hP?=
 =?utf-8?B?SmZpdVd1MnRjOUJuajBUNTM3TlZZYmJpZ1hxb3l1eG9uNzdsYUtwV2RuQ3VH?=
 =?utf-8?B?WHJrZUdJc0pYSWpQZFF0ZnhMSkI5d20vbG5tbnE0cm9LM3NMRWxCZlA5NHNZ?=
 =?utf-8?B?UVZxcU9MYTA1bFJXRUlDcXd2aTZkL1Jra1hWSlAzVmR5MjBjVTBIQVNlTHI4?=
 =?utf-8?B?TVpSU1RuQWFpdlc1bTBGNzJIMEZVKzZkODhZbzAzSmhhejZMNlBXY3hwVkFX?=
 =?utf-8?B?WUpHUVBpR01uR1VHTW5vZy9nYXBsbmcwS3JOZ1B0OW1jbEVJbTBhKzJOTnRY?=
 =?utf-8?B?dkM3UzZiUDNmS0M4dmRsbXJrOTI3dFUvNjBsWFUzeWwwMnNBK3ZTS0FrVnF5?=
 =?utf-8?B?dXhaUHJyZmhlSmRrWTBWejh2dm5hcFZCTUs0WGxzSnV5ZmM1elIwU2FGZXRW?=
 =?utf-8?B?bXhJbUFaYjlQb3REL0g2bjNDN1NXTUppeHF3UmxaZ3czMEZyQVRITDNDR1h0?=
 =?utf-8?B?c0FLbEJUSVFnY2dsMzVtRG54LzZlQmZNZFUrdmM3ZDJrQ0V3enZ5QmxZbmJl?=
 =?utf-8?B?cEF2WmplbWlDcVRSU3lZWDNFWnNvREZmMm9PdGN2SUswK3VNV0owa2xyTmp3?=
 =?utf-8?B?aTY5TU9ON3l2SGNGeGdndWk0MjU1dTBKbUxyM1FvYUtPVWxQM1lEVTkrcGFU?=
 =?utf-8?B?M1ozcExYeHZ3TUtjVzlKUWtSVHhhcjN5eWhSekk2QlZyQ0I4dmIvaXlZUVJs?=
 =?utf-8?B?NGFldmFrU0d3dW5xNnhWcFVNQmV1RGUyaDlEbmlKTlREL3o1bDJIN21pTGFT?=
 =?utf-8?B?MStOZWliSDVaVUptc2NCYm1zTWRrTHZzMG9pc1JHcFpoV3NPdW5wVjFvRXZO?=
 =?utf-8?B?aWRhL2NxRzV4ZURWMGI1MnRhc0N4L2YvQno2cXJhNTc0dnZib0VtV0lUdHZH?=
 =?utf-8?B?YiswazNOd1VLaFczYlFXeVVIU3VPcWQ4Tjk0cWJodzNicFpOcjM5TS9teWwy?=
 =?utf-8?B?SHUzOG1RdXZKT0l4WG96TytreXpoWDBtb3E1VkNoVzZjaHpmNmlQQXJyVlZx?=
 =?utf-8?B?ejhqQ0ZPRlllUkZSb1drSjlITkRGZTlJakpFcVI1S1RjcUN6SGI3eWZzMkNi?=
 =?utf-8?B?RG9xSWJrM1dreEowK3ZHQU90MXA3SW9qRlowVkNEODdnM1Y3NGozWm96VW50?=
 =?utf-8?B?SHBBbEFVME9VYy9CeE9NMkxtVlRKTStTbDMwRGh5aEJsR2lMTUhzallCeGhT?=
 =?utf-8?B?MGVrVng1YktBWXAydUU2NW8vTGNwZEdMZVlDY3VIVU0xMzJLN2pvNlh3S1BU?=
 =?utf-8?B?NGg4My9WOXF3N1BkV09yRkRMRXI3TVkxbExVOVFBeXFPSGJyeGphOEtCUGc4?=
 =?utf-8?B?M0xuVE5yaTNiZDVFZ0xKMWNhc1BEV3J3NTUvYWEzZFZFZW5IQXlIc0VteXk0?=
 =?utf-8?B?dHEzM1BFS0RBME5xNXU3akQ1cVlURGFjTFUxTjQrSDVOMjhXSk5FN3lLa3JC?=
 =?utf-8?B?SjhrbWtzbEd1LzlTLzVqZTJvY3cwSXZOczNQaHpSN0F6bmdSQVIybnAybW1W?=
 =?utf-8?B?ZzRjRXBQa0hNNFUrMmcreC9BdzRYSThaeUtNZ2lkczVvaHZNYm1hNlhhNWxk?=
 =?utf-8?B?NEVYOC9aWDVGU3VjUnVUSG1FcHpFTElTT1ZHOWhpcUlWR1VXNTRKZEJZMVdY?=
 =?utf-8?B?bkppRVlERWNnU1JubjhSdVZ0VXZ0bmVBNFNDTitzclo4R1NYVU03NG1qYk5D?=
 =?utf-8?B?S1Q3V0pLQUsvem9mK0F2VGovdzhCeWtpZ3oxT0lvREIvN0k5cVZLblhGaGk3?=
 =?utf-8?B?Wk1tYy84UXlyenpJcGpZQWloRXpRM0txR3l3enI4dEVLR2kxQkYxOFRSQXBL?=
 =?utf-8?Q?VVcWhxXES6jAxJxxvC8ZKDL7T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aab0bc4-bbe2-4108-f71f-08ddf11294eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 09:07:06.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcPFKeLY43A+yGG0sJxy06SKpM6ZuIdrh7gZpA67Vuw3EeJ/NY7tXpG4vvU9BpTF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6155
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

On 11.09.25 10:26, Michel Dänzer wrote:
> On 10.09.25 14:52, Thadeu Lima de Souza Cascardo wrote:
>> On Wed, Sep 10, 2025 at 02:11:58PM +0200, Christian König wrote:
>>> On 10.09.25 13:59, Thadeu Lima de Souza Cascardo wrote:
>>>> When the TTM pool tries to allocate new pages, it stats with max order. If
>>>> there are no pages ready in the system, the page allocator will start
>>>> reclaim. If direct reclaim fails, the allocator will reduce the order until
>>>> it gets all the pages it wants with whatever order the allocator succeeds
>>>> to reclaim.
>>>>
>>>> However, while the allocator is reclaiming, lower order pages might be
>>>> available, which would work just fine for the pool allocator. Doing direct
>>>> reclaim just introduces latency in allocating memory.
>>>>
>>>> The system should still start reclaiming in the background with kswapd, but
>>>> the pool allocator should try to allocate a lower order page instead of
>>>> directly reclaiming.
>>>>
>>>> If not even a order-1 page is available, the TTM pool allocator will
>>>> eventually get to start allocating order-0 pages, at which point it should
>>>> and will directly reclaim.
>>>
>>> Yeah that was discussed before quite a bit but at least for AMD GPUs that is absolutely not something we should do.
>>>
>>> The performance difference between using high and low order pages can be up to 30%. So the added extra latency is just vital for good performance.
>>>
>>> We could of course make that depend on the HW you use if it isn't necessary for some other GPU, but at least both NVidia and Intel seem to have pretty much the same HW restrictions.
>>>
>>> NVidia has been working on extending this to even use 1GiB pages to reduce the TLB overhead even further.
>>
>> But if the system cannot reclaim or is working hard on reclaiming, it will
>> not allocate that page and the pool allocator will resort to lower order
>> pages anyway.
>>
>> In case the system has pages available, it will use them. I think there is
>> a balance here and I find this one is reasonable. If the system is not
>> under pressure, it will allocate those higher order pages, as expected.
>>
>> I can look into the behavior when the system might be fragmented, but I
>> still believe that the pool is offering such a protection by keeping those
>> higher order pages around. It is when the system is under memory presure
>> that we need to resort to lower order pages.
>>
>> What we are seeing here is on a low memory (4GiB) single node system with
>> an APU, that it will have lots of latencies trying to allocate memory by
>> doing direct reclaim trying to allocate order-10 pages, which will fail and
>> down it goes until it gets to order-4 or order-3. With this change, we
>> don't see those latencies anymore and memory pressure goes down as well.
> That reminds me of the scenario I described in the 00862edba135 ("drm/ttm: Use GFP_TRANSHUGE_LIGHT for allocating huge pages") commit log, where taking a filesystem backup could cause Firefox to freeze for on the order of a minute.
> 
> Something like that can't just be ignored as "not a problem" for a potential 30% performance gain.

Well using 2MiB is actually a must have for certain HW features and we have quite a lot of people pushing to always using them.

So that TTM still falls back to lower order allocations is just a compromise to not trigger the OOM killer.

What we could do is to remove the fallback, but then Cascardos use case wouldn't be working any more at all.

Regards,
Christian.
