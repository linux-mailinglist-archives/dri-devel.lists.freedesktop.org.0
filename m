Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66216AAE16B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A80310E7ED;
	Wed,  7 May 2025 13:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o+EKIyqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AD510E7EF;
 Wed,  7 May 2025 13:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIL4YnCvE9+mHElvZ+yV2fhCvTOa0b8oUzNns9zn0+Dim6pGxu8IvnIeQWlaYyjcwo+bGwGORUe1ccGx0uo2NrNsp6WOUIO/NAiD5iMzzMsdjVjP9eH3ehKuQn4ys/0H8UPj4I/TmSsu63pVRIKd5Yw2uqOrlK/oHbjS1FDfoCfQHj3kax3UUnnjRQ9cwhB8qeEQ0Xb35MMOmKjkijloT7B4CQGwQmh4nD9FjY35wyi1hGZY8DI6q0tiZc1nqsB/c3n6Wp2pnnigr8l28vUMU1OiS9xAgtHfEyl4z0w8MreI2+k2u87X8bAX7xEA8ysLfQKrj7wuz89h+v8647gDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn7YAf0dFUP9a6F5kqkqxt+OLyKHrlVeCiqy7FMvIa8=;
 b=I5IbbZ3tvbqQ0LjDwbUZgE045RIrbMWGr3JxdtBJNvJEWszvsxkJuQtv61DJ84FuMzPTQZDzIC7zuvFwS0shGuPTcQl6CHASSGd5Qk9JT2HIl5vLdOSXJcNY3KtGucIWmFtT2jFruEqGM8BPRmng4NCJa6PNTZUSy68yp/udAhG2NssAEoU7ftUnBPsZbduna4yDXbv+sNTybAMUmMPbJIptEXOBYA9y9O7VqlfnqeetiY2tRvOWr7WZ/+d+JKXraII1zhdo28KdWVGf6SIu0REivyAb8W2PF5/d9z45hnERJtBv5ZgxpVL3bq96awivw6qok0vNIwViz7/YTBmaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sn7YAf0dFUP9a6F5kqkqxt+OLyKHrlVeCiqy7FMvIa8=;
 b=o+EKIyqK2C5fNRLVWBb0jMOf3k4RuPDdPSSah6A0D93RVA1D/KVEAcQN4vagB6TpWYRbLvCWmsblJESn8cMJAYKI1HUFwdhONSYCqoEkxR2JbZhengSSHeIjGCpLtapaUh1Fj/SVS6NQCrBfkS+mBzkYAMoL5DDjynvfTEwyWcPdKt9JgPl9RuBKUIuQZo0tfdtA1ylJ6ugz2SK3Z0M3usv8xNa0WGE0DZ1RV2V2tyIhi8Zp9jRUa7AIEFnZxgay0gMqGVJ1XBbAG4pEIvcW5Z9SfHJellftaAMXDdqrKVtiX0oxBZvUGaNstziaVwL1A0CXDXoPpKPfTJywyGO8nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:39 +0900
