Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A0CC0A60
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786C910E1F6;
	Tue, 16 Dec 2025 02:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LinzrSRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011069.outbound.protection.outlook.com
 [40.93.194.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F08110E1F6;
 Tue, 16 Dec 2025 02:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFxSPiiqPwhezh2lG+vd1psNO7rjLlXfMp6vK5jqzyrGSVsBp9B2WeodQunbqmt/p74FcArml3TZ6MLyRssrSfhjN4e08xcaDwpoFQSNZJ38WqVOQ9fXOxmJ76qTGLKp9LBSuLwCOm+4E2qpqdVlM0h1rsLaymXy4jjgNVe3QjjmsYdxAgg/5QcFfzIqgQi4PZX+cc4XNcHxsnheTEi0Qlzn8FZIwCmzUfUw75K52bERFD4hAYB5sKUzfSTC6W2E2e0szABNccLTFl9VNA5p2w+cD/UJusHnEihAXHSOGIT79bJLeKYTMcjbyHEcMu4kgCbxOj3VsLsgvXHcsiw4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HvHn+nMReANh5u7EKU6Srx/+z1mCTQVaToiK7N4mVQ=;
 b=IcIG5rh9qnC0UCEzAd49i44yPC+CkcphpjC+nswTm1iiEUhmrXrhDcPR5BMLilM1Dk7tUtTagn6fmY2ikHlp2RlzmKN1k22k+own3RpSndS2FW/uvtWMLxEjq/mRxX5fcRreba5JWlTewK7oaao1XjEB3sdZja88W7AL7Gk4Ot5Ieuw+yYDBiDOTDWcBMuJI9f6kR7iPvjBig6ODCcPuOvHHXo/8T2oPjsdn5crKYHryOjusJiUVxcGLmfzf7abFQmynEg+zZOk3T5vPmzSfJ/lLMC0K89ewzeDNf1+Dewjsf5K6BqumEKs5faC2mQbX2jS3GieB0mXUpMgPEa101Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HvHn+nMReANh5u7EKU6Srx/+z1mCTQVaToiK7N4mVQ=;
 b=LinzrSRkTVeeM9aewi3wbV1NWbxHXqzkBKH2n50iuAzNbvi/C+IpPiUNiH9wckaWw3Kn+pu5/2A437Y5I9/mSRicVh1J8V2k35N37BSaQxEhw6rRFKMgq+GFDbyfJvvLYkB1zcuw4Pp5qRjj0DaD8gHCUflD76U1LlIfnwbiyrlinO6toDhmf9751o8X9XwH7buaqGPHhgV4UCCbLQ6vMgtYg+HYQB5aDbM11PIhydAeS96zdW4L1nQKOZstWvlOf4gi3YcsNWaf+Vf6GNwGr3nXHZnkscThNoMOV+umuXgyGxFyCyiQ7cJKE/Z7lQC3gYt9FG0AwD56sI/in4GoZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:57:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:57:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/4] gpu: nova-core: fixups for GSP message queue and
 bindings
Date: Tue, 16 Dec 2025 11:57:06 +0900
Message-Id: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILKQGkC/1WMQQ7CIBBFr9KwFgODbcWV9zAuKAx2FoIBQzRN7
 y5tYtIu38x/b2IZE2Fml2ZiCQtliqGCOjTMjiY8kJOrzEBAKyVIHmIx3NMHM3dWDycv+0ELZFV
 4JVwfdX+7Vx4pv2P6ru0il+s/A9tMkVxwoyUaj+j6ob2GQo7M0cYnWzoFtq7auVBdpdy5Exqs7
 8zOnef5BxVhp5vhAAAA
