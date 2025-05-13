Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E378AB55D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A60B10E59A;
	Tue, 13 May 2025 13:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SzFvDVRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7659310E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml6+QTm8JMgFPk+9X4UiQXUr5yJgmaWz2770xpuNgUT0L6UbeuDn82GBZuf+gJbMvJWVOjnhwj43d219TAB8t+OBAmagCacpHik6K3Yr1vaRVpVfsC9lhDx+EDJLhsk2VF6UwzkuCr3Er0duCAO+tTaEU3QhHtM6iB62zo1945J/iIT9KppTwzgyBl9nWWrz+f5eIBob6fhnnbmMgQoydIesfHsz4BqmJU5pjjS24Wu01kZrY+dQUVPDliORtg5tBcE4W8dlQ8bVqkRYwCV5hBHuXNELTCuOSqJBCejruJ6qi6xGstHPaBAf6qnfHV1Lw7v2bzN8JjIegow3fCfkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0XYqoDLKn1X8U042JbzEqsU7/9qTxfLm7/S6JhoPo4=;
 b=QTFILjsad6dETWKvH7ec30gFubO4sOiWYmgTAbc7WCFdAV5c27tq55MrELDVm/fsp3quBzO8YFxZFnCIlwGSiaqu1uPGmnGqM+IBb66e6vG1Wv9TWb03fuv1nl/61PanliiBpdztQQgwy9nmCHy0+cincimNKwFozV/FqvPvN4QlEmWVud5h5fJl2jMRjEiPihKSo100QUpndKlPwxaOsM5IbS3wczbztI2Y+ZQwZDxKoSguzeLuytY5wKFyrsQR/a5Eg+aV7yuH4xi8Sqfoksb2xcpcNMnDHGmauRd8DwVRi/PcptFhHmPc26AK0cYdBMN0uoX619oYouavCRSQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0XYqoDLKn1X8U042JbzEqsU7/9qTxfLm7/S6JhoPo4=;
 b=SzFvDVRkHHelc+9fd8VlJ5Bgybnw9pi70J9T/4N5RdI4mzMvXW+9d/6i6qASXLwdSiKT5yxCYL6FZi+yQXiMx74ggr5D7nm0yy1SUv1jZ4SZOUddMRPAPz4m+FEifrB/yI61LjGLwQYI83j+cbVJ3G49Yoz+C9BigQfBvEUw7W4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 13 May
 2025 13:18:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:18:06 +0000