Subject: [PATCH v3 12/19] gpu: nova-core: add helper function to wait on
 condition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-12-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS7P301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: a602d99d-27b3-4651-86cc-08dd8d6e89be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXRvMS9RTjdBMENRNjZxL2paQ3FjZ20xZGxEQjg4ZHZEY0hienhDT1RBMzRJ?=
 =?utf-8?B?Kzc1b2JvTmFJbXAraE1CM3RQOXo2N3Znam9Zbkx3ZFBiakYrZC9rQlFqYW9t?=
 =?utf-8?B?anBLOWRPUGl3bDZZdWJNYXFyYjRtN2dGNUVWd2tnZnNjejdnVTFzNUFnYTlh?=
 =?utf-8?B?alBvWmZ3cWszRnpiVUIyTml3M21rUitPNURjem5TRUZkaUtJUm5MTWFrakMv?=
 =?utf-8?B?MzNxZFhCQXZ5ZmptSDBXelY1T21FRzJOcWpUWXhyUmZkSEN0cEtwSHJZL2F0?=
 =?utf-8?B?SXI2bHVDL1gwYWxsbkluVUdTUjVkaS90WUxtQXhSN0dKem93SXcvZHczY2JE?=
 =?utf-8?B?em5VTSsrUVJsbU51WTZySGZaY0YxbndpWFRPaENLcU9USk1qbUxzTDJ3dysv?=
 =?utf-8?B?R0o4cm5teEc1MHZxOFNlOHJmcUQ1Z1YwWWRCS0lrY21jVTVTVUYzQmJqcEtZ?=
 =?utf-8?B?SzZ2c0ZlUGxhUlQ3YXZVc3g5RDFyblEzQXBsbTY1elo4b2g1R1M1NU9kOUQx?=
 =?utf-8?B?NUZoZTgzQnJwc1lQQW1YVUhrOENvbmdpNzN5eCtVc0F4WU90ZER0L2VTdFFE?=
 =?utf-8?B?NE5NTnh0SC91eFU0cERwMWJoRkttbzQxVVZHS3p5WlVjWmd5NHE1UTB2NmZj?=
 =?utf-8?B?MWxmRHlZRDRPdUdkQXF0ZTdnOC9XRUoyZ0xpSjd5RHFuczdPZmloOGRkNUx0?=
 =?utf-8?B?ekMrTitkRmI0MkYvaHRXMlpYUmI5TlNvbVNBM1V3REN5QUxYUmZ0YWprVG5U?=
 =?utf-8?B?MXcvZTZlUDVLemRIVGVubGJZYXlCU1k2SnNxMnZtdW1veVNaT1Fpbm1LTGxx?=
 =?utf-8?B?ZE8ycUdDVk5KVjNXRUNyUEtjMjNEYng0cVpWL3l4SDRjU3pCMXZYeThHamt2?=
 =?utf-8?B?OG8xajgrYWExc1pBYVNrZDRsSUI1RDlPYTh4SHAyL1czVE5adXJwUzI1emxz?=
 =?utf-8?B?RFFNbUU3eThqQWZWTjlwR0FURXBZekgvUGlpU01lQVNMbHFZeGVLWmhJNFdw?=
 =?utf-8?B?a285L2lxSHF4OXRrRkNWc3BzVHFyM2lNSHZyZ3hYazNseDg5aFhwYis4ZDEx?=
 =?utf-8?B?VEdjQ1dUQlFlRHM3UGtJMDR4YXk1NTVvc21TVjV3LzFaeHlZTUMwSnVwc3NW?=
 =?utf-8?B?em4yc0ZWb0ZQS2ZHUElycEY5NXp5QWlHVk9CbGtmV1c3VWswOVJrU2FXSCs0?=
 =?utf-8?B?cHprb0g1a08rTkhtK3dzZmM3Q2p3N0xLQnF6SnlZeE1PbUFnZ01CeTVIQm5n?=
 =?utf-8?B?Z3ZoVkdMK2dyUEdzdlg3eldtay9BQlVoNHp5NVR3YzJ0ZERlSUJmcVpXTk5m?=
 =?utf-8?B?Q1ZrY3h6RGw1YUNvU3hEd2FabEVTQ1duSjZQeGp1Z2QrT0NBYUFMWFVBRE45?=
 =?utf-8?B?cElnaXFOREt0ZVBpWkdpTGF5aTNoNUFUaHBJWXB6cHpQdkJEZTQ4RlhMdmRh?=
 =?utf-8?B?SG5NbkpReUVweWErWllrbTVFNjdFc29XbXFOZ3BURTBxYXZRcFdpektHc2ZC?=
 =?utf-8?B?dkJKZXNDeDlJRGFGTXpaL0dSTjNFNE45bGdrNjUwM2hCTzBJVi9CSldCak1p?=
 =?utf-8?B?TEdUVFFLVlFjd1JrUldVTFdaYmhZNllJemYrek1qVHR2MXVJeG1lbXJ5Sy84?=
 =?utf-8?B?ZDFqTUZHb1JwT0RJaTQvVzhEQ2RVQkJtakJCb3BWODNCOXRCNkNOU0lnR2Jv?=
 =?utf-8?B?czJhQmVLeS9iTWQ2SUF5dWszYktRa25rSHlYMUNoeDlVM3IrTDRRQmZvVTc4?=
 =?utf-8?B?TmhXbDZkY2J4cmtkQ1NDNTEzTWpUZkNFSUZ5TG1DejVseHBoTEp3MGtNRU9a?=
 =?utf-8?B?aHBxeXlEaXBETHFtS0x0WnhJUjRKTCtCejU2Y0pqRXFnOEd2L0JHeEY2TkdF?=
 =?utf-8?B?Y1B2VTlzaFlrcFR3ZHVQRWpmNnRWbXBiU3lYUnpOUHVjZzZQYzZhT1p5Nldq?=
 =?utf-8?B?cE9CMDIxRlBCcktUTDRWcDAxNmdPNkdsNzZrNkRXaGc0YjR1ZmZ1clpzaE5X?=
 =?utf-8?B?UlZ0d29ZZi9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUMrR09SWlBzYUN5WXhEZ0VYMGFOS3VxZE5oclBQeWZodVI2cFpsRkczUUtY?=
 =?utf-8?B?cVhENTZTbGpvd0xSQlZ2SmhUbVc0NitnZUEvK0lkVEI5V3Z3NWZXMit3Vnht?=
 =?utf-8?B?NFZGRm83bUI4cVpsS3RaZzlaZC9ubzBYaVFPTzZUWllYcjUxZFVrakVJd0Jw?=
 =?utf-8?B?d0hiaUdyN2cvd0E0aDlJcVNTbVZ2NzRyRjhtVGZJNGxVaTJudisrR2JVcWJB?=
 =?utf-8?B?Ry9LbGg0bmxMOHZwMzBTekJGbTVYUWxyZnRuTmN4Yk55WExkMFZoZUYxcjV2?=
 =?utf-8?B?MWRML01NcXNNYXpwL3B2cld6S3hNdHlVRUVXcEpiMVNHZ0lib3hTUGdHbTNj?=
 =?utf-8?B?VlZUbjEvU1FiRXlFd0p1eW5mTk5rbHlkMkhKRWE3Uy9nVmVwVmwzeE1CT1ls?=
 =?utf-8?B?UHBCVTRVQmRlMVFYSVFHVHRUY1NMYmVBb0QxZURSbUp5SDF1bkRCaHR5aHI0?=
 =?utf-8?B?QmlaYmZRZDhZZlpKa2pyYTQzSVQ5Vjg0TzJyMGdOZk9wZ2tCSzBBZ3QzQjky?=
 =?utf-8?B?Nk1xSWtDUkFrWXBFZzJIUEhzNTRCRmUvZGgvV3RIM1RPSUlvQVhVcHgyamVh?=
 =?utf-8?B?VEJ1dlBJK1RibXdLOUgzcSt5QXFURUw5VCtQWE5pL21DVmVROTY0b250dG5X?=
 =?utf-8?B?cWZycGpld1VZc1VlbytXNkJhYlk1eUpNMWZqR2p0MnJucFpsZFZKN3ZHVHF1?=
 =?utf-8?B?YmxVci9vb2tJTy9XNkkzSnVCN0R5Y3VaekJRVCtic3RoaUNDbGQ2UXU0VDVW?=
 =?utf-8?B?WXFHbmcvZ2J4NkRKTERyUDh5NU9Ea2hWOUhSY3Nic21TdkdTK29helNDN3g4?=
 =?utf-8?B?Qm9ZekZMRmFlV0JyRzJ2dy9Hc1M4aXhrQWZueHVvb0hmbkVESWliR1pPM3lq?=
 =?utf-8?B?ckRObGJ6K1RWM3llUnhwbk5PS1NvYnpHWFFJV21YY0E5ZmtlRkRyQ1N3NGtt?=
 =?utf-8?B?OEkyT1RocG54VzJHRTdoeVdEUUJNdnpVMUEwVjgra05KeElxS2lncmhwYTU3?=
 =?utf-8?B?dEFJTy9BSU1DSFVhTG0raEJBVU1ZSzByRXBBOHRINTlhbEpkN1RSbEdGdHp6?=
 =?utf-8?B?WHhaNUozUzJndnFxSEpVTGl6VkgvTnlWM2wzeVY2c2Z6SHhTWG84YjdGTnI3?=
 =?utf-8?B?ejkwN0hFNWdhcWl5ZkgxUEFlUlZ0OVZkTFJNb1AyM1p0T1RWQXF0QThwd2ZQ?=
 =?utf-8?B?bnlmd1FrS1RIS1pxWXhRWDR5MElkQy9OT1J4cTRYdk82VmJMSmJ0NWNRVFVL?=
 =?utf-8?B?OS9QREVacXRNZkJLWkRTU3VJZ1p1Q25Cc0loR0xxSGJHUmdEaHJkcFdSYkFH?=
 =?utf-8?B?R0JxdXd6emlWTGp5QjFiZ1pvZ1dDWW5wR3p0NmUyZHI2d3d4TjJoRFJsbjVQ?=
 =?utf-8?B?a21FcjcwY1lZZ0Y5ckVNTENhNWtGbE85TWp4dlNCSXVCbWIyU0NsVi9vQnZ1?=
 =?utf-8?B?UmVRa3FJdldDT2hXa2w4ODREQVZXaHcvcm9PODczc0xEOW1qeTJVa3JRMnF0?=
 =?utf-8?B?QTQ4NDZLZ3lXOVJmS2E5VEFaK2l6Q1Y1eVpPRUpKeG1BRWVGZDJFeFd0U3Nr?=
 =?utf-8?B?enVSc0c5Yk9INUtsMVFtUmNMSzljdEFxTjJZcDE1UTRJRnZVWTRRVEp5dnpw?=
 =?utf-8?B?eStDQjVoT2k2ZkxYYUl0QmxWNE5YWEJTemU3YmlaMGxmN3ZORDhWQUg4Tklt?=
 =?utf-8?B?VTRxNU1FTktaZVRxK24rTzJUeC9uRW5XdlRzbXJuQzZVMnlQSVdaL3lNZkNk?=
 =?utf-8?B?QXFUdFAzV3VBbEs3NjJuSURMWk8yNW9HMEZwZG1wQ0h3RldMcDFIa0ZRMjRM?=
 =?utf-8?B?L1NLM1BxWmk0UTdIUlR2UVJpL3RGY1hKRnJvTmhKbE1BVGVUMytBRWFpeEtR?=
 =?utf-8?B?Ym11bXp1azJiaG1heG1HMjhKaFYrTVUvcmFhQ3Q0ekZvYkMzWEJBR3FDVUpY?=
 =?utf-8?B?bytLaVNVdzJUTXk5NnV0YWEwbDVwQVQ5L29mZGx4R3dERHd6a1lmRXdpZ1hI?=
 =?utf-8?B?VHJ0UGtNRGVQd3hJeGU1MXJrdUQxV1NOR3VHb2gyWVBjNjJDbnpZWFBvdFpH?=
 =?utf-8?B?OWxKRy9oSEdqVmVaYUZpL25GY05ocnNGNEZVSlBKVitGNXp3VXREZVkzdUE4?=
 =?utf-8?B?ZkVBcFlTR0s3WU1zVUpTbzNxRWEwbHB3K2E5ODlzL2pOb0srck1SSU1IS0ts?=
 =?utf-8?Q?nKqqK4j2op2x7UuBgKHXhvJA/XbaiEdMk6d1XnV4Hn6Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a602d99d-27b3-4651-86cc-08dd8d6e89be
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:25.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94PTbx54BBszc4B8II6p1NnS/66F41DiGV5jqrAfqKokZuL/souSNbjDVS1lw3eWsGlWDibYdMsFz2abOzneQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

