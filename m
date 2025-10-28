Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A9C1556B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7985310E5D9;
	Tue, 28 Oct 2025 15:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qHHeBPW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4BE10E5E7;
 Tue, 28 Oct 2025 15:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCQVSrPCvv0Zc+OWOM3cCMNXyUpflTUh1KubFDL+IfeAf2/xMjKeTH612X70e2gLZ+XQCEcAoBiTfDpUHfsThRvZKRlPw3K5zIwZaXMVeu5zaFN5zdb2X/tZkonyWeq75p03+Y6Xym23AHATFDn71TT+llT66L2HutHBu25GT6Ds98e47GuWgCa4ibVt0vgm0C/aNn+wyYcWPO5kWAIacJhe5qo9oOtuxbssnpAIV7lQtFQpzx5mCotlOUDqLawDYM4vS8MZBw1KK3oi0YbqtFi9sQxtUeHT5AyZUH9L06MmFPi/zLNss3dct/9H1bSKyNFPP64zBO43QK2F7q9+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN4eY6j9NDqJEyWDUa0EF5bPY51KUkoMPHIJSTj45H8=;
 b=Wq/IQJk+ujdg34qo5o2QY0hYLz1zAcdnkzNKNyKE7259+rWkxbOBF66J5sJ2cg6G1dfa4AvTAsi3hRE2KXpyl6GH42loTEJvNHo01KV59AWgJEYyorvW/W3OWqt2ojNBW3etpHyADWN0b7l18OvLiSue2D0o9CgXdfMe55UiQIeAVwQJqNbPlRjLnzNIjlZm3dNMzMJLNkr1DWLcs1bFqpzmgMdWjYhcUc8CAL8m25DKMQgZ9fk92Xl6dHf1LslDdI9DC03+OHYJ+eUnR7x1YTSBC29LYixIfFbEtghP59DV6PHsMW382yjlcm+YkqG7YPSZx3h05ZeIZYILkOmazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN4eY6j9NDqJEyWDUa0EF5bPY51KUkoMPHIJSTj45H8=;
 b=qHHeBPW4tbmmfxjl0zE2YYoejxvBB0dVBG71KvZ8IanLNEpi40zI+VpzWbLS4iltY4NMHE3EAGDW899y0pCGUOlaMC9+N1tyJzcJVvqflFIwus03G+PqEQfE7bZlZYLeCxz0+WY6FteBGdZcvjJSiRRgg26Jx+NhPDzIkxQUpyutTHUGdhbo7F49OvjEcCa2al3B+Y2471qCqs7kb51X25xB/0zymmweq49z5WQFLzVd8ha5D07Uygp3k2Zys8nkZQsi2eAqZhLDR6gMIoGOkecgc3jnIJlVI99yAuzP5LbnN6tv6SvwUNJTz/fvw0pQVbba10YxWiWs2Y0d/i2Edg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 15:07:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:07:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 00:07:40 +0900