X-Change-ID: 20251121-nova-fixes-dc9b4f17b90e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b62c490-b9cf-42f6-ac50-08de3c4edaac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGFzV05vTXdPV1M2ZFJPcXBKYWdvQjdsd3NPYnJQdmFlbVpNRWFvNFRNcTRM?=
 =?utf-8?B?dnF5ZXB5V1A5bytQWTV6bWZYdmxTOE9vcElYek9FMGwvb2NISFJNNEpNRmZy?=
 =?utf-8?B?SCsvZ2ZRRFZzTFpvWTZ6WXBsbXFJMWVCWE5leGJvQkR3VUE4Nys4NzRzb2dM?=
 =?utf-8?B?R3JHQ2dIT29sZ0pFOTYwUkFGZFJnTnF5WmRJMVExL3dwdFF1SjlPMTEyNzl3?=
 =?utf-8?B?OHNGdm5saDgyQmZLQzFmTUtaOW5SUjBadjJyR2NXUkgydXcrVkZCaGtwMTNZ?=
 =?utf-8?B?aCs4VjB4bW5POXFkNWkzNGFRWlEwSjM3YVc5cTJhM09GemVmdytjRXduZjQ5?=
 =?utf-8?B?L29aRTFVcm1aczk3MUlqNExoOTRBRTlFeWphU21hbWhnSmhtWkd1VzY4V3pp?=
 =?utf-8?B?UDFPN3ZNSWVWWm4wSGNzeXBsdFZGYS9sZm5PTjB3eEZ1MFIvUXpkU1crRTN4?=
 =?utf-8?B?RXJzZ284ZUlOc0hudzRZakNueGVpcVUyQlhpaGl6aExTY0sra3ZuV0x2TkFQ?=
 =?utf-8?B?L3RJbDZQM3RVZm5IY0xQb0hCdmNZMHN6RytFV3VtdVR3eHlFL3BjY2FvMEx2?=
 =?utf-8?B?LzhYTTNEQVlNVDlWQWdFVjcrUkt1RHBaQngyNE9ZMEVsTXYxNlNMaU4yUkhM?=
 =?utf-8?B?U3VmNGc1SWIrR3p6ZmZxZzc2ZUpONWExS0Z2a0xLUTFqM202SGZCUWEyeHdJ?=
 =?utf-8?B?ajA4UkhrRkhBTlpva2drMjV3TXpHMDl5Y2dlR1JLejl1bmJINVFDTFdvcy8y?=
 =?utf-8?B?WTc4V0NFenBkbUZ1NDFxQWJheGtPOFFBdzN5Mi9EYzUrM25Hd2x3b3VFUmZi?=
 =?utf-8?B?czlzWU9kVjBsVEFmOGxCY012Umo2cFZoVzFVYjVlNmRpbDU2YWM0S2E5TlJx?=
 =?utf-8?B?Tk1kK2VqV3M1azFiUTM0VlgwOVdOeUZuQk9KTFk3WTJKZHpyQmtxWjREckFQ?=
 =?utf-8?B?bkh5Q0pTZTFVa1pyenF4WFBkTjF0NzZ4d2ZCL1BQdUQ3elRWd3pGSTVSOUsy?=
 =?utf-8?B?UUs0YTk5ZHBFRmpEQzlySGRkMzVOVFNRZDB2cmhMa3I3cDNubVlWQVhZVlkx?=
 =?utf-8?B?TkZQeUNCRVYzSWg2Y2ZHaVI2RXNCZm9lbHJtT3pzeTZQL0hGeVV5NmtJOTAr?=
 =?utf-8?B?Zi9nZEUzV3BMYThESTBjUmtqM0x4a05KNStPV1A0VDd5ajc1L0thQStzdjNQ?=
 =?utf-8?B?Q2JBS25IRGo3L3dSbmhJVTBHNVFPZ2FwUXl0MFFyUTNJemkrVVYzbWlTWmMv?=
 =?utf-8?B?UVNWOVdESzg0dGRSYUpNeVVzQUVwN1BOWFRLT0x3bzRmQlFyRHJqYVhRcFYw?=
 =?utf-8?B?N29kNnBJc25pL2FEYWZYYlhkWWpoblZOWWF0clk5c3NKcWlJaFAzblJvSE9v?=
 =?utf-8?B?a3dldnFtNDEwdWk1NkxUZU1zV1NRUS9wdHloQ05iK1JTeGRpblh3RGJtc3l1?=
 =?utf-8?B?Q09sNjNTZktCajMyUEVFSHhmWWJxeDJzcXpEc0o5a0xRT3p2aVJKZURYbkxC?=
 =?utf-8?B?OS85NUtTWVRKeFU3YWhsOVd4OWZ3MmNaNE9sMmdUTStnUUlBWERzZkdjVTV5?=
 =?utf-8?B?bGV2RWRMMUQrVFpQOW1OYmNkOUZ2Y2Rtb0JYLzhhdW1NNU9QUHBPSlNyS1V5?=
 =?utf-8?B?azJlWFNJbVdkUmZRWTUxS0p2eHpjaVB3ODJ5OXJ3ZWJERW9pZUV2Z3VXYm1Z?=
 =?utf-8?B?QnZtYWxmZmNpalZLRFBCdWhyVjdaVjFLZmxoQW9zd1JHQ1JBRWNGa3ZaQm05?=
 =?utf-8?B?bG1peVNSbmJBY242bWtISEI5eDUvN2pNRjdqcFgwQ2dhS24vUWE3SDFBZXQy?=
 =?utf-8?B?ZEVON0NkbHZycmtOazNyODA1QmsveVBpNmVhM0NQOXlWdENEbnRRMm43VTZz?=
 =?utf-8?B?eFA0dkFoQUpETHI5ZDNzWms0NnB2NWpTTnhGbUJyTEFIeWZFZVlCVi9rZlJZ?=
 =?utf-8?B?NXAxbys3TnBLQ1R1TndKVnNIN1dCdm1mNGw4RnZTVTNEa1JTUVROUllHRUNt?=
 =?utf-8?B?Z0lZL3NSNW4weW9vK29BSHBDbkFjZWN2ODFabEI2OURMa3JaNnFQVUUyNHQ1?=
 =?utf-8?Q?VumciA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmlqS3JkQy9ISDhNc2pobUNqZFQ0VjVZUWtacW1CR0V1eHkrSmxvNjBwWUJG?=
 =?utf-8?B?cEZkaDZydlRlaU9vMUU4aGRHMFhIWlFQOXNCVXc0VGVrTVRDa1NMS3VmdlhL?=
 =?utf-8?B?WUhFQkZaOTJwaHNHK1BlU09oQnJ6UFRNZURXR3piN3lRUWxJdnoxMmlNd29Q?=
 =?utf-8?B?YzNWMTdWQXFKbmRNMlY3cWF1cnd0U0hSK2liM28xNFFHUW40MzhTT3hNbWJ1?=
 =?utf-8?B?WFJoL0RCRDZJTzNEWU5KTG01Mnl5OEwxM1RIVU5iTnpzZHpYRnVnaTlRYzJt?=
 =?utf-8?B?OUc0aFdSSDBWQ2l4cmphZ3ArTnhFVTYrUisxNjhBZ0NLbW9VT2dtdUxYb3JJ?=
 =?utf-8?B?VTc0amtwSUNubG5sanNRTjdaQzkzVzdRWFVVTVpSOWxNVnJVaFBHcklJU210?=
 =?utf-8?B?dUlKdjV0R3FtbjgrbEhTN2FCekVSc0JyVEhGbTlBU3dBbzkrcEd3M1hOR1kx?=
 =?utf-8?B?WFJNbEdnWWxLVlFKV1piRnVMZ00yK3hIS2FZRWkyQ2dFK1hnWVR5eldUMFpj?=
 =?utf-8?B?bnc0V25HZGNNelc3TkZWeW9DRFpxbHBiUjJoaWx3T25TU2xwc0dacEJnbmtH?=
 =?utf-8?B?UlFKM1FvczVaTWdYT000ZXRrRkl1WTlDSjVzRjN4d3ZmQTJuc3JrU0oxMEMv?=
 =?utf-8?B?bHdqdWpEMlJpMkp2L2w1dk1NbUFIcTJ3RnpDSU42VWhUY0M4RVpqUmdDTUNY?=
 =?utf-8?B?UWFFaHFicEhjTU9yL0YwQVhrTlhjTVBXRHMzb0ViNXFMajRxeEl3NGlkKzJC?=
 =?utf-8?B?Z3Z4WXk1TTBxZGRpdlp1cndpTGdNdUhRaTdKQUx2elZZWS8xcFBUUmxBbG41?=
 =?utf-8?B?Sk9WOW1DZ0hyblh4Y0dEUkRmTVg1eUd4TVZJWGtlcjdkaXdOc1F5VERJQ010?=
 =?utf-8?B?K2NCYW9Udzl5cXo5N1lzL0V2aERocW1NaTdvMitJeXpUOGJwdzVMcEw5SUZY?=
 =?utf-8?B?YnZSSVBwZlRoUmdnV3NCMHZRNGVmNHg2eWhoTFZRV2Ivd0pWVVJFVTJIZDQv?=
 =?utf-8?B?Vy9pbjJIU0RTTFFoajF5UGFMNk5QRUxpZWswNHZMTGVGR0xibHNiWldmVEd4?=
 =?utf-8?B?N0JOV0NkNE16K05hWTJCc2JxM0NMMWppbUpyTUJSZE9zMnp4Y21mS3FKZDVZ?=
 =?utf-8?B?R1RTWnd3K2d6QTN5WGtwb3NPTUkrV2I3VXhRSEd0QTVqMms1c1FsZDVBbFRs?=
 =?utf-8?B?TTd6WGcrTlNVSVlHOXM1VmxRT2RNTkNjdzRISVprNDk2SnBHVHV0SVJCR2Rv?=
 =?utf-8?B?UU4xTkRrbXJacFR3WW9aUzdrNzI5Mzh0WkRuS0ZJdEdLVHB5VXRSVGU0dVpE?=
 =?utf-8?B?U2tmTDdyQmpldFBINDg1SXZxZDN2d1lQVk9jSlNnTGhtaHRZaW96ZTR0UkU1?=
 =?utf-8?B?allnWGpTUnNYMFd5aVB3ZFRYalVwR080MVBmcnVxTDBuNklwZVhqY2xrelp6?=
 =?utf-8?B?aGtoMEpSaVBKbHppZE0rOXJWdlBkMWxKK29OWkZNcUIydGdYOUtuQWdsUjVR?=
 =?utf-8?B?eitUU3hVNGdQWlgyckFSU3BRclM1N1pmdmpWcHl6NHhobkQ4SGt6MDUyQXI1?=
 =?utf-8?B?RU9LUUdHbWFzSGozTFRIaHY0TmxlaEdWN0JXQis5KytTYTlIZXZqcGpUb0F2?=
 =?utf-8?B?WWlEQzZYZDVqN09acGJEWEIwRlFaeGt1bkJyc2dmRTA1L3BOWmdOd0txV1VW?=
 =?utf-8?B?c1hucjFORkNqWGhVaGJvMVpqT1kxeVpFdmJlRzFIR2hSdUF0YlVIMzVJWGd5?=
 =?utf-8?B?S0M1ejcvcWl4NkQ4SHFBaU1JTXFXMHB6MU55bDRrYTZxMkgzdGR0VzkvWHBR?=
 =?utf-8?B?ZXAyU3dWYkRHUmNuZm1KYldVWFJvbTFRQ1g0N2tMKzdmb0I2dWwrQzg4dkRL?=
 =?utf-8?B?SDBRR2ZmMHJDMTQ4VFRWNzc2U2lqQTY0Q0ZkZ0Y0VkJQSCtYd3BUdm1ZOXNB?=
 =?utf-8?B?d21WRXp6OWRvOERxb0VnVjJ1Q0IxNlFCenRzNnF1ZGdOcTVlZkx4ekJUZHBV?=
 =?utf-8?B?cFJFaU4xamhoSTJuN2NCbGc2Vkorb3VlQ1IwdVdnWTNWdzRJTHVjZTkzUFh6?=
 =?utf-8?B?ZTNEU1EvQmNYMExRY2Q4blovYWEvbzFJN3NoUEY0R1VZWTdzZEpmWFJEZGor?=
 =?utf-8?B?ckFKMUg2T3o1eWxGNmFZTFRqSkczUEFQdHFYRlFTeWZPa01JQTgvQVRJWGNk?=
 =?utf-8?Q?Z93bumMXg92PfBz0J02LFwT35NZTqw4DzzleM36jXIIV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b62c490-b9cf-42f6-ac50-08de3c4edaac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:57:30.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqArYp33VOjTMqDa1dHh2HK2FswVVW5ZxE32uCQ9lAKPdClmxJbviswIOp/Mibw0a/NHYDm5VYTwWvM0WeIF5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

