Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD37D0817B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5763D10E1E5;
	Fri,  9 Jan 2026 09:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OldKE9IH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DD710E1E5;
 Fri,  9 Jan 2026 09:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QME1TEoP0+yFuwPGoZ5hQ9XQqVwxdpTWmu4ZAsnAyxYEXBUanv8xN+Ijo19Tfw/GDCmxlDhhIqNnZhlC8cGpuvKnEpi6m8TkZd9u7weiUDe/XxwmiURq5FZHXfBHomrTwQvTDd3kvZdxPh3Om2TiqBL37UmMQncLO2H0M3j0/57y12UDrdNKjnnbqShsON1gXVmjI5xXCyOxoDJu9cIriaq4/urfGF5v0t7h8+VnlgWtuCB2k16nH6bTiEMfEMeKsegzzgI2Kim2pMSFXmiOtGnuZYUT3XmFvSPJSpk+MMKwlnUgTt4abY6SeSBp/dOaRXb0w9CfAgBOAVryIHAb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/OBtaalu9ZOynch7oOzKE1J1xRuAUVW0ulkwuiSN5k=;
 b=CI2EJIAfNuuTuPfCcbCMJdY2BwgKgtCTgWLmycuaB04HQ2Wvj8GlHO9TjknEaRW/A2CtC0w+cWr7zzUlnjR9xhXE8UAIco6HjeGHN2CBjjzedva7p4bAYy3MCAdZOi49bqViavWP6XNlTLkvxIgdE+7Eaq0dlpASweKMZGCaKuRwLkhGAXFDzzzhpoeRu4+x9hbmRhI8GFSTwAhmUgtNHM0Drlm0HHmxsAEeGkVrFfKEKiMfjky9suQoTwxABk05rD+XtC8/isHHp3mzBr5evjZXzWvX5VDgeCbTVLIn6htX5V18h/yZBVHvRqYl0XL508hhXkL/VbB3D2jaHOw7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/OBtaalu9ZOynch7oOzKE1J1xRuAUVW0ulkwuiSN5k=;
 b=OldKE9IH420ekKnlZg0LLXrkffWPgELu+CPqxd+JxNHiM+yY95F+WkXeP9NXKJYrtvcUUysK0/ya7Nw29bSwOhwfeRkLtLc5KDP2/vBop/0/6QeAR3u3QHAT9/gbq4wFCjmRiwQgPI4Y4rK7zI5CpidQTrU0qcXBL2mWDUj/sb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7217.namprd12.prod.outlook.com (2603:10b6:930:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 09:07:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 09:07:34 +0000
Message-ID: <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
Date: Fri, 9 Jan 2026 10:07:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf45704-46b5-4cd2-3ce2-08de4f5e8692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21wQ2FDN1Awc3duNGppQ0o0MmI5K29wcnpydTQrQWJPMTRHTFpJc1FUM084?=
 =?utf-8?B?ZmJCeU1WVzhtanpubjJuNTlrcG91RThERldoeUdPcnB6Z2lkWkNaNEpXSHVW?=
 =?utf-8?B?Rk80dWlvUnhxc2NBVFVMOFYxa25DdDk1OTdJdFFpckRCa0xkd0lLaURaRU5D?=
 =?utf-8?B?T1RCOE5DTm9jR29sSS9hS2MrNWNKUGlhVzgrNjZmMDQwTnY3dkJKK2pLSjZ6?=
 =?utf-8?B?dS9ldDB1VnhXYThxS0tZbkx3d1lSK0h2VjNtQ3ZCaEFNcHZmMTBpWEt3bUQr?=
 =?utf-8?B?YU5WSzR3QWFHME04cE93YUtnYVFRSEM4KzNySis3SisyVnhDRm4wY3N4SDk5?=
 =?utf-8?B?WVpGR2tjNkN3MDNlQmh6S21ZdlM3UEs3WWl0Y1Rscm84eWxLTW9JbjlncllI?=
 =?utf-8?B?Slo0N1NVTlIwaEFCY09vMVJJUjR0UW12dytSdENvTnZyaDlGTG9hYTUxcWtZ?=
 =?utf-8?B?bUF2OGk1WVNlY3dVR29NY3hqOFZ1MnB5RlZRMldzM3JJdUxJTExRUnkrOFRT?=
 =?utf-8?B?N2U1d2NGckVTZjRHTW5WcHdwNytuS3lxTFRKdFJYSm5ibkYrcnNjbVM0TkZk?=
 =?utf-8?B?dGFZWElrelc3S2pYd0VaOVV3V1o1RDFkYVpNenpvektZa3I1WnlvLzd3aFph?=
 =?utf-8?B?L2xMNnNScFplOVd4aUtjbll0eUZITGtkL2JKU2dzUEp5SzEvVHFscWltMG1H?=
 =?utf-8?B?MmxLNU95UTBpQy91RjRDcVFlZEUxakdaNUw4TFJQZHlTN2p6VG10eE5qbWhC?=
 =?utf-8?B?SVcyQWJlVncxTi85d3pCcGw3b0l5eDNmVGV0TnpEK2RGSjgxd01xSzJtak9y?=
 =?utf-8?B?YVRmWTBIdDZta2EwM0RDUW51NzNubDgyTjVzRjFTNmZ0bUZYNVUxZ2sxaFBq?=
 =?utf-8?B?QktFdUwrZ0tQMkVIeXN6cDVqdlVnYXFTVEZvNThvMmlEVEN4ZmlwNXluT3Y5?=
 =?utf-8?B?cFRIUUtBb3l0TXg3REh6VVpEL1lqSmdzblNTemY2bU1LWWcvMGl2RjJhblll?=
 =?utf-8?B?WXV6UE9sMnpNbzFyYjdtdE44cTViRTczQ2ErMEJyUlRzYUJGNFFMdXBqVjBi?=
 =?utf-8?B?ZnMwZ3NwRWRaMWZTcXQ0VzJRZ2tTMDZMZkZKalNKb3JOdkFhME1LTUl1TWVN?=
 =?utf-8?B?U1NFMy8xd1NvcUVIQ0VsVU1lNThKQnYvaENkWWpxVS9HdEVqVDFoSXNxYlVB?=
 =?utf-8?B?UEtNUzBYSlh5d0M1KzN6YXVRM3lKUktEaVptQklWbVprVm52M2xacG5yOVcw?=
 =?utf-8?B?dE94cXdCVU9WcmhzVzdYV25rd3htd0Zta0hMWWdtYmM3VHNwVDBHUlcyaTJ1?=
 =?utf-8?B?NDA5d1dqK1g3WnJ3Nzc5ME5lZ21PVzlEMis3dUJoaWRpRWNLeXBOdkNVZTVp?=
 =?utf-8?B?VitpaDlXdWg3RTkyM3NBZk9LOTFxZXcvejBSeDhKNlgycHVxMDIya0tWR3ZM?=
 =?utf-8?B?OSt5ZEpFNVlaeEpHY2dpVDh1dzhYOHJwd1lrYW1reU82dU1QWE9OczUxSFNt?=
 =?utf-8?B?RW5nYmV3SHhhak5nUXRNMmZXbTZ5VjdabThsUTN5OEVGRGhQMmpVRmZlQjVu?=
 =?utf-8?B?NS9PdU9sd01Uelh0T2FFSnR0OERuV2tTd3pZTnplTTJNdXZob1dUM0VFV0V1?=
 =?utf-8?B?WmdiSUZ4MkxmOVFXSnR0RWpoTWFEMk5YRWtwbTlveXZhZjYvWExpcjNWT2FL?=
 =?utf-8?B?Q2pvWFVmb2lsVWNrRU5pYldyQWxpWmhjalFrZFNTZ0dRSDI3SWRPdThiRk4x?=
 =?utf-8?B?SitkYm5BaWRKVnFGT2lkOGpxNzRXZWlZRVk3RkJ6ZUxrMENBLzNJUnpPMjhy?=
 =?utf-8?B?cWpSNHBRVXBhTmVxc2R0RHJpT1huTyttNWtSeG5VOFNqMW9STi9IdXN0ZE9H?=
 =?utf-8?B?SEVYWTlMaTMrZ2ZyZWxMdVBDeFhERVI4ZDJ5VDRiRmdyazI1TENtb1laaXhW?=
 =?utf-8?Q?fHzaigKNWi0I0BbT5PnZ1fEImT4HQblp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS9SUzNJVUt1d3plb25yU0J5dXJQSTBFcFcwTWozaWUzL2FPdUhQV29iQk5M?=
 =?utf-8?B?TzVpQmp6Tk5ONzJIU1IwV2Njd21CWWFrVXV4K2VKa3NSbFlzdk00bWhacjE0?=
 =?utf-8?B?cW9EelRyOC9XWm1oeFkyQlN5SG92dmZENHZGd1Q2dlo5U0NwRXFoVmp0eFh0?=
 =?utf-8?B?cFpHZGZnSUFsRTZyeTNwQW11MVBQTTFIT01kM1Z6ckZmSXZhU3BSNWpjT1V4?=
 =?utf-8?B?V0cwVWR0WHpkU1ZHMWwvY2xnc0tTd0dOU0tmVVNTV2JtTHpqSmcvdjFic2VT?=
 =?utf-8?B?cVNXWWM4ZS9CWXQ5RW5UYm9jYlh4bmw2RG5PcGZCZ3ZNbW5ET1ZFbFFTejdX?=
 =?utf-8?B?eWQvbVp3ZjN2U1hRSjdHR1NoS09EZzdkTmVsWWR4eWl6bHZubEN4dXNScjJD?=
 =?utf-8?B?aWxlWnpSb1p3QU5BSldJTWRnaDh4NXhPeDQ5VWlocG5pamxqZnlmMVhCTisr?=
 =?utf-8?B?MVVFV1U4NkRsdHZKeUdYVWFvTjZCK0xteGVBU3RwTUMyZUJKczRBRmFQamh2?=
 =?utf-8?B?b1AwS3BRV1RzUGd4R3BpaktvKzdKbGRqT1JtbndnSjR2MlhjSTNYcnlRUTlu?=
 =?utf-8?B?RkcvbSs4WlduUXI3ek5kVW5lYno4TTBLaU5UTGdaMlFlQ3JIM29aUmhYSGpW?=
 =?utf-8?B?WnpkUEVkWDcwL3lOcFl2dUZDSVVRUDdwL1dCQU1NeE9oY1VjUU41ckQzdG80?=
 =?utf-8?B?Q05WdWhwM2xEK0oxaEFVdTdqMTd5V09kWXZCYllScWxwWkpXVWJBSkp0QWl4?=
 =?utf-8?B?T3RDMXEzbC9vQlJpbUg0MnFpR0tRUy9zYk9IVVJsWURiQ1VGRUdkSUhmeDdL?=
 =?utf-8?B?OEJxRnVMZ21CRklGeU1MTjNUNkk0b0l0dmNjUE4razJTdk51ZndXbi9BZU0x?=
 =?utf-8?B?UUsybFJXT2x5bTBuUWFoYTlOYVhWcGtrblhMRGc0dW1GZ3hwWklObnBqeWg1?=
 =?utf-8?B?T3ZhQzdxMklJc3I5VkpjZlFqYUx3aXlZZXUxOGRJYlRsM09wdE9peURqRW8z?=
 =?utf-8?B?b05vMUlRU3ZBdnkwaUt4MkRtVlkrTGVHeTN0bXFOV20xR05iK2RQNkNyWGVS?=
 =?utf-8?B?ZmtTQ3F3ZHcwZlViWlVLcVBvQU5MS3BnQWRCZndIN0Q5SEFsTi9UTEVwL1dG?=
 =?utf-8?B?RXZJS3ROcGtJeUF2YjQ3d1ZsTVk0RGN6M0F6QjQ2eWNFOGhnazUyNm1SQWdH?=
 =?utf-8?B?elpXMjZHQ2tHOG1MbkFLb1hDTGxaN0NQYnJ3YlBnaERuSHlyS0ljMkdRMUxX?=
 =?utf-8?B?UTl3OGR1bnhCZ1hnNDBSbXQvTUZaM3F6ZFpFWmNMUVhOemlmc244N0hiOXdY?=
 =?utf-8?B?WDk0TEdNVFVGQkowOGVlWDNkaVlTeHgxQStFTUJLMVE0dzJhTDZKck16blZ1?=
 =?utf-8?B?dllxZEVoeWp4aGE5aXhSVlNEOUJEUG1NWlFCYjBBbTZDdld0dEY2YndNbU1o?=
 =?utf-8?B?YjhlMmJiRjFWR2xTZXY1TFBmUTBLVC8wdFNPN2svMnM3NE0yc3RCaDRDZTBK?=
 =?utf-8?B?YzR5SVVLVlNJS0xnbW9UN2ZMSy9pS0F0akJSN1QvQWRtT0REcUhjclBoNUFa?=
 =?utf-8?B?TW80b3ZtWVpaak9tbUVrS3AvZDlhUmZ6SzNndUc0cWVMckxrVkkzNTlGbmNO?=
 =?utf-8?B?MlpuNUtXZ0czN04ySVo3bGU0VFg4V0NsZnpEdTlmZ0dyUWJJSTgzR2NmbCtJ?=
 =?utf-8?B?OG9oeFloZUt4dXlWTEw3Uzl6ZEpVTmxkckVON2piZXJzbVUxd1B0eXh4b0tG?=
 =?utf-8?B?ZXlOZS9yQS84RnlCZXRXdDAyd3NmWCtETzVNMlRNSUN6Rm1TdXhWV3NNQkVM?=
 =?utf-8?B?eDVzdlFVdjIveTlxZDUyMk1aTEhaOXM1cVB5dytMMzllbDJpZ1ppM0tESHRU?=
 =?utf-8?B?UHBaUEtHMHY4VFNBRVIzVHlnQzYvbGEwMUlmZlQzVWk0TStUVndld0RQR2pH?=
 =?utf-8?B?QXpZTW4xRWhuNGZxZ3hRcUw2bXI2QjBScEllQWF1UVYrYUxYdkFPUllFdmtp?=
 =?utf-8?B?ZDJTRFY0cUViUkJnV0RnVHhST0lNUHVnN0k3QW1MclRDTXpZNE1ETDl4cGgw?=
 =?utf-8?B?RHVwa1RCVWNoVDY5Y0Jmc203SGdVelRacEdEbE9NTmNNSzV5TS9PUEMrOSs0?=
 =?utf-8?B?SjlJdFZFcXVmL1p1YmF4VHovQ1ltWnoxeGd0OGwyKzZMMkMvNlVvbVZiYmZ2?=
 =?utf-8?B?b3pnR3hrcVBQbjg5Vy92MkkzZ0R5aTBUUnBKU1lidVdrbndBbm5HU3pGQ0g4?=
 =?utf-8?B?ZllUamZURmJBU05wb1p6M3lvekNueG5ET2ZtU1AxdFRVOVk1RFhwQlBTSEJn?=
 =?utf-8?Q?bKmDDXpnRzafHcOckM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf45704-46b5-4cd2-3ce2-08de4f5e8692
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:07:33.9919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJmNe6MoMqMdokLxcpfrRhWsY9CqSnBYMj3lj/n5WnKpt8MzXbG5HJohrXHWY+ai
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7217
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

Hi Honglei,

I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.

Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.

Regards,
Christian. 

On 1/9/26 08:55, Honglei Huang wrote:
> 
> Hi Felix,
> 
> Thank you for the feedback. I understand your concern about API maintenance.
> 
> From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
> 
> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
> 
> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
> - When flag is set, mmap_offset field points to range array
> - No new ioctl command, no new structure
> 
> This changes the API surface from adding a new ioctl to adding just one flag.
> 
> Actually the implementation modifies DRM's GPU memory management
> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
> 
> Would you be willing to review v3 with this approach?
> 
> Regards,
> Honglei Huang
> 
> On 2026/1/9 03:46, Felix Kuehling wrote:
>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>
>> Regards,
>>    Felix
>>
>>
>> On 2026-01-04 02:21, Honglei Huang wrote:
>>> From: Honglei Huang <honghuan@amd.com>
>>>
>>> Hi all,
>>>
>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>
>>> **Key improvements over v1:**
>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>
>>> Based on community feedback, v2 takes a completely different implementation
>>> approach by leveraging the existing userptr infrastructure rather than
>>> introducing new SVM-based mechanisms that required memory pinning.
>>>
>>> Changes from v1
>>> ===============
>>>
>>> v1 attempted to solve this problem through the SVM subsystem by:
>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>> - Registering multiple SVM ranges with pinned pages
>>>
>>> This approach had significant drawbacks:
>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>> 2. Added complexity to the SVM subsystem
>>> 3. Prevented memory oversubscription and dynamic migration
>>> 4. Could cause memory pressure due to locked pages
>>> 5. Interfered with NUMA optimization and page migration
>>>
>>> v2 Implementation Approach
>>> ==========================
>>>
>>> 1. **No memory pinning required**
>>>     - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>     - Pages are NOT pinned, can be swapped/migrated when not in use
>>>     - Supports dynamic page eviction and on-demand restore like standard userptr
>>>
>>> 2. **Zero impact on KFD SVM subsystem**
>>>     - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>     - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>     - Zero changes to SVM code, limited scope of changes
>>>
>>> 3. **Perfect fit for non-contiguous VA registration**
>>>     - Userptr design naturally supports GPU VA != CPU VA mapping
>>>     - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>     - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>       This VA remapping capability makes userptr ideal for scattered allocations
>>>
>>> **Implementation Details:**
>>>     - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>     - All ranges validated together and mapped to contiguous GPU VA
>>>     - Single kgd_mem object with array of user_range_info structures
>>>     - Unified eviction/restore path for all ranges in a batch
>>>
>>> Patch Series Overview
>>> =====================
>>>
>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>      - New ioctl command and kfd_ioctl_userptr_range structure
>>>      - UAPI for userspace to request batch userptr allocation
>>>
>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>      - Add user_range_info and associated fields to kgd_mem
>>>      - Data structures for tracking multiple ranges per allocation
>>>
>>> Patch 3/4: Implement batch userptr allocation and management
>>>      - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>      - Per-range eviction/restore handlers with unified management
>>>      - Integration with existing userptr eviction/validation flows
>>>
>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>      - Ioctl handler with input validation
>>>      - SVM conflict checking for GPU VA and CPU VA ranges
>>>      - Integration with kfd_process and process_device infrastructure
>>>
>>> Performance Comparison
>>> ======================
>>>
>>> Before implementing this patch, we attempted a userspace solution that makes
>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>> register non-contiguous VA ranges individually. This approach resulted in
>>> severe performance degradation:
>>>
>>> **Userspace Multiple ioctl Approach:**
>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>> - Performance loss: 60% degradation
>>>
>>> **This Kernel Batch ioctl Approach:**
>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>> - Achieves near-native performance in virtualized environments
>>>
>>> The batch registration in kernel avoids the repeated syscall overhead and
>>> enables efficient unified management of scattered VA ranges, recovering most
>>> of the performance lost to virtualization.
>>>
>>> Testing Results
>>> ===============
>>>
>>> The series has been tested with:
>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>> - Various allocation sizes (4KB to 1G+ per range)
>>> - GPU compute workloads using the batch-allocated ranges
>>> - Memory pressure scenarios and eviction/restore cycles
>>> - OpenCL CTS in KVM guest environment
>>> - HIP catch tests in KVM guest environment
>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>
>>> Corresponding userspace patche
>>> ================================
>>> Userspace ROCm changes for new ioctl:
>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>
>>> Thank you for your review and waiting for the feedback.
>>>
>>> Best regards,
>>> Honglei Huang
>>>
>>> Honglei Huang (4):
>>>    drm/amdkfd: Add batch userptr allocation UAPI
>>>    drm/amdkfd: Extend kgd_mem for batch userptr support
>>>    drm/amdkfd: Implement batch userptr allocation and management
>>>    drm/amdkfd: Wire up batch userptr ioctl handler
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>   include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>   4 files changed, 740 insertions(+), 20 deletions(-)
>>>
> 