Subject: [PATCH 5/5] gpu: nova-core: vbios: use FromBytes for NpdeStruct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-vbios-frombytes-v1-5-ac441ebc1de3@nvidia.com>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: a5affee9-539a-4d34-7c77-08de1633c83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0hKUWgzbC9YYU9NRWhyV3Q4UFB3NjloUTloWDhwQ1BhcUdrbW1vbW1pdzVY?=
 =?utf-8?B?bUlBMzE2RUJ1RVRJZVhsSkNrN0l5QXhvSnF0RitMZXY1ZmVJbllUNkJRVU9I?=
 =?utf-8?B?aEQvNTd4RFpvNFN4QkRUM2dOWVcyK1Zzd2I4N2t6RDZMUmdnUVEvci9CaWFU?=
 =?utf-8?B?ZS96RWpETXlTdEhWbWlyK3p0VzQzajVzeGpNVGRydDFkaE9tS0xHaWhyQnpI?=
 =?utf-8?B?N1BUWitTaTVQSHQ2Nkk5K2daTEw5anRNOVR5K1A1Z0tiZHBURlFSNGorZEJO?=
 =?utf-8?B?Q2hTb2hpN0xHOGlRTnlURkZuM0RTNUl3RkR6VXhuNjMzb3VtVm42ZWtXNTNH?=
 =?utf-8?B?cEo0Vi9QM0pzWGpCZUVRNHlqMWhpRjVjN1lLRHErZjJiSEliWU02M01uNXRP?=
 =?utf-8?B?Nlk3R1JpQWZSYjl4cVVFY0c5SngyZUFQUUpXdCtmc2FKN1B1NnhSa01tOTNB?=
 =?utf-8?B?R0ZFVmhWQTZZUlRrTXVVUEFxa2taVy9wbWdSdGd5RnZhdXZNMFoza3dQOGxu?=
 =?utf-8?B?MVhia1hoTDFibERSL3NQaEpoczNBT2FhdC9vMEtQRWJLUVBEa2IrcUZ4TUJR?=
 =?utf-8?B?T2U1V08zQmNhWUYyUmJTLzR6ZVhVbktlYUZENGE5aUJGRmVuVWZHY2tRL3VL?=
 =?utf-8?B?WUY1eTVwdFRDMU55dGdIeGEwUnRBV2RORnFjTWZxWVBsUFh1Q0hvT1VaZFdX?=
 =?utf-8?B?Tnd1bUY0ZXNwN3pPL1hmZ2ZuL0hSeXZFS0hlTHVPZ2c1anBrZUxBbEkzRXpQ?=
 =?utf-8?B?YXZlUlJ1aUpWd1dlZkZIa1RxNjQrUy9jbHUxTUlFaXpLSGZFakhrWStqYkQz?=
 =?utf-8?B?eE14d29LTG5PcGNMU2c3OHEwQlMxNDF2OG1kSFlPRndydXJtREduR2dJa05X?=
 =?utf-8?B?eG94dEhjWFh2WEpRV2o0U2taNWlReWN1ZzU1K241VXFSb1NiWmVtZkRrNWFT?=
 =?utf-8?B?YjFkRkFBcms5dDk0S0lnTWxBR2tvWGNMREhXZnJyRWNwQkN6cnBuYy91alJv?=
 =?utf-8?B?UG15SitVRGNNZGpjei93UjdiUWpsSmp2ZXpmUmpWenN2Zyt4cHoxNE1wZ1cw?=
 =?utf-8?B?U1hlZ2RWdG1LeW4yU2RRcXdXMUhMeWl5czZCOFcwWDQrdlJlSXNDMFYvMlBQ?=
 =?utf-8?B?Z0VTQmhZdXBzMjJCS2pmeDRpODlqMG5FQUpXcHhNTFphVHpqZ0JaSXRmaVE2?=
 =?utf-8?B?bTA5alBqS3V0M0d5cm14YXFaZmpPMmhRSkF3NFpzZG4zYmZyZmFBOTJxTUps?=
 =?utf-8?B?OGN2Yml1UkoyeitiQWJ2cjdzU0xPWWhKUkdMREF3VzM2ODl3b0VwN05CRWF4?=
 =?utf-8?B?VnJWNy9rWE9FVXRaa21RNWd6cXJhMmpkbkwvOENpaWpUVXZHR0piL2xsNW1E?=
 =?utf-8?B?aGdPL3M1Rmk2d2ZrYitOMVptOXBrUjRPVjYyd0FvTWpwdkwzRkhGdEw4ZUxo?=
 =?utf-8?B?S21XZzIvQVlUSGdRVlZOMTBDbENjNlRWSjBZc1NPYWtPOWh0a0drTjhWL3pY?=
 =?utf-8?B?Wk9tSHV3V0dYOTREYmhZSmUrRjVpY0RVdy9aejRyVVczSnpxWE9iUWtnL2xr?=
 =?utf-8?B?bHZjOE5PNDZVSXdtQTRIcWp1Z1J0c3VEUFNTNXo1UytaREd3dUtKM0QwZFdp?=
 =?utf-8?B?eFJOMm9STnduZkRLSGRnRGcrenNRdVhmZklQczRmdGlTVDFHVGZXNUVKdHgw?=
 =?utf-8?B?bUhzRWZSMkdpdGQwWEFlZ3NJcFNFOFE1amI4L3J0NXhHaXQ0NG9DLzVZdHpF?=
 =?utf-8?B?VWpoMkhDVUhyc3hOeHlvc0VVVjhiaWJTRzZoWUtvMzhMclFqa0ZBZ3FGNDdR?=
 =?utf-8?B?ckFUVERwVWt2cHhodWl4U3Ztb3ZKTktGc1hkQ0dTUldGNWhZMmtkYzlSc2Vq?=
 =?utf-8?B?U3E0U3JRSGFxendUQkVER2FWdDdQcEE1Y2lodE11YVRUUWFRZHhydGNnQjMy?=
 =?utf-8?B?SGxtTU91Z0N5aVBkbzNzNDE2Uk5sOGVtbnc0cWxyc2RnNGMxYjAwNTYvZmZj?=
 =?utf-8?Q?k1gdkSoqqozsTyA60AMI04wwV6F3rE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFNBdUd6SHNtU0pjbVNNdzlCakM4SGtMYUE2cHdxeHhKUWlMNzJ3U2tkbXpa?=
 =?utf-8?B?VmpCMHJPRitNdExtYzBrUUN4Sy9oVFZHand2NzJmdWZmT1RPblBRTllldG5I?=
 =?utf-8?B?THhiMUM2dUo5QTVWNG1ic1MrVER6aEw5T1FwTUUxajhKblVzeHpQb3NnUDZN?=
 =?utf-8?B?Unowd2VZeFBKWS9mZHdXeC9LR041Q0ZxTGFxMlowd2E3VGE1NzhWQ0hsak1Z?=
 =?utf-8?B?d0xYRTFwYTJobG1BUVY0TWpwRnhDbWN2cFJyeGVFQU1BT0VrRkdaa2IwKzVX?=
 =?utf-8?B?M1drMFpyenh4bHVOQkwra3FicmJWZUFuQnlWYkE0cUxobkZ4UE4wS2NQRmxB?=
 =?utf-8?B?OTJhSm5sZTdJclNzN3QwYzBjWmNqYzFPWTM5NDlFemhia2J5Z1dKT05UZElZ?=
 =?utf-8?B?WmFEbHJuMGUyWlRmalFxUkxya0NHWjhGb1hjRU9RR20weHdOdnh2c3JDNFlS?=
 =?utf-8?B?Q1p1YUdBNi9RTkV3OGgzV1JTSEV5SlB1VHF5NUJuWDdVWHVkOHN3eVRVS2pE?=
 =?utf-8?B?QmIxdkZRQkZwbjBwRjJqYUh5VmY4K0VwNnU4U0pUTk1FOEJWQVMzcm1Bb3lJ?=
 =?utf-8?B?bEpicTUxZ080aXQrRFVpNm03WVFPRHlybHhNMG4rMHdsWFBUeE41ZW9ZcjlQ?=
 =?utf-8?B?cUZ0NGM2SSt1N0hXb3RpQllzbXRCS3ZEcmxCVU1Oc3gvMHBpUDdQY1lDRzll?=
 =?utf-8?B?SXFobkMzNEZzdHk3ZWhaZG5ra0xsUnRpRnhtdkVyM0dJZkM1QmtaVmVPaUZM?=
 =?utf-8?B?M0RyanZ1a2szZFdWWlZmK1lUZVZUUDBhTjFNZUZTRFhhTU9rRCtuT0NvWCtk?=
 =?utf-8?B?VWk0bWN1ZHRmZHIxeFArRTFTYkhRdS9CT3ZucHY0Qit6MFZ1S1Rwb3FSZGJp?=
 =?utf-8?B?eWdncE1BblB6ZkNYY051SlBQS1F4TnkySDBCbC9Yc1g1elRWaURrZUZZVVRh?=
 =?utf-8?B?VzBvV3ZBWXdqU1Zxb282Ymo5aTIwZWg4NG8zTHNpZVlRMnVVZ0Zqa2RqQlE1?=
 =?utf-8?B?WjdBRDk3emRLQVZIaDZPbkhxbmFaWjFqUkkyeWI2RExVbHJqYmUyTklla0R5?=
 =?utf-8?B?VHVPM2xkQWhkVHcybmt5aEpmRzQxd1pSRm1EamhYMVVDNTFodkV0UFhvY3hD?=
 =?utf-8?B?T0k4TWdKV0hKYks1NVorWGVrbGlKZzNXYlA0cVFjUjJWRHBxMVhBYW9Wd0Vv?=
 =?utf-8?B?YjhVMFljcWYyK2xKQWFpV0RwanZNV2I2ZytmQlpVOXN0ZUEwR3A5b0lXVzdH?=
 =?utf-8?B?UVM4WGFrWjhSSG5kZDhYcUYvVE5CT2YxdzBzcG1aWWkwSnJFa1RUc3pUVDA2?=
 =?utf-8?B?eTdKbGFDYVQ0MGJCNVJmVExmUkxORzRGY2lkWitxUmxWejZhZ3didFBKYlMz?=
 =?utf-8?B?RlRlY3JINlJZcWR4VEptVjd6bU80VWFVanNEL200cW5EUGFOKy9DVkpReGZj?=
 =?utf-8?B?KzVxUUdzUytTTzRJSFNta2RUSnI1NkdqcHR6VzNhRVliTVBTM2w4NE15ZFZL?=
 =?utf-8?B?SmJJZVA1REh1R1AwVTh0Vkx2UUlKbVlFSmROUVo3T3cyenpIVDg1YWRackQz?=
 =?utf-8?B?bjJ0Yyt2ODlDOGJGUUl1aHQvUU1rL3dvRUVWSmNZWG9Od0doelJpSEpHOFhp?=
 =?utf-8?B?NWVyVmtsNHIwa1BVSzJJTlllUmIwUHgvTDE0Nm03OG1lNng0aGc0bnltYlJD?=
 =?utf-8?B?MGxaR0orOFZld3JxbG80clVjTzdOSytwMzRpNXh5cklRYVlZMEh4azRUN3Bn?=
 =?utf-8?B?dXA3MG9FVzlRbmVNY2xLeGtKNnBscDZneTBEMCtWcjMwTndEcDN0a2tsbWti?=
 =?utf-8?B?YWFpOStNcW9ZS2s5NnlyQmdEYkkzaXRCTlNLNithbXFHd3RBZTdJQ0tUTVV1?=
 =?utf-8?B?VCt2WXJGVmhaMVJVdndtTE1hNXZmK2xCd1UxdzIxc2xFU3dDMWxHSEZzODlD?=
 =?utf-8?B?WDRwcE5UZFowYWFJZ3E5ZEowK05zOE1qMzdHLzJlaVR2cG1iODlKb1NQKzF6?=
 =?utf-8?B?OGJHeFJVaXZEQnVibGRjNDBCd1hqeSs3RkFRSGxNVCt5WFNlcXpYVkl5aXBp?=
 =?utf-8?B?YUh5RVNzRFJuNHQ5NkRUTUNHQkhXOHZlQnNLSVlMZ1BTblpIM1dGOVpBSEtS?=
 =?utf-8?B?TzAxMi9hWER4QmlnYkN2L3NNS1d5RENMQXZmaWUzeVdaejBMdkRKYlEvNUdm?=
 =?utf-8?Q?TGEP9ktc7F9Zf1g1lR4zo9DF6/Bqiu6Hqy7MtrFxAYw3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5affee9-539a-4d34-7c77-08de1633c83d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:07:59.3242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frftjXdhveqppNCQJF/aDZbK3Ai+sY9aUMdxRrx1CBjCHM44Mgn8bD2XTF43iEQ6v35MuuoISH1iJFoUieuVYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