While programming the hardware, we frequently need to busy-wait until
a condition (like a given bit of a register to switch value) happens.

Add a basic `wait_on` helper function to wait on such conditions
expressed as a closure, with a timeout argument.

This is temporary as we will switch to `read_poll_timeout` [1] once it
is available.

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/util.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 332a64cfc6a9d7d787fbdc228887c0be53a97160..afb525228431a2645afe7bb34988e9537757b1d7 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::time::Duration;
+
+use kernel::prelude::*;
+use kernel::time::Ktime;
+
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
     let mut dst = [0; N];
@@ -19,3 +24,28 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
         Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
     }
 }
+
+/// Wait until `cond` is true or `timeout` elapsed.
+///
+/// When `cond` evaluates to `Some`, its return value is returned.
+///
+/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+/// `Some`.
+///
+/// TODO: replace with `read_poll_timeout` once it is available.
+/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+#[expect(dead_code)]
+pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
+    let start_time = Ktime::ktime_get();
+
+    loop {
+        if let Some(ret) = cond() {
+            return Ok(ret);
+        }
+
+        let cur_time = Ktime::ktime_get();
+        if (cur_time - start_time).to_ns() > timeout.as_nanos() as i64 {
+            return Err(ETIMEDOUT);
+        }
+    }
+}

-- 
2.49.0

