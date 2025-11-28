Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4FFC917AF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087EC10E75A;
	Fri, 28 Nov 2025 09:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3slgOtvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78D410E75A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdKGUvsxwPeEoZVVchseeADg7xYlpf5Gebuls9P0qCkjnRRmZu7TILf4ZPC7UVANsaFHQfTOhSwSHE3UK/rNAFe/qI2q9R4L5zYnLiBYFRQDsVcfUXmS+jsXxLTTGRpuOABhybrCrYGsLUKWgDu0ML9MyMWqQ0DgJQpVgSoIeLb6zbGBCbSTkw7orCb5aXH2ewPsZK6CZYNEC3tpWXtIrLHz1E3j3EUvc6/EEvueaNOeNv9fQdmWIYNc1B1icLaacCSphMLEaLqRcjU/VV2f4j9K3Y3T5S5Ao3alvMyawVeYNae5oRZldI3fhEbMqLS57YWtopf6Y5yQ/Rb8AC1HBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=do1UmDPiyG0JyCyfyDgZZHiAm3opFScERmKNJ/4xghw=;
 b=e7HFGgsm9P4JKT4pKKMq3vkwAot96fzGAQPtQQ3IuFoc7x13b1V/8Ewqc6ABZxLLpMI90CZJxKhSczH/3lJ3Y5zubkziUoj6lJhbROmeAJSgfA9tToTjl/X1efSIrIIF5334tFs1TSaha7ml7+6wz+wYjDqBAvHNGKmpDYQOZ6LArQ1gJq0EZtf1HcB5Eve3U5pUoJo1AY1rdMhw/uEvq2a9GW8pD14hePU9f6Bk10dWcWGvXXjG2rDQw2mtIzF0ZH+PHWPwEuriDtvXKueYDHWHOkZAIfZkpVgCZ+OSV32JEnUxksX6FfxygqgLcubmH7x4cyGIVcsSd4mVCiU0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=do1UmDPiyG0JyCyfyDgZZHiAm3opFScERmKNJ/4xghw=;
 b=3slgOtvOYxBvz8aUYQxfegeI5vF6jTjKszWQB2OFp0TF/21QVtoneIxOXHjKWxH49nB8dIsBQhltW+r4QnQg/LPw5kudIeKxLuYWxQy9C2zbJ+tVJq3bbkGjjELJMZ/I1B/OJGoEMPh21Y/SOj29vMe9hQXjLxGaZ7/C0iWJEOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB7088.namprd12.prod.outlook.com (2603:10b6:303:238::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 09:39:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 09:39:40 +0000
Message-ID: <faf6a25c-03a7-41d2-8dd2-ba74ee2e02a9@amd.com>
Date: Fri, 28 Nov 2025 10:39:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dma-buf: add some tracepoints to debug.
To: Barry Song <21cnbao@gmail.com>, Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 gaoxiang17 <gaoxiang17@xiaomi.com>
References: <20251128085215.550100-1-gxxa03070307@gmail.com>
 <CAGsJ_4y0zc_nh2q=w4uR04vtveCf6L7+hgafznHuL8ByWbyNOQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAGsJ_4y0zc_nh2q=w4uR04vtveCf6L7+hgafznHuL8ByWbyNOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: d4cdc0be-a64c-44ab-88fb-08de2e620d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OC95OHJsZVBxbGZJYzNtbGIzTHplZTh5SUxpQjlEZ3BNdG9HeTlRQzNudXBR?=
 =?utf-8?B?d0lnN2h4elU3eVhPVUN3dWVaNFhLMU83bUFqbG13WThLUy9pMDg3RTRUWVVB?=
 =?utf-8?B?WGJxcGdMM0FxcDZPS3lmaGVTV0dFejVCUTV6QlAreEQrTDhxRzMxVmFQVFlx?=
 =?utf-8?B?b2p6MXUwQ2VURG1wMkdHSnZjR0ZvaUI4aHh6N1RpR2dFY01RWUZzTzZJMUl6?=
 =?utf-8?B?SjE2U2VUSGdiMm5lRTUxb0pVT0dYOVFUUUJUSnU3d2w4R3lFOXJzSXBSS0h0?=
 =?utf-8?B?NTl2TDdZTWNJWWh2Wk1BRmRRN1VLZWEyaFI1K1lycHI5MlBzMTdsaFZIQVF3?=
 =?utf-8?B?Z3ZjZG9rSlNsa3JtcTNFWlFkaWNWSmVpRkdtU2haV0g3RGxiajEwNllTUG11?=
 =?utf-8?B?c1l3VlNKNjBMT20ySWU3aVg0TFhoQnNJNjRBLzhsYXVxTW91bmZIZzU4YW4r?=
 =?utf-8?B?MjlZL0w3TlIyRjdLWnJCSlNRNUJhbnJoNHNqNTRDWDVtb210a2U1cjNaMi9P?=
 =?utf-8?B?akFyellXdDF1VFJqTWh3OE1nSkNoMkMwNXFEQXpiWkJmT3lhbXQrOGFXbUl5?=
 =?utf-8?B?ckdFUVkzU25ERWNmUmZtQktoN3gzUzdMQjRmWklCcWFGenRwSUdRSmIvK3pI?=
 =?utf-8?B?eXoyZVpBZmhPQWR0NjVkYlNFYmJreWdCSis1eWpVQUl3ZkRIQXp3ODlyME1w?=
 =?utf-8?B?U3JhNnpSSFJsRFp3bmNWTE1hN0twdEM4MFRTY09DTU82akI0SFU4WnU5Z2hO?=
 =?utf-8?B?T2tjVkZtU0RHWXN0YWZYTlNOYisrcEF0alE3M2tua3pWdnpZT3FxOXN5TGNo?=
 =?utf-8?B?eDlwNEJadlM1MS8rWlJtbXpjS0Z5SU1lK3pOcFRmd28wcm1xZUJHdGlxUGU0?=
 =?utf-8?B?UUtBLzJ3aEdHWmQyamFNcUducUM5Mk5PU3ljMnhLVlVSa3Yxc1Q5SGFodHo2?=
 =?utf-8?B?azlGVDdQKzRGeHhJdkNIU1NPZ2hEQmZkNXR1NzNKS3NyczZrZ2pVVHNub1Ey?=
 =?utf-8?B?OFhGb2h4dmpQMlRJWFA1Zm1zQUZybFBzQmdxMHd4Q2VGbmFLV0N6RWZ3T3dp?=
 =?utf-8?B?d05RZXpqdktHSndJYndtOGVnaGVOWTV0Z3YxVVN1R1Jhd0ovdzc1bk8vS2hW?=
 =?utf-8?B?UkFOcFdsUFZacjJhOVFZUHNYRjlCQVJocks4REUrRUtJWmt4Z0VQNXI3UC9Z?=
 =?utf-8?B?b2FNMlVzQlppTXcvdC9GZWxkYXRSdUpDSC9nNWp2YzRuakR1RXF3ZEVhWkww?=
 =?utf-8?B?MXZSYVVZTTlpNHd6ckFqeDhTYzM5eW5ES0o3MXdCeHBPcnFoSU1IanFXNnhW?=
 =?utf-8?B?NDllc1ZNc1B5UWs1dU1maGJTcFNRbjhnOUp0WXQrZ0RweGx2NGZPWkpGN3d0?=
 =?utf-8?B?V2xJUmJpcGErSjVWTE40c0JBK29qOHp4TVYwY3k2ZzBpWkNQWG0vUGgySURL?=
 =?utf-8?B?RUxER3U5U2ZQSHBsOTVtcTRaZnB6eHBrS2E1a3dudGphZmJienVrMTJaOE9T?=
 =?utf-8?B?RkVBaDVMNWk5ZkZobEVDSWoremQyN25tTDdkVDRTK25KLzNEaHFVNFlxeWM2?=
 =?utf-8?B?TnhLR1BsTHNWbDB3eXFFcnVsTVZLU3ZsV3EyZUFwbHFGSzlNK1J4c2pMNkZ3?=
 =?utf-8?B?QmZYdGRvQUNKd0txQzhMZjdjUWtOeC9kdkpuSWJFaDgzMWpzeEJUYU5vbzFh?=
 =?utf-8?B?d1drTS9OcjlYaW56bGpabmlCMmVoNXpNcGtHNHpxbnZUS2xndHFqZTQ4SzVi?=
 =?utf-8?B?bms5YmpRVXhibDBScXhyVkpNTVBJY25sWUVHZlJtaUpNVjBTaldOM1VQcUFl?=
 =?utf-8?B?VldXblhFbzRrS1YyL3BTSUY3R1BMNVFSOVZVTW10UzYxY3l0YWptbDJCYWtT?=
 =?utf-8?B?d0VkVndNYldkYldydmN0WjZyRG1zNVhmbzVGTlNZRmk1WXJETzJvT3lhaWI3?=
 =?utf-8?Q?0ddN/FW5cRxTHMJ85k7bkPECh3ojcb9r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODYwYkJRS3hJWG4xZWRkRDB5MU5yU1ByTnFsaTdrd2M2SG1KWGhtVUdDOE5m?=
 =?utf-8?B?d1BMQ1U2U01CL2pkUjFOaFBPZ3ZVcXdsVnIvanBpUkUzOFdJYU5VdlY5aXl1?=
 =?utf-8?B?b1RLeUJNMXc4V2VQU0o4NUFwQ3Jpd0ZMRFVrTE9OMEVHMEJQT1I0c3lTN25h?=
 =?utf-8?B?Yitib3hwMXFqY3lKaXQzVFNGUzVDK2xDNWRleGY3eCtQam11cldwNXlXMnNY?=
 =?utf-8?B?dVJNK1NybG9MdXc1blZwUk5xQVN3Z09qbUNGYmtZSFhUNU1kRlp0S1BBT3gy?=
 =?utf-8?B?VlJJcC9GSEtSUW82R001M1RFSEdDWWUrOXhmcGlONlRNRTZiK2pXRS96ZFEw?=
 =?utf-8?B?L3hJYTVRSVlkSzFqN2Q4eFRha0JEY2ZWUUhFc3pIamZ2cWlPaUdwWXd5bFE5?=
 =?utf-8?B?enVycU1ZYXZMVE1Oc3UrM0NCMzgrWXErSzdPRlFKTFlhOXk4bG9FajlYZFdx?=
 =?utf-8?B?cHFmbEwyTmUwUU5xZXhBWHRCM1lSOXRIY1VQN2JIUVlUQk1zY3N5ZkxvZVly?=
 =?utf-8?B?N1YzWmtCWENYSHZhdjg0NlNPTGV5aHZQdjU1RUJHZUpNKzdnb0liWC9sUDh0?=
 =?utf-8?B?ZWpodjVCWWlrODFqeEY3c2hzaUpzb210MjdXNSsvcHJFbmJ5U2NSNUc4bU55?=
 =?utf-8?B?aXZaNkx4Q2hCRjY5eVhuNWIvNGVSZXdKN1MwTlBtMUtRdUtNZkQ1MC9OeWlM?=
 =?utf-8?B?b3ZUb1QzQWREbUZOUm5zS3o2Wm9kRmcrYmNUMUQ0RG9BeWd1d05FczdMZTFa?=
 =?utf-8?B?NEk0TDNtNUI2SEd3R2lUeUV1N25QRW1panRQOGJNb3dvcnV2SkVCZmVPOHd6?=
 =?utf-8?B?Mzd6ck96eUVyWDYwZnMzRTJuYW9yR3Y4UHFkSFphcktySXhhckQzNzl1dkRD?=
 =?utf-8?B?cS9tSGhtQ0k0Q1ZPRlJqN1Z6TVdjODBLMDhoaVRjVGVWNlJDSkZjWFNqRnNE?=
 =?utf-8?B?Ti9LbDMzYVJLd2pJYmpRYWFDaHlZaGVEbC9EalgzOE1HNW0wTTJZTmdOZElC?=
 =?utf-8?B?eTl1SEZoTG5NZFBaOWRLZ3RGdyszWTVTWENrWjJYUHc5TUJSbWllYjhMRElF?=
 =?utf-8?B?WG1KN0FsUEdBekxaaGF5WXRnZm1qVnJJOWx3aGZxR1l5akZHZWgxNzdKL2pr?=
 =?utf-8?B?ckNNTWliTjZPR2tGZG9qLzNvSGsweXVIMVdXbk9pVHQwQ0dnVjhyQkVORWRN?=
 =?utf-8?B?OFlETkFYRTJUcDJ1THhUK2I3cjJCcVB6N0N2TDdYdi9BdlVpUXZTbi9UZUh2?=
 =?utf-8?B?NTI1Yy8xOXdUNEFPS1V3eGtaUkZUZG93NDg5SUNMYm5ZWVVnSlVGZmZGdlQ3?=
 =?utf-8?B?azRMVkJkenpSbmxLbkF6RllRdXpIaUUrancrekhFYy9pamwvNlJDaHNiSEZ1?=
 =?utf-8?B?aW92UXFiZkNGUHNZeit0M0pFZkF1S2UzS08wRHdBQVhCMi9QczNJOXk1YjQ5?=
 =?utf-8?B?WkRSa1RiVFBtVEU3RFJWQTNDZWZqWXMwdmZIODEzOWYvRTRmNDMxbXNJc2NI?=
 =?utf-8?B?RFREK0thcld0V2tDaWh2L1VYanIzc08vZ0lVVXJ1blBzM1JJelpPcHBzWks3?=
 =?utf-8?B?alkwdE1YdGxDQzVkQmJKcHdYRU8xMVdjMnB2R3JwSDZmdVlOS0VBdUpaaXV5?=
 =?utf-8?B?RUg2VFRGZ0w2c1E5YmNBa0hZQXpuYXJvcm14MHpNdWFmRUVvTFhHaEZ6SGFT?=
 =?utf-8?B?dWg0cXBWTWRUUURZV0xCYWRoZHo1Y1NTL1R5NVFCdVhGcGZidlFCbjF3Q2l3?=
 =?utf-8?B?UW5rUUdldC9xRllPTzFvVnJWdklzcXFGZmhxZWxnN1RRVkJFQlVlaFBCakR1?=
 =?utf-8?B?NzcvQ0srd1lRMVVuUjlka2J6eXd2T1h5WjZETlh1VmRPakJOYkUxSkhxblNI?=
 =?utf-8?B?SEljZXNsTU9wSzJtSjFwYVRFdEh4dklBNUNvYTRncmIyd3J3MGpBakpnWC8w?=
 =?utf-8?B?K2FSblI1QmZiTks1bzdKb3BLZHdJamNFcnp3c2JYOTdEcEU1elBRblpDZkJ1?=
 =?utf-8?B?dkVjNkNIME5zU1NqSzI0U0JIQW5FRnNBejFocVdCUi96NnYvekhRa1ZSdUNx?=
 =?utf-8?B?Sno3anNQcVQ4ZGJTSm9UbmhqZ1UrSnRTQi91OEpBZXRKNWIyM0V6eHRIcTBI?=
 =?utf-8?Q?5ASs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cdc0be-a64c-44ab-88fb-08de2e620d8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:39:40.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsLPMjgvgQ9SkckcdAuvefulbeHfyZ/9qnXJgNNF/8hrBO/BwryboA6G4jpRX1C5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7088
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

On 11/28/25 10:31, Barry Song wrote:
> On Fri, Nov 28, 2025 at 4:53 PM Xiang Gao <gxxa03070307@gmail.com> wrote:
>>
>> From: gaoxiang17 <gaoxiang17@xiaomi.com>
>>
>> I want to track the status of dmabuf in real time in the production environment.
>> But now we can only check it by traversing the fd in the process or dmabuf_list.
> 
> might be:
> 
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
> 
>>
>> For example:
>>    binder:3031_4-18348   [005] ...1.   545.568275: dma_buf_export: exp_name=qcom,system name=(null) size=217088 ino=2750
>>    binder:3031_4-18348   [005] ...1.   545.568284: dma_buf_fd: exp_name=qcom,system name=(null) size=217088 ino=2750 fd=8
>>    binder:3031_4-18348   [005] ...1.   545.568399: dma_buf_mmap_internal: exp_name=qcom,system name=qcom,system size=28672 ino=2751
>>      kworker/5:1-130     [005] ...1.   545.570193: dma_buf_put: exp_name=qcom,system name=ab size=28672 ino=2751
>>     RenderThread-18891   [005] ...1.   545.602994: dma_buf_get: exp_name=qcom,system name=ab size=217088 ino=2750 fd=1087
>>     RenderThread-9409    [000] .n.1.   545.745004: dma_buf_dynamic_attach: exp_name=qcom,system name=ab size=217088 ino=2750 is_dynamic=0 dev_name=kgsl-3d0
>>     RenderThread-9409    [005] ...1.   545.747802: dma_buf_detach: exp_name=qcom,system name=bq size=12771328 ino=2764 is_dynamic=0 dev_name=kgsl-3d0
>>
>> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
>> ---
>>  drivers/dma-buf/dma-buf.c      |  48 +++++++++-
>>  include/trace/events/dma_buf.h | 160 +++++++++++++++++++++++++++++++++
>>  2 files changed, 207 insertions(+), 1 deletion(-)
>>  create mode 100644 include/trace/events/dma_buf.h
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 2bcf9ceca997..6e04e12f149e 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -35,6 +35,9 @@
>>
>>  #include "dma-buf-sysfs-stats.h"
>>
>> +#define CREATE_TRACE_POINTS
>> +#include <trace/events/dma_buf.h>
>> +
>>  static inline int is_dma_buf_file(struct file *);
>>
>>  static DEFINE_MUTEX(dmabuf_list_mutex);
>> @@ -220,6 +223,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>             dmabuf->size >> PAGE_SHIFT)
>>                 return -EINVAL;
>>
>> +       if (trace_dma_buf_mmap_internal_enabled()) {
>> +               guard(spinlock)(&dmabuf->name_lock);
>> +               trace_dma_buf_mmap_internal(dmabuf);
>> +       }
>> +
>>         return dmabuf->ops->mmap(dmabuf, vma);
>>  }
>>
>> @@ -745,6 +753,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>
>>         __dma_buf_list_add(dmabuf);
>>
>> +       if (trace_dma_buf_export_enabled()) {
>> +               guard(spinlock)(&dmabuf->name_lock);
>> +               trace_dma_buf_export(dmabuf);
>> +       }
>> +
> 
> perhaps a macro similar to the one below
> 
> #define DMA_BUF_TRACE(FUNC, ...)                  \
>     do {                                          \
>         if (FUNC##_enabled()) {                   \
>             guard(spinlock)(&dmabuf->name_lock); \
>             FUNC(__VA_ARGS__);                    \
>         }                                         \
>     } while (0)
> 
> 
> This would help us avoid duplicating a lot of code.
> 
> could be:
> DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
> DMA_BUF_TRACE(trace_dma_buf_attach, dmabuf, dev);
> 
> ?

Thinking more about it I was wondering if we really need the userspace assigned name in the tracepoint in the first place.

The ino should be sufficient to uniquely identify each dma-buf, tracing the name should only be printed if it's changing or otherwise we spam the tracelog quite a bit with it.

BTW We don't have any identification for an attachment, so when multiple devices attach to the same DMA-buf the trace would be quite meaningless. We should probably fix that.

Regards,
Christian.