Use `from_bytes_copy_prefix` to create `NpdeStruct` instead of building
it ourselves from the bytes stream. This lets us remove a few array
accesses and results in shorter code.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ade99c90dd3d..8d143df46ede 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -537,35 +537,29 @@ struct NpdeStruct {
     last_image: u8,
 }
 
+// SAFETY: all bit patterns are valid for `NpdeStruct`.
+unsafe impl FromBytes for NpdeStruct {}
+
 impl NpdeStruct {
     fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
-        if data.len() < core::mem::size_of::<Self>() {
-            dev_dbg!(dev, "Not enough data for NpdeStruct\n");
-            return None;
-        }
-
-        let mut signature = [0u8; 4];
-        signature.copy_from_slice(&data[0..4]);
+        let npde = NpdeStruct::from_bytes_copy_prefix(data)?.0;
 
         // Signature should be "NPDE" (0x4544504E).
-        if &signature != b"NPDE" {
-            dev_dbg!(dev, "Invalid signature for NpdeStruct: {:?}\n", signature);
+        if &npde.signature != b"NPDE" {
+            dev_dbg!(
+                dev,
+                "Invalid signature for NpdeStruct: {:?}\n",
+                npde.signature
+            );
             return None;
         }
 
-        let subimage_len = u16::from_le_bytes([data[8], data[9]]);
-        if subimage_len == 0 {
+        if npde.subimage_len == 0 {
             dev_dbg!(dev, "Invalid subimage length: 0\n");
             return None;
         }
 
-        Some(NpdeStruct {
-            signature,
-            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
-            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
-            subimage_len,
-            last_image: data[10],
-        })
+        Some(npde)
     }
 
     /// Check if this is the last image in the ROM.

-- 
2.51.0