This series contains a few fixups for the recently merged GSP
command-queue code, by order of importance:

- Some explicit padding required to safely implement `AsBytes` was
  missing in the bindings,
- A bug in the received message length calculation results in the
  message handler being given more data than it should,
- `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
  bindings have not been updated for that,
- Some items in the bindings were referred to using the version module
  directly, instead of the alias we defined to limit the diff when we
  upgrade firmware versions.

All of them address "bugs" (with the first two fixing actual correctness
issues), but since Nova does not do much anyway, they are also not
absolutely critical. Other series planned for this cycle will depend on
them, so one way or the other it would be great to see them in
drm-rust-next.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Rebase on top of drm-rust-next.
- Add method to return the payload size of a message. (thanks Alistair!)
- Link to v2: https://patch.msgid.link/20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com

Changes in v2:
- Add missing "Fixes:" tags.
- Link to v1: https://lore.kernel.org/r/20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com

---
Alexandre Courbot (4):
      gpu: nova-core: bindings: add missing explicit padding
      gpu: nova-core: gsp: fix length of received messages
      gpu: nova-core: bindings: derive `MaybeZeroable`
      gpu: nova-core: gsp: replace firmware version with "bindings" alias

 drivers/gpu/nova-core/gsp/cmdq.rs                 |  10 ++-
 drivers/gpu/nova-core/gsp/fw.rs                   |  78 ++++++++--------
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 105 ++++++++++++----------
 4 files changed, 110 insertions(+), 94 deletions(-)
---
base-commit: 60c7398bded2e11f0db40a409a241b8be5910ee2
change-id: 20251121-nova-fixes-dc9b4f17b90e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