Message-ID: <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
Date: Tue, 13 May 2025 15:17:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:208:530::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 811ec9b9-bd77-4831-1e4a-08dd92209922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkN0NkhDbWNKam9RWU9UVHRFSTlxOWg4SkdBUDk4cWVtM3RxcG1vanppN0R1?=
 =?utf-8?B?K2hxREFUcGwxWGNDYSszSUhtclVUbnU2L2xqRnVFaGZnb0ljMGs0enRIWE0r?=
 =?utf-8?B?Zk5Cb1hPR1hZL05LYThBUmxXQmYzL0g4OVJTZ0wvU2pIMHd6bXFpYUViM3RL?=
 =?utf-8?B?aTUxNFhCWVNDVXFVeEY2TjJtRVk5VldNREFadDNkbUNRTlpHSHNTdWR0aURM?=
 =?utf-8?B?djVXMVd1YVJiTE1ZZFlPaEpVMzdlaHhJY29BclBqajYzV1ZKYWhoR0tPaFcz?=
 =?utf-8?B?TEVVSFBCeXYwenVLd1NyaTR2YU45blBRSUIvZ3FWSXBnb0dvb0piQ0RSTkdJ?=
 =?utf-8?B?b2Q0dGRhaG9tekYxVDNTNWV6N2hRbXFIbzRYRjA4OWhqN1kzRTBnRG4wWklw?=
 =?utf-8?B?NFVVd3h0NCtRVG9xalMrZXlmb01LU0pHL1hDZlpDUnpxcFNyMnFiTGxOZVpF?=
 =?utf-8?B?dEErK1QvNHFFd2Vod3ozUERjZ2ptQit6N3BNbjZhRUprcE05bUF0WlJtblI2?=
 =?utf-8?B?UFlRVEVmVFU2Si9JcWVCMnU0Qy91QXByNlB1ZDI2eWdTQlEya1k4NTQ3RW43?=
 =?utf-8?B?SkExL1JaVlRSaVdkdWg5WmlHKzdYbEcxWXo2Umh6aThCY2RuQXEvYU1MUkQz?=
 =?utf-8?B?eWpLVnZGNFluNXo0enFGUzJta3dwY2lzSE9kTmtJWXd5V0Zob2dzc0M1em9W?=
 =?utf-8?B?RXVyMXc3M2F0bGN0eTQwUHRqaEJLWW1ySllGbGl0UzlsdDljMFJrb3FEWHBn?=
 =?utf-8?B?WWh5KzFINnZMZGVMdnl6aENtVk84RVNpZGp5d09rZDJNQS9wcC9IYjRKazkz?=
 =?utf-8?B?NEkxRXA4VDc3cmFuYW5tRXhSc2VjeUxMdG1CSU55YWNldUpBZEI3L3llUmRB?=
 =?utf-8?B?VWk0TStGRDdDamp2Ry9mM1JWZjBKY2dxUm9HMTBrRnZ5WXA2VDF0RTYzWFZj?=
 =?utf-8?B?ektSc1J6TzR4dXdyc3dMcXZsVFdaV00zaHJnd2loc1hjbkpNd0JVTVQxekht?=
 =?utf-8?B?eUZjcVNhRnhnTGZNWk8rcFR2SlZoLzFRdFMva2phSXpTSzZpMEQySHJlMjBl?=
 =?utf-8?B?bk83aVQ4cUNpWFRROW1meEtxeVM5ajJZL3lmaUhhTldQR25STjBJK2cyV0xS?=
 =?utf-8?B?d0dPZ1l6aUd4R0dNVTFVNkxvUUZoTDM3Sk5iQ1ExNVRxL1p6SHEzdTVGeTU0?=
 =?utf-8?B?OFA1YkJXK3IzQ1MzYXY0cGlCUis3d2MxM0k2bzNNOUVyMXNISG9UUVMwK3Fq?=
 =?utf-8?B?VXR6V3JEenJPdTh2Ny9VRHdTZUIyZ3ZXMlFwUW1ITE1iTFV1S3FpbjBXVDdO?=
 =?utf-8?B?RVV2aEJpR0VQQ0tNSWZPRi9UNm92OTlvMEcrSWpjLy9MSVY2SUU2eVZrczBj?=
 =?utf-8?B?RndlOVd2ZFI5dGNVV3AwY3REL2M5T3BXMzRMY2pMYmhWekJZei9yK3dSeGZJ?=
 =?utf-8?B?RlhrMmNCWFRvQ2xFaHRGb3BwOCtJM1V6VEhvTTR0M2drNG9kL3dhZWZrdE5o?=
 =?utf-8?B?N3MrZUc2MHlyWHg0djNtNzdQb2hIU2pPMlZmVmliOVdvRGRwUUhFRGx5bGY5?=
 =?utf-8?B?Z0R1Y3hiTWh2Tm1jbHFxZG5aeFVmSUl5U01JZGViQkJKL2F1MGxlbVFYa3Bh?=
 =?utf-8?B?YjJxYVdIZW8yaCtqLzV4WnRLckwxR2pUMFJTZVVQQ1FabXdaMUNRUWhuMHVK?=
 =?utf-8?B?ajUvTDY4aytsbVdqYlMwL3A0Smt6ZVNLMW1iOFJuWm1rZHYrVlN2V1lxbEJC?=
 =?utf-8?B?MXRLcFRUZHF6bDNZZ0JLWVoxQSsxMk5SWFZvWURaR0FXd3BGNGVFekIxSFVW?=
 =?utf-8?B?UWJRSlRMZWZsWHVGWmZKeDFSa0FTamtWN1djV0tBclhMYWF3MHN3NVlRN0pB?=
 =?utf-8?B?dlhmWjh6YlBwSFlabmtHZUhHWmtWczNDVWFIazRLYlppNFViaUgrVjdmUHJU?=
 =?utf-8?Q?XVLKVNV+b6g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVNHaU5KbjBQSm5VQVc5RVlndW5JZE9ST3FQMjA2MHVPTmplNjhwNlNCaVcx?=
 =?utf-8?B?Mmg0R2RtdjlFYStkSlozS09ybmp6WUE1R0UvUTlyQnFnNWE4M0I2SVM3cGpk?=
 =?utf-8?B?MUE5R1lXVk9VQ3crdTNicmNaTUZpaXhmemJMVmtqdkQvaHo3dFFBM0dpQUlo?=
 =?utf-8?B?Q2NIOGlrcTB0cEFpbjFoUDhFRFZreE9valAvdHkxRjk4aWc2cHRINEY0alZj?=
 =?utf-8?B?eDIwcTlsaHZDK1VtVytOODF4dVppNFphWHVNR1VNazl3QUZaM3ZMUGxlU2dt?=
 =?utf-8?B?NzZVZlRmMkUybTQwU0lKQnA4cjk0SEk1aThiRzVmL1BCdWFKKy90blk2a0lU?=
 =?utf-8?B?SzBMZHhyYk5haG9uMEJFbnVmTkxhcmE0SmZTeVJMeERWL2dtV0grTWFDczdJ?=
 =?utf-8?B?bHU4cWVvd3Z6cGQ0QUUrV05UN1JyaGxFZ1JwMWM1bFIwdldMbjFPSWdVYWps?=
 =?utf-8?B?V0dEdXl3blM2ZHBGR29rbVdDT3ZxNUdqdmhpODRhb0N6MVJ2WGZjTW1RY2Qv?=
 =?utf-8?B?Yyt6VFNMcDczQnNFUXJldXA4SFFFU21kWFJXbmFmL3IwTi9PY3pJdFlXM1R6?=
 =?utf-8?B?TmtvNGd4NkVueWd3U3NmU2FQQmxGMW0rM2FjcHc4QXM2YURVcThFbmFlWG9L?=
 =?utf-8?B?Y2Y4eVVWclZlSlVVckgrcEFVZlFRUGxyNVVqT29NVzJiRER1eGZjcDZJMms5?=
 =?utf-8?B?LzZUd1luTE9TaVpHMHlRRW1zQ1ZVT2N6a043OWw0WUJIeWVaN1lpUndHSjd2?=
 =?utf-8?B?clNTVWo1cityMHlrelptVkFVOGVCb3JiZTNiNlRIVFNjZ1JoUDlxUldyeEFh?=
 =?utf-8?B?VERvb3I5UlYrb0xtc1pnNGRhdnVWWWdCQnUwWmJoRHZrTUhlUXhkZElRUzRj?=
 =?utf-8?B?Q3VJZGZIaHN6OVVjSFI0bzQ3QXBHMUE1Z1dPZk5jM0cydGZQcHI5YVU0WS9J?=
 =?utf-8?B?N3VpbzdBR3Vvb2ZLb0RRcDlvN3JwOGR4Ti9NdGdQOEZMV1NtNWtMdzA1cGhG?=
 =?utf-8?B?OFdRNHZsSFl6ZnhzK3AwVWpIMGdrYkhucTU2dC9OQlVDMmF3Z2UyZ3RFNGdu?=
 =?utf-8?B?YmtPM2JDb0R3aWZ1RHRTalQxeWtUakZ1dDZmSGE0MG5UMGoybm9GMStRQnZt?=
 =?utf-8?B?b0pnZjdZWThpeVl2YWJxTDNjak5GVzdMM2syQ0ZlY2FXdGMyN3Nyd0g5U2lu?=
 =?utf-8?B?SW43Sjhva2lmdERyWFJxUFZjK3JSZmdubnpTbll2Snd2Ujh6cThLYks2aTdj?=
 =?utf-8?B?Q05YR2hLZUhkYmE5ZWRlMUI1ZUgweE9reHM0Z1poQUtTa1dKSUppeHBORFRL?=
 =?utf-8?B?SFN5SmExWmhvbVV2Z3YxU2tEZW0zckVWdkpTQWpIWEdIL3NmKy9GWmR2MHdK?=
 =?utf-8?B?cnRLazhtSUpNWUZQbmdnRExpTmgwYUJmWVdiWlhzd0d6alF3ZEEyWll0cmg2?=
 =?utf-8?B?ZnhuYUt3QjgxeElLUURqakQ5dnRCdWNPZ2dDNUVrVWo4VkdxU1p0VkFsUzFn?=
 =?utf-8?B?Um5SVHF1V0tjNVd5WCtlRnAzK2pOUjJSQjNrZVlnbnduMXgyN0xrYk9nUE1s?=
 =?utf-8?B?L1BickRMRi90cERhdC9CZmtHZnptU2txN1NDSDJvblJEcDBuTWRCL1RLZmVW?=
 =?utf-8?B?WU9jMDhhMTdHakVzRTVkeW41Mk1OR3FsUUJaOHA0UjVET2lHQ252ck1mOWRi?=
 =?utf-8?B?RmNlc3dvZW5sdkl0WmdkTkViSVhxZ1kwTWIrM25RWWhabllLZnRJR3BNRnJC?=
 =?utf-8?B?YjA5b3BGVDkzbFUrSHBGeWFqVkV1MTZka2NLNnVoeXlOU3MyOXBiTHY1Q2lU?=
 =?utf-8?B?ZGZVTjd5cGJJTjJnL2c4S2loMVdhSkhRc2FrUUVJc0pkdm5Bb2NRRTVWMnd1?=
 =?utf-8?B?RlpUbFVkalhwM2FIMmNrVjN4TnVjNHJyUm5hdHdDWkd0T2R6UjBYVlNjeC9t?=
 =?utf-8?B?N2pNUUp2ZlloMitxc0ZaV0ZUVEhUN1o0R1MxL1lNcThhdlZubUxPSDJ3bkM2?=
 =?utf-8?B?OXdZRWx1a2VxZ0ozNWJBSjVGRzlJbUlJYWZ0MGtoSHI5V0x2RHZmNnJ3RUxE?=
 =?utf-8?B?bHo0ZEk2TTVyRnM5bGJxTm9kNXR4Uk85Y1hQbjJVdG95M3pCaHdBcHArN0xD?=
 =?utf-8?Q?mTd8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811ec9b9-bd77-4831-1e4a-08dd92209922
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:18:06.4111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3ttb9eyjmpMYQsbj/F5jnXwVcKCS3NoOu2YK63IpyxrDNmbasaAQmtMtsO2k2Sh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248
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

