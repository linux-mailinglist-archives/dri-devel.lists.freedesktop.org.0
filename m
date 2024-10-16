Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC649A0DF2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 17:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CBA10E736;
	Wed, 16 Oct 2024 15:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O21IE6bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FAC10E075;
 Wed, 16 Oct 2024 15:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ3bJ46WuWynOht9P/clB3K5wTMom/Gbg4b4Cjdn/40tkUxxu3RABq23zvJ3PVnVmhm0pOqIEAiF1UtehbdTKYU3IApI8BL/dDF5wRuW5KgPTXtYL/K1p9JPtM+pFZ9wRZYNZG2Tnf9Q2mgq/mW/y7ty4S5jjIfs2+ZCOaXoswij/eAf6LKANwYqg6Q1FtTdS7tEmf0iyvm4XCTVU4er/K+WwvjXJu6ruekD4wRpYcxesXUUUyztiouabD1Mp4WkbuK7hzY6F6g4sJMgXO1ysU1TDTvZYAQ2Wk5bJyS2RNcpWEhZ73rbGj0qQovcpQ5RLKRB8sgzWnBgE5fX72htQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmjGnmG8fdUQ1yjg4JFwvYBu+dMaUszUBb9u9gcFbYU=;
 b=zNDzUXV6rGXCqRipTzkzAxlVTz92ANrp1UoIvQ29xsubCiZdmtMQW9tJIqdEHqwO91aaEKDgLEvgUOB1X+bJSg2KZ4H7qT9YpnunqBPJsCpQ3Ivo61AwmARFc9OOLid5pREhRw5k9KbJciXAhNYzkaD1sMBf6K89o511BIm3SY5q86nC55sykpN5HZwnQimJjh4WRo8fxXmaaw8gU+BXvQNNTgJUZkRL15unJid5FepQCkGoF45Ir5Q1UstPDpO15N1n5n2z8bOQw+3dxHJmivTFenl6+VQ775+OWvfG5T5B2ElEsSTNdQ0ET22xSTwt22KcU9WrlFm8GPnZW18Q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmjGnmG8fdUQ1yjg4JFwvYBu+dMaUszUBb9u9gcFbYU=;
 b=O21IE6bpDUkqKCCVFe72J5gJFxZbQn8cf+3+KN83WI4ipAo5Fw/+0ssmn90ouDSex74S7jrJRSZw6bDdlTM49ZIeKG9HWO3Dc5QLS1R53JoWmlDCqutrK/SulxQ/kJ3oLrDoGj+igvaay0fFLWiwbI/HhzebJnonUvn/8kI3Da6HU+C6Y9RWo2BSqCE64LlvZOiiyAvKI5ugfQYZV8RY5m4mslNPeeA53d+LbhUQYql7JRnmA6XiTnlDZdjjq5KOBfPUCzzCqKo0HhpuX9cnOet443/1ZZQ3k0e8R5DFEyliSYcxDgjEFBlmYhuNHHPC5+Z9znRlqp6RxoPn2HsY6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19; Wed, 16 Oct
 2024 15:19:05 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 15:19:05 +0000
Message-ID: <7f09fb43-8e0e-4746-b93d-2d09efe52d88@nvidia.com>
Date: Wed, 16 Oct 2024 18:18:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] nouveau/dmem: HMM P2P DMA for private dev pages
To: Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@Nvidia.com>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-3-ymaman@nvidia.com>
 <87bjzk8viu.fsf@nvdebian.thelocal>
Content-Language: en-US
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <87bjzk8viu.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fdd360-ebfa-410d-e4b3-08dcedf5df85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU1DTWdOcVlsL2VRVm9aZXZlQWtTNWlma1FvVFJGaG5SN3RKMHRvMFgvalhF?=
 =?utf-8?B?dGRLWVpvT2JXOEpMeDVBMUJidlRoL3QxeWdYc3M1cUMzMzF5elN6ZjFkM24z?=
 =?utf-8?B?b29IbERPRTRRcitBVjF1VHhWYmxKQm1wd0Q3OXpQeEVBbGZkVk1WNVZxSU5M?=
 =?utf-8?B?aW5zR01XVkhlMW8vNyt4Z0VpUUs5NjlVblZTL04vZmUrdjJjdFUxQVBzVVoy?=
 =?utf-8?B?Ymt6endBaFFpYWRaSHF5eGdVWit4bnJScHNHdkFpdUgvYWE3aFRoUUNMa3VW?=
 =?utf-8?B?M1Buc3kwL0FqTy9DOXJxYk9PUjFkdjBvcDRkY0p0Y1JKaVZ5aU9jbFduTzBX?=
 =?utf-8?B?d3FlZFB2U2pZeTRYSmRldkFIaE9CSElwY2VSd0dJTmJnUkpmNGdDUlNYU28y?=
 =?utf-8?B?ditXRCtTdUdNNHVvNllobWprYWhaWGNHQVNEbUxqRU03UUtxeGxaR1l3Sk9R?=
 =?utf-8?B?SXpOaytaKzltcThobDZhU2pENEFMeEt0eEpSOG9hL0V3UjdQUFd1ZUV6aGY0?=
 =?utf-8?B?QVlaN0VTMHA0by9wTTZlNGJYQzFzZURhblFKQnVSZ3B5U1NaQUs2R3h2YjVk?=
 =?utf-8?B?NkhqcWZJTWtsSTM2R1R2WTk4OHY3Zml1UjlPZzVRbnZWK3ZPQzJodW9ycEMr?=
 =?utf-8?B?U0FMVG4vaG1PRkxqbjdxc3kwZkJJOU9QQ3NieTNpVXF5UWRvU3lCNisxQ1Zu?=
 =?utf-8?B?Y3J0Mnh2bjR4QzlrWDNCVlowdjF0d3VIMTI1a2I1YXVNbGFCQ2JveWxTc2ZX?=
 =?utf-8?B?RTB3WDJBZWw4bnBjQlplZm80SXZNWlZmV0lQZ3MzQnlIbyttcFdDdFhvRDY5?=
 =?utf-8?B?QXVCNm9BNWJKWW1jR2FDMUVZMFI4ZTZMSEQwSW1VdGJvS1RKYU1mczFWREV1?=
 =?utf-8?B?NnZOWStWV2tnZGd1L3dhK2cvRk9Rc1dVTXlTcWJWZFJKUzJhOGJ4SWxCeXdF?=
 =?utf-8?B?SGlhbGRwSTFQYWcyQjFGbjNTS0h6bFZ3UjM3ZGM4Skkrcy9qR3FISDRKdDhv?=
 =?utf-8?B?VUxzWUNXdXlUWUZIb0tXYkU2QjlOYlVGaFJYUCtQN1RtQm1naEpCQ3Nnekhp?=
 =?utf-8?B?amUvUlF5bkVZZWplcDQzeDRiUklHbVowa24vNndzd08vNWtPS3VkSFQ3eUhh?=
 =?utf-8?B?dnQ0WDR1dWZYVDR5WjFJT1YrRnBhVW05THovQk85R0V6ODNBdHoxbEg3Z2Nt?=
 =?utf-8?B?Qk42RllIUDZLNVlMUWFvcG9hVGJRWFJzblR5cFFvL2paSHMzL2RJbFFPZm5L?=
 =?utf-8?B?U3JQazN0NjB2YU1hSDRIK2pOZDZJQUhFTXgvdFRSejdRREFCQzFKU1FNUW8x?=
 =?utf-8?B?VjdpdHV5RHpDelM3ZEcxZWdxOWpINjRsZTh4SUkrNHhiY2UzcUEvbjBNOUZY?=
 =?utf-8?B?NTdJM01VVXBab1dRUlZmWW9SOGplZkVSV0NkNXptMHExNGI2b21aQjFDcUZH?=
 =?utf-8?B?ZHRqVHErSzEzaGtKZCt6ZjVoRGd3bTY2M2N5WjFsZ2xxUkVORUsrSlZHZjBs?=
 =?utf-8?B?b3lIU05pdnZ6Wngwc1F2UWw3dDJIS3pManZ1U3l3eGQwaFQxcE9PcHNyMU4v?=
 =?utf-8?B?dmVoT3F1QzZzWi8wanV0VG1ZbXhlVkFmUXdPNFBFcWxtOTVNdDBvUUhwdXNW?=
 =?utf-8?B?d0tlZURhOEc4Nm5iSHdKcUtpK1kxNEEzTDNwODVRT1NMOTJ3UC9WaXlQWXA5?=
 =?utf-8?B?Z3FOZDdOTEFFRzlERlJqMzRNSzFETFpDa2dCaFAxU3lWejk4VDNYWm93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdwVzlGZ054NFBEZDJPaFoybW42NXBtcy9uU1U2d3dEUldPekhLT0FDcVZZ?=
 =?utf-8?B?TUVrNUgvQVFnaE5aenZBbktMYXcweWppUHNCazZPV01FWnhJa01LK2hSSnRu?=
 =?utf-8?B?cFNhbVRhdkgxQXJhT0ZsbVR4MHBKbTNmOXRNOG5hczhPTWtld3RLMXFOUnVT?=
 =?utf-8?B?M3hPYTVaR3N2NHBsZHFVNFN3aXFTTHdoUUZmcVlpd0E0TGJPL0h5MHdHcDVi?=
 =?utf-8?B?RGhMVlF4WVEzU1RnZm9pSFJsbkNJbGE1V2dIcVF0UC9hZHNzUHlIdCtjTWZD?=
 =?utf-8?B?QXZzU1FQOWJpR3JTbFU2UTZsTEpxTmN0ZWxnSUE4TkhJOWROMWYvOVNhZEtN?=
 =?utf-8?B?Z09pK2ZOQXVWaXdlRzM2SktKMnhaZllvUFQwa3AvRjhWWlZOTk1NcmJtQ01N?=
 =?utf-8?B?emIxb3Fyb2xWM05wclVUSWlabEtWUmRTMm5ZYUd1WjkreTc2a0hrbkVqb2tw?=
 =?utf-8?B?end5cm1uUm03US9aSWhrSGVoQ2dLK0VjTVQ4ZVpma2YrQWlpMjI3c3MzV2pU?=
 =?utf-8?B?eHBnSGVTNDd4OTYvVmtXRENTRUZ3OVNQeUcyYWVFUzVGcmlFSVB3LzZ6aXox?=
 =?utf-8?B?dlg0b1drTUlFa2lOQnRjSkVYZHNnbFovVkY0UXg3SzBEL1JpTTF5WHk5RzhE?=
 =?utf-8?B?eWJtV1dYZEQ5dTU3NEN0K09QeUhCU2VmQXI0Ulo3SG1oeHQ5TXpRcWZJaVFu?=
 =?utf-8?B?WHducGxBazRxbkdzTEZFdENBK1JHMGtkS3l5cXRGai80NmZZSS9kOXR5ODht?=
 =?utf-8?B?SmwyREhITGFhSGpaU1laRGx0TUQxNCswQnIyQVZreGhoZFV0aTdjRk1VQmtE?=
 =?utf-8?B?M3BOVzFrdzVDQVZRc0Qza0pDa2c1VU11QXFlQ2pnQXlpVG9JZ1RMUWpiVnlL?=
 =?utf-8?B?b0xrNFdXU3pzWW5HbmNXWEVWNWhqVCtIZXV4eDZmVm5WVktFRmk0SDkzUndq?=
 =?utf-8?B?ZlJMQTI3VGxHQ0xvb1FBc01aSDZody9lNmUyS3JVVElyVHg4emxYc3BGSEc5?=
 =?utf-8?B?U0JhWXVuT1MwYVZrV1diQ2JYRW5TeG82Qy9KendCblVEQkpLRVJGNGxLY2E4?=
 =?utf-8?B?VktBc0pxOWozRHVSd0NNeTNCcGFJM3FlR0hVdGRDYW15UFBjOHVCMlFObksv?=
 =?utf-8?B?cU5mckdZQmhxeFhHTFNxUkljOHZKQkxQU3NKM0o2N3A3Sk85WHlMT1ovcjAy?=
 =?utf-8?B?U2FGQVF2Q25DVDVVczJDVExwbE1DRDczNlFEZ1hMT2FqNkgxeTZ5ZjhpcWZM?=
 =?utf-8?B?OCsrMWE4ejhPSm9zckRMTnVpNWFMQVpNMjFUZWF1Zy8yRWlZU2s4OWF0cWpj?=
 =?utf-8?B?UmFlQ3JJdGxlSXEzaTB3bnJpcXp2SlNJT0lldU1PdmZ6RVBNNklPbm9KREFR?=
 =?utf-8?B?Mjlnd3dwNE00d1Z0NUZPTnBsclM0cEJjTEZEN0ltUjR5QW42eWpxdVYxMmxD?=
 =?utf-8?B?VXBxWW5aWEFVWk9PNmpzNS9NS1ZKWjlRSVJCNkxyMmloVUJ6WTJ0RnJzSkVW?=
 =?utf-8?B?bkM3SldrR3I5dmlkeEdiVGNlMVRzYzA0WVU3a0NMQmgrZ3RaZFNBQUREVzM2?=
 =?utf-8?B?R0VuK0VIcTJwSk4wMW5ZKzl3aC9Eay9zM09OMDFIaXAzS01WYndtai9LSSto?=
 =?utf-8?B?M28reDBOQ0NtR0crVGlFM1l5QTcvV1VybDhoSkhrTUJLSm1UaVZ1MVRkdFdM?=
 =?utf-8?B?YlZYRWY0R3RNdHN5QlRVb1c2Rlo1NG0reExGdm8wRFdvM0d2R0VTc1lXREk5?=
 =?utf-8?B?NVo4TWoxRkl0NFlRRXFNUVNJRGVVZHYyZ1VNUVc0NGRkS3IveDlBOUx4MHNr?=
 =?utf-8?B?Z1haTW5TTC9LM2ZQUjZRRXFyUDZxODNsQk5uSVVQeUE3OW9wYzZaWWR0aEVs?=
 =?utf-8?B?SzRWOHRnRWRRcVQrVjNHcXlpZjZwdjZGM0x5RWtEQ000MjlnVldhRngrZFpp?=
 =?utf-8?B?MGdxbXNoMllSQmZWeHRIRWJZaGtZeDM4RnBpVU1tUFZ6Q3l6S2xaMGl2N2ww?=
 =?utf-8?B?amNzOFhEOHhQeXdNVUhNdndMRkJ0Sk0rbFRncjY2Vnp2Z3hkaUJQM1FzVU1K?=
 =?utf-8?B?andoNU9Qb1hyaGpNUFVjZUFJWndIb29ibzFlSzZPUE9ZNnJ3UytBOHRzVnlE?=
 =?utf-8?Q?gmqlt8mP1I/AXnHUtD7IDRIQZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fdd360-ebfa-410d-e4b3-08dcedf5df85
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 15:19:05.3992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7AXmx/x0RzcOGbJ43Fu/1EsId16FQNwRBMS8WaO86JqkYre+Y519wPeiBgStV0oOX8qZQ/9s2iEii1N2JVoYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943
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