On 5/13/25 14:30, wangtao wrote:
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Tuesday, May 13, 2025 7:32 PM
>> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
>> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
>> jstultz@google.com; tjmercier@google.com
>> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-
>> mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
>> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
>> <yipengxiang@honor.com>; liulu 00013167 <liulu.liu@honor.com>; hanfeng
>> 00012985 <feng.han@honor.com>
>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>
>> On 5/13/25 11:28, wangtao wrote:
>>> Support direct file I/O operations for system_heap dma-buf objects.
>>> Implementation includes:
>>> 1. Convert sg_table to bio_vec
>>
>> That is usually illegal for DMA-bufs.
> [wangtao] The term 'convert' is misleading in this context. The appropriate phrasing should be: Construct bio_vec from sg_table.

Well it doesn't matter what you call it. Touching the page inside an sg table of a DMA-buf is illegal, we even have code to actively prevent that.

Once more: This approach was already rejected multiple times! Please use udmabuf instead!

The hack you came up here is simply not necessary.

Regards,
Christian.


> Appreciate your feedback.
>>
>> Regards,
>> Christian.
>>
>>> 2. Set IOCB_DIRECT when O_DIRECT is supported 3. Invoke
>>> vfs_iocb_iter_read()/vfs_iocb_iter_write() for actual I/O
>>>
>>> Performance metrics (UFS 4.0 device @4GB/s, Arm64 CPU @1GHz):
>>>
>>> | Metric             |    1MB |    8MB |    64MB |   1024MB |   3072MB |
>>> |--------------------|-------:|-------:|--------:|---------:|---------
>>> |--------------------|:|
>>> | Buffer Read (us)   |   1658 |   9028 |   69295 |  1019783 |  2978179 |
>>> | Direct Read (us)   |    707 |   2647 |   18689 |   299627 |   937758 |
>>> | Buffer Rate (MB/s) |    603 |    886 |     924 |     1004 |     1032 |
>>> | Direct Rate (MB/s) |   1414 |   3022 |    3425 |     3418 |     3276 |
>>>
>>> Signed-off-by: wangtao <tao.wangtao@honor.com>
>>> ---
>>>  drivers/dma-buf/heaps/system_heap.c | 118
>>> ++++++++++++++++++++++++++++
>>>  1 file changed, 118 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/heaps/system_heap.c
>>> b/drivers/dma-buf/heaps/system_heap.c
>>> index 26d5dc89ea16..f7b71b9843aa 100644
>>> --- a/drivers/dma-buf/heaps/system_heap.c
>>> +++ b/drivers/dma-buf/heaps/system_heap.c
>>> @@ -20,6 +20,8 @@
>>>  #include <linux/scatterlist.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/vmalloc.h>
>>> +#include <linux/bvec.h>
>>> +#include <linux/uio.h>
>>>
>>>  static struct dma_heap *sys_heap;
>>>
>>> @@ -281,6 +283,121 @@ static void system_heap_vunmap(struct dma_buf
>> *dmabuf, struct iosys_map *map)
>>>  	iosys_map_clear(map);
>>>  }
>>>
>>> +static struct bio_vec *system_heap_init_bvec(struct
>> system_heap_buffer *buffer,
>>> +			size_t offset, size_t len, int *nr_segs) {
>>> +	struct sg_table *sgt = &buffer->sg_table;
>>> +	struct scatterlist *sg;
>>> +	size_t length = 0;
>>> +	unsigned int i, k = 0;
>>> +	struct bio_vec *bvec;
>>> +	size_t sg_left;
>>> +	size_t sg_offset;
>>> +	size_t sg_len;
>>> +
>>> +	bvec = kvcalloc(sgt->nents, sizeof(*bvec), GFP_KERNEL);
>>> +	if (!bvec)
>>> +		return NULL;
>>> +
>>> +	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
>>> +		length += sg->length;
>>> +		if (length <= offset)
>>> +			continue;
>>> +
>>> +		sg_left = length - offset;
>>> +		sg_offset = sg->offset + sg->length - sg_left;
>>> +		sg_len = min(sg_left, len);
>>> +
>>> +		bvec[k].bv_page = sg_page(sg);
>>> +		bvec[k].bv_len = sg_len;
>>> +		bvec[k].bv_offset = sg_offset;
>>> +		k++;
>>> +
>>> +		offset += sg_len;
>>> +		len -= sg_len;
>>> +		if (len <= 0)
>>> +			break;
>>> +	}
>>> +
>>> +	*nr_segs = k;
>>> +	return bvec;
>>> +}
>>> +
>>> +static int system_heap_rw_file(struct system_heap_buffer *buffer, bool
>> is_read,
>>> +		bool direct_io, struct file *filp, loff_t file_offset,
>>> +		size_t buf_offset, size_t len)
>>> +{
>>> +	struct bio_vec *bvec;
>>> +	int nr_segs = 0;
>>> +	struct iov_iter iter;
>>> +	struct kiocb kiocb;
>>> +	ssize_t ret = 0;
>>> +
>>> +	if (direct_io) {
>>> +		if (!(filp->f_mode & FMODE_CAN_ODIRECT))
>>> +			return -EINVAL;
>>> +	}
>>> +
>>> +	bvec = system_heap_init_bvec(buffer, buf_offset, len, &nr_segs);
>>> +	if (!bvec)
>>> +		return -ENOMEM;
>>> +
>>> +	iov_iter_bvec(&iter, is_read ? ITER_DEST : ITER_SOURCE, bvec,
>> nr_segs, len);
>>> +	init_sync_kiocb(&kiocb, filp);
>>> +	kiocb.ki_pos = file_offset;
>>> +	if (direct_io)
>>> +		kiocb.ki_flags |= IOCB_DIRECT;
>>> +
>>> +	while (kiocb.ki_pos < file_offset + len) {
>>> +		if (is_read)
>>> +			ret = vfs_iocb_iter_read(filp, &kiocb, &iter);
>>> +		else
>>> +			ret = vfs_iocb_iter_write(filp, &kiocb, &iter);
>>> +		if (ret <= 0)
>>> +			break;
>>> +	}
>>> +
>>> +	kvfree(bvec);
>>> +	return ret < 0 ? ret : 0;
>>> +}
>>> +
>>> +static int system_heap_dma_buf_rw_file(struct dma_buf *dmabuf,
>>> +			struct dma_buf_rw_file *back)
>>> +{
>>> +	struct system_heap_buffer *buffer = dmabuf->priv;
>>> +	int ret = 0;
>>> +	__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
>>> +	bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
>>> +	struct file *filp;
>>> +
>>> +	if (op != DMA_BUF_RW_FLAGS_READ && op !=
>> DMA_BUF_RW_FLAGS_WRITE)
>>> +		return -EINVAL;
>>> +	if (direct_io) {
>>> +		if (!PAGE_ALIGNED(back->file_offset) ||
>>> +			!PAGE_ALIGNED(back->buf_offset) ||
>>> +			!PAGE_ALIGNED(back->buf_len))
>>> +		return -EINVAL;
>>> +	}
>>> +	if (!back->buf_len || back->buf_len > dmabuf->size ||
>>> +		back->buf_offset >= dmabuf->size ||
>>> +		back->buf_offset + back->buf_len > dmabuf->size)
>>> +		return -EINVAL;
>>> +	if (back->file_offset + back->buf_len < back->file_offset)
>>> +		return -EINVAL;
>>> +
>>> +	filp = fget(back->fd);
>>> +	if (!filp)
>>> +		return -EBADF;
>>> +
>>> +	mutex_lock(&buffer->lock);
>>> +	ret = system_heap_rw_file(buffer, op ==
>> DMA_BUF_RW_FLAGS_READ, direct_io,
>>> +			filp, back->file_offset, back->buf_offset, back-
>>> buf_len);
>>> +	mutex_unlock(&buffer->lock);
>>> +
>>> +	fput(filp);
>>> +	return ret;
>>> +}
>>> +
>>>  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)  {
>>>  	struct system_heap_buffer *buffer = dmabuf->priv; @@ -308,6
>> +425,7
>>> @@ static const struct dma_buf_ops system_heap_buf_ops = {
>>>  	.mmap = system_heap_mmap,
>>>  	.vmap = system_heap_vmap,
>>>  	.vunmap = system_heap_vunmap,
>>> +	.rw_file = system_heap_dma_buf_rw_file,
>>>  	.release = system_heap_dma_buf_release,  };
>>>
> 