On 16/10/2024 8:12, Alistair Popple wrote:
> 
> Yonatan Maman <ymaman@nvidia.com> writes:
> 
>> From: Yonatan Maman <Ymaman@Nvidia.com>
>>
>> Enabling Peer-to-Peer DMA (P2P DMA) access in GPU-centric applications
>> is crucial for minimizing data transfer overhead (e.g., for RDMA use-
>> case).
>>
>> This change aims to enable that capability for Nouveau over HMM device
>> private pages. P2P DMA for private device pages allows the GPU to
>> directly exchange data with other devices (e.g., NICs) without needing
>> to traverse system RAM.
>>
>> To fully support Peer-to-Peer for device private pages, the following
>> changes are made:
>>
>>   - Introduce struct nouveau_dmem_hmm_p2p within struct nouveau_dmem
>>     to manage BAR1 PCI P2P memory. p2p_start_addr holds the virtual
>>     address allocated with pci_alloc_p2pmem(), and p2p_size represents
>>     the allocated size of the PCI P2P memory.
>>
>>   - nouveau_dmem_init - Ensure BAR1 accessibility and assign struct
>>     pages (PCI_P2P_PAGE) for all BAR1 pages. Introduce
>>     nouveau_alloc_bar1_pci_p2p_mem in nouveau_dmem to expose BAR1 for
>>     use as P2P memory via pci_p2pdma_add_resource and implement static
>>     allocation and assignment of struct pages using pci_alloc_p2pmem.
>>     This function will be called from nouveau_dmem_init, and failure
>>     triggers a warning message instead of driver failure.
>>
>>   - nouveau_dmem_fini - Ensure BAR1 PCI P2P memory is properly
>>     destroyed during driver cleanup. Introduce
>>     nouveau_destroy_bar1_pci_p2p_mem to handle freeing of PCI P2P
>>     memory associated with Nouveau BAR1. Modify nouveau_dmem_fini to
>>     call nouveau_destroy_bar1_pci_p2p_mem.
>>
>>   - Implement Nouveau `p2p_page` callback function - Implement BAR1
>>     mapping for the chunk using `io_mem_reserve` if no mapping exists.
>>     Retrieve the pre-allocated P2P virtual address and size from
>>     `hmm_p2p`. Calculate the page offset within BAR1 and return the
>>     corresponding P2P page.
>>
>> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
>> Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 117 ++++++++++++++++++++++++-
>>   1 file changed, 115 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 1a072568cef6..13fb8671f212 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -40,6 +40,9 @@
>>   #include <linux/hmm.h>
>>   #include <linux/memremap.h>
>>   #include <linux/migrate.h>
>> +#include <linux/pci-p2pdma.h>
>> +#include <nvkm/core/pci.h>
>> +
>>   
>>   /*
>>    * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
>> @@ -77,9 +80,15 @@ struct nouveau_dmem_migrate {
>>   	struct nouveau_channel *chan;
>>   };
>>   
>> +struct nouveau_dmem_hmm_p2p {
>> +	size_t p2p_size;
>> +	void *p2p_start_addr;
>> +};
>> +
>>   struct nouveau_dmem {
>>   	struct nouveau_drm *drm;
>>   	struct nouveau_dmem_migrate migrate;
>> +	struct nouveau_dmem_hmm_p2p hmm_p2p;
>>   	struct list_head chunks;
>>   	struct mutex mutex;
>>   	struct page *free_pages;
>> @@ -158,6 +167,61 @@ static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
>>   	return 0;
>>   }
>>   
>> +static int nouveau_dmem_bar1_mapping(struct nouveau_bo *nvbo,
>> +				     unsigned long long *bus_addr)
>> +{
>> +	int ret;
>> +	struct ttm_resource *mem = nvbo->bo.resource;
>> +
>> +	if (mem->bus.offset) {
>> +		*bus_addr = mem->bus.offset;
>> +		return 0;
>> +	}
>> +
>> +	if (PFN_UP(nvbo->bo.base.size) > PFN_UP(nvbo->bo.resource->size))
>> +		return -EINVAL;
>> +
>> +	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = nvbo->bo.bdev->funcs->io_mem_reserve(nvbo->bo.bdev, mem);
>> +	*bus_addr = mem->bus.offset;
>> +
>> +	ttm_bo_unreserve(&nvbo->bo);
>> +	return ret;
>> +}
>> +
>> +static struct page *nouveau_dmem_get_dma_page(struct page *private_page)
>> +{
>> +	int ret;
>> +	unsigned long long offset_in_chunk, offset_in_bar1;
>> +	unsigned long long chunk_bus_addr, page_bus_addr;
>> +	unsigned long long bar1_base_addr;
>> +	struct nouveau_drm *drm = page_to_drm(private_page);
>> +	struct nouveau_bo *nvbo = nouveau_page_to_chunk(private_page)->bo;
>> +	struct nvkm_device *nv_device = nvxx_device(drm);
>> +	void *p2p_start_addr = drm->dmem->hmm_p2p.p2p_start_addr;
>> +	size_t p2p_size = drm->dmem->hmm_p2p.p2p_size;
>> +
>> +	bar1_base_addr = nv_device->func->resource_addr(nv_device, 1);
>> +	offset_in_chunk =
>> +		(page_to_pfn(private_page) << PAGE_SHIFT) -
>> +		nouveau_page_to_chunk(private_page)->pagemap.range.start;
>> +
>> +	ret = nouveau_dmem_bar1_mapping(nvbo, &chunk_bus_addr);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	page_bus_addr = chunk_bus_addr + offset_in_chunk;
>> +	if (!p2p_size || page_bus_addr > bar1_base_addr + p2p_size ||
>> +	    page_bus_addr < bar1_base_addr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	offset_in_bar1 = page_bus_addr - bar1_base_addr;
>> +	return virt_to_page(p2p_start_addr + offset_in_bar1);
> 
> This conversion looks a bit complicated. Once you have page_bus_addr I
> think you can just return pfn_to_page(page_bus_addr >> PAGE_SHIFT)
> 

Agree, I will fix that (v2)

>> +}
>> +
>>   static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>   {
>>   	struct nouveau_drm *drm = page_to_drm(vmf->page);
>> @@ -219,8 +283,9 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>   }
>>   
>>   static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
>> -	.page_free		= nouveau_dmem_page_free,
>> -	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
>> +	.page_free		 = nouveau_dmem_page_free,
>> +	.migrate_to_ram		 = nouveau_dmem_migrate_to_ram,
>> +	.get_dma_page_for_device = nouveau_dmem_get_dma_page,
>>   };
>>   
>>   static int
>> @@ -413,14 +478,31 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>>   	kvfree(dma_addrs);
>>   }
>>   
>> +static void nouveau_destroy_bar1_pci_p2p_mem(struct nouveau_drm *drm,
>> +					     struct pci_dev *pdev,
>> +					     void *p2p_start_addr,
>> +					     size_t p2p_size)
>> +{
>> +	if (p2p_size)
>> +		pci_free_p2pmem(pdev, p2p_start_addr, p2p_size);
>> +
>> +	NV_INFO(drm, "PCI P2P memory freed(%p)\n", p2p_start_addr);
>> +}
>> +
>>   void
>>   nouveau_dmem_fini(struct nouveau_drm *drm)
>>   {
>>   	struct nouveau_dmem_chunk *chunk, *tmp;
>> +	struct nvkm_device *nv_device = nvxx_device(drm);
>>   
>>   	if (drm->dmem == NULL)
>>   		return;
>>   
>> +	nouveau_destroy_bar1_pci_p2p_mem(drm,
>> +					 nv_device->func->pci(nv_device)->pdev,
>> +					 drm->dmem->hmm_p2p.p2p_start_addr,
>> +					 drm->dmem->hmm_p2p.p2p_size);
>> +
>>   	mutex_lock(&drm->dmem->mutex);
>>   
>>   	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
>> @@ -586,10 +668,30 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
>>   	return -ENODEV;
>>   }
>>   
>> +static int nouveau_alloc_bar1_pci_p2p_mem(struct nouveau_drm *drm,
>> +					  struct pci_dev *pdev, size_t size,
>> +					  void **pp2p_start_addr,
>> +					  size_t *pp2p_size)
>> +{
>> +	int ret;
>> +
>> +	ret = pci_p2pdma_add_resource(pdev, 1, size, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*pp2p_start_addr = pci_alloc_p2pmem(pdev, size);
>> +	*pp2p_size = (*pp2p_start_addr) ? size : 0;
> 
> Why return the size here? Personally I think it would be clearer to have
> the caller directly initialise/clear whatever struct values it needs.
> 

Agree, I will fix that (v2)

>> +
>> +	NV_INFO(drm, "PCI P2P memory allocated(%p)\n", *pp2p_start_addr);
>> +	return 0;
>> +}
>> +
>>   void
>>   nouveau_dmem_init(struct nouveau_drm *drm)
>>   {
>>   	int ret;
>> +	struct nvkm_device *nv_device = nvxx_device(drm);
>> +	size_t bar1_size;
>>   
>>   	/* This only make sense on PASCAL or newer */
>>   	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_PASCAL)
>> @@ -610,6 +712,17 @@ nouveau_dmem_init(struct nouveau_drm *drm)
>>   		kfree(drm->dmem);
>>   		drm->dmem = NULL;
>>   	}
>> +
>> +	/* Expose BAR1 for HMM P2P Memory */
>> +	bar1_size = nv_device->func->resource_size(nv_device, 1);
>> +	ret = nouveau_alloc_bar1_pci_p2p_mem(drm,
>> +					     nv_device->func->pci(nv_device)->pdev,
>> +					     bar1_size,
>> +					     &drm->dmem->hmm_p2p.p2p_start_addr,
>> +					     &drm->dmem->hmm_p2p.p2p_size);
>> +	if (ret)
>> +		NV_WARN(drm,
>> +			"PCI P2P memory allocation failed, HMM P2P won't be supported\n");
>>   }
>>   
>>   static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
> 

