Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969CB96976F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518B10E3BE;
	Tue,  3 Sep 2024 08:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="DKo6Zlde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2075.outbound.protection.outlook.com [40.107.255.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE2F10E3AB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxUwp1yEyUK4EvgQBLmQydU5conZpMlQMisXkRqV0oKQ6s06Do3A1dBF8hzl23z/WmBnx0jJC7pqirQ6WDl+1poZOtlZYPvjunTGBwYQIsoYvG8Kfbbozg0VKAFT9uN9D7XBsaP3Lgbl65yQ1AFoKkiQiBOeRepfed2zKnHpfPhxRtStKA/RUgqQTARr7g3awiDJjVUP0BgHEGXKt+0I+H5cCT5RK+McwHQX+XZGAXew1dhLtjkrLq2KTEOr8CORs5Loqzxlexg6uBz2P3f85fTuXSTY+OJ9DwAxnzwdAabAhtVSfUWlfTrRO/SjSQ5nIsqlM0OKMdQv/8DxT5OlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIEQ3rlqzNJaqDoCL5uRxsy7PyfbHUkPJ0IE5caIGbk=;
 b=v97dTY+2fAGsKsxuqH32jPbAz05RyaQbSpTys4aqKdxoq2wFoCpY9WvhQT62EIL9AHwzt1qQHjJYeamLYSmxltUjhwYqbCyZhLnqzBhljim6nT21XCVtQLwV3Tv+G66J74mzOyrzMkQYTSeQrZU/gzPQqHscHmjVoSP357n1LQRNTSe3BCIwWXa2kuHxJO0AlWu4mwHC4oiiEQSfPynJl89zgukqZzfSvmVtX5A4RczEMsorZDr/nl+y/OoB5UJoBucxOj1DxzbQQ6E09J5Hj5t75Uj9hqMDlrGdayyOCYFtzd1RUOvHJX8xFdZJefH4UZ9Ok91mBGZIjXhM1CdXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIEQ3rlqzNJaqDoCL5uRxsy7PyfbHUkPJ0IE5caIGbk=;
 b=DKo6Zldeca6M9Gr6TObpIlaYiD92BMBwP8YEuS1CQpuIH14O33znoJAxmEYd23BBs/zUUdoNyfFwWc61EoGHnznr5kjlfq51Y6azMnM1Wjei/RV+4ytt+jNzySzknMM0QpvCoJi1neKQ8KpWk7Fn9Ut7EO2bfhTlFnLhIcDEU0t2UUBfLBhsDywkJtlCsi1hcQFLWVU7aOaA1TppFJ5bXTBTe6f73BYz+MnLBxXlsXllLJrrrQGZdYMauIQFZpT62EXDphVA6gTyxj34qP7ahb/a9hKL5QSXl7zkiKeGInu3rovytFC3KANM/x7IljL0UPdqt72tfo3US8Ecr8xORQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:42 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:42 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 2/7] udmabuf: change folios array from kmalloc to kvmalloc
Date: Tue,  3 Sep 2024 16:38:07 +0800
Message-ID: <20240903083818.3071759-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903083818.3071759-1-link@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b1f3b8-3626-4974-a4ef-08dccbf43bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2tTOEovcGFCeWFNK2NCbUlRUnVYR2pkNTYwUVBjNFVxb0FIcTZxY0h3VmFi?=
 =?utf-8?B?bDZYMVhVZ2lKc2pmZUY0MVFQMGJpaE90WjJBM0I4MS9TeEtpQW9TdngzQm9p?=
 =?utf-8?B?bUZ0UWxWcDF4cWZHYXl4L3RVUUdXeW55K3AwcVRNMzVIWEJQOG0yT2FDbTBz?=
 =?utf-8?B?OU5HZmlDdHEvaFFoSldZY0NQMXVrRHdQUFdSU210OTkyYkRtejZ6R0xLRGEv?=
 =?utf-8?B?OEI1SlM4dEhxcGdaMFFYMWZjdkh2UUhFMENDUE1OYityR2tPak56R3h0Q0oz?=
 =?utf-8?B?dGFLekhzeGZFNldWYUd4OUdZOWdVMXgwS1pGalJ2MUE1bVlYT2x3NEhBOVZt?=
 =?utf-8?B?aWVabE1mWHZkRHRIbGl1Z1hwQUwzellTUlA1RkRHa0FKaEtWaEdDK1N3TDB1?=
 =?utf-8?B?bUZiNW1tNm0vSHZKRHhYZnVLVVlpSEI2REVRRGNDVXdsRGhqZXdTL2R0TG16?=
 =?utf-8?B?ZEppU1lrY3VtVkhQcDZYT1ViT2xKN0pCcGo5dXR2YXlRZWh6U3JZVUdabDI3?=
 =?utf-8?B?RDFYQmZJM01wVVNTMnpSOFUyWDNtMjEybjBGcXRHOXlIa2VYcW1nN24rZzFi?=
 =?utf-8?B?Mm1NMFlIRTRod1BaOHI5Y3hiWEVhaWNBT0FFamU1VlJhQWwwVmMwM1hBOXU4?=
 =?utf-8?B?UnRSVlNKTHY4N1A5WS9UeGZLc0pRdEpzZk4vQXU1U1BnVURMb2JuUlR3MWw3?=
 =?utf-8?B?OWpXQ3JLOWt4MStKT0FySmttZHRhK2tlTDZpMDJhYlZCMmR6Q3N3TWl1YTkv?=
 =?utf-8?B?bG1ycVZvSVNjK1VoYlJ3VElQc3RSaSsvb05RUkZ2cVRNWXE5Wk9UYWRkcVNn?=
 =?utf-8?B?OW5FZGRHNFkvZytmdDRDU3FoMEE2NVBCVnpkYUw2d0FLOW95NlhaaGpZSWpz?=
 =?utf-8?B?SW9PVVF0UGY4dno1QzZ0S3VuSkVSWW9DUTZ3bndzN2E1Tkp6d3FaanFzK1I1?=
 =?utf-8?B?Nk9ydWh1ZGRHSkpmOURydnJhaWY2cTVSUEZ5aG1oOVU4WVlCalRzaTV0UEg0?=
 =?utf-8?B?WUEzQm5SYTQxUDNZZ0hvWVZLYXQwUWdtSGo2eGxHd0JHWkwrZjIxY0Q3RGlB?=
 =?utf-8?B?RGFNbEwwenYwRC9kcXFBWVg3Q1JQcVdWYjZoM1lMVkpRTHYxQmVRM28wd3A1?=
 =?utf-8?B?enlFdW1OTVpsUTAzZUtYR1pLdldhUlZSbXZKZEdNbEdFNGVFOHJsMm1HSjR3?=
 =?utf-8?B?YVQxVEdoR3dxZjQrNFBZZHNSajNqSUxsOUVRUzRGT1hRdDIrNzRkS2hmM2Ju?=
 =?utf-8?B?UGtvb2pnTktzUmx3RmpnVzBCSXVhVlI3Zit4dE5YRTFKRXM1VEo0cG5QSmsz?=
 =?utf-8?B?bzZtMVhWRGtXL3ZNV24yZjJxVEhMQnY5cE1vQWVJVWp6eExjVG1JTWxFSnlh?=
 =?utf-8?B?ek4vYUE2eXNVOWpKU2ZuenhwekRYdElmaTNnRkZPVWtScmtxdHFUYWJEUkZU?=
 =?utf-8?B?Mzl6UFFoSncxUXNpbXd5ZmRTbUlBVk1aOVJudFJPYnl6SG5kcVVTeE5ERUNF?=
 =?utf-8?B?aEx4NWErOER2alZWZ2o4eCt0M3I0ZDkrUVozQUNoV0FSOUNuek1UUG8wbVhm?=
 =?utf-8?B?MXNoSlFiT3dVc3VIYkVIMnFnK3VaNDBGRHlzK21CYVV4WEJvWXJxYWxPbXNO?=
 =?utf-8?B?SjFvY1J5MGN4SC9zRTEwODBqM045YzFZclI1VTlCUFhkRHRZNXNTazdGNGIv?=
 =?utf-8?B?VVNZbmdrdm95OHlPVllHN1dPUnhlcGEyK1B6ZmdrZllxQloyTWM5ekt2eWlM?=
 =?utf-8?B?UU9QTHlQQ2pmRlBhSFFDTjlkU3J3N0wzWi8xSnBSNk1xQkVaRU5wM0NPdXE4?=
 =?utf-8?B?aU1CNTNCcnFmL2FGTitQZUNQU0gzTGEwbEVhKzgyRlVwMFpjUGxlN29FcWhL?=
 =?utf-8?B?QXErK28yTjdQQTFUV0J2NXF5Z0h0R1VmNlVRY0JoTFVpU3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1VtZHV1bUc1cjg3cHlCNjJXNWd1OWJaM3pPOHNzMlJrZGp3OXJnSG1RTU5r?=
 =?utf-8?B?SzFabWtyUXo5OTN4Mml0dCtvaFg1eG5MUEI4V2pqUDNnbHB1emI2K1pJY3h2?=
 =?utf-8?B?U2VzSmdGaDhpUllYYjFKNXJXa0V0eHVJVWsrV0RyMUdWUWhlcFFhQVk3MlpD?=
 =?utf-8?B?cTAzTit2RExxd1A4TWVsQmxncVMxWXRIellTaXNpZVVjR3BhYWN4UUZwQlNL?=
 =?utf-8?B?cU0vdFpEd1crTVBsc3Q0amRFQzVUQXl3Rms1b2Nsakd6MDltR1pQVE5vdXVo?=
 =?utf-8?B?cFFVdWk5TFRJR29xdS9CSmRmRWlWYmJyN245UWlIUDR6RXFNLzgwUTVJQ0Z3?=
 =?utf-8?B?TVMwTk5vNmtzL1lzNEFrNHZIR3U5MFIwYWQxSmxLOE5aOWl2NzNwUGNBVnJs?=
 =?utf-8?B?RW43blRqMXN2R1lZbEVOblRta0RlL3phb3N4TXRFeXhqNWFteDhTOFVvMnhZ?=
 =?utf-8?B?MCswR2RvY2JQdTBCVlNvK2tsaVMxcHgvWUFMWG1JRW1sUngxektOWm9ab0l3?=
 =?utf-8?B?RnZVL2pPWjRaY0JMWmhkek1yZjZlRmtHYnk0VTZRbXRHUXFsWFhwSUZDcDNY?=
 =?utf-8?B?bGVSTUJJbFZaK0lmbkxJa0tvNG5ENmhwbE9Rb2dBQUszSUV1cERyZ0hISllp?=
 =?utf-8?B?eXo1MmRTRHp4Y2xyVm9ha1YzT0E1OHVzY3RVR3VSNWlHWWVqMzdWekJXY0ov?=
 =?utf-8?B?QXB4dkV6N29vaENBZTBGL1VvY1R4cU1YNDY0WG5TY1JqS1RyOWVreG9mcE9v?=
 =?utf-8?B?ZXRLTlVobnIxdzhnek5RZTA5Z0I2d3ZOZHNnNTZRdkxqOGEwSUhKVjZNcFRq?=
 =?utf-8?B?MkwzWjN2S0VuWTJxaUZ0WDZab0JacXdCR3JMK3IzVU1NZDlhbldzcUkzRXpr?=
 =?utf-8?B?Y3BOZ1FncldGYlRMVUZMMFFiUld6bHQrcHgzSTNqc01JbUtaaDhCQ3lESnAw?=
 =?utf-8?B?b09NUXhlQmVIempCQ2JoYnBsdlhuZ1ZqNGp2VVE0b3B5WFZPbVg3VG9KTVox?=
 =?utf-8?B?UXBVc2lucWpmanZLb1lzYWd6VTNtYXdvWkZ4YTdYSXd2Nk9mK2xNWkZoS25U?=
 =?utf-8?B?MlNvL2NFZnBjbEVMTThmRDJLbWVKN1Z4Y2NjdUUxeElKck5NcmtHa2F1K1I5?=
 =?utf-8?B?UWJUZ0dBS1VrSkh5V2RPYjcyVlNMZkNOZTdQaHNmMlRXLzhDdStPNjZJVXhz?=
 =?utf-8?B?bFlBK25nVmM2WDVWRCt2cUN4TlY5WTllMk1KdkhYeVVESGZyQXFKeGt6R2Fz?=
 =?utf-8?B?NksxeHgxSktlQVZTTm5BSm1lWnJ4OUNMMUI2V2JOS3BDWllWNDRBSDVPNFdv?=
 =?utf-8?B?c01QWVFyakNLMm92S1ozMDdQdDN1N0Q4M09nZmxkUGNrQXNNc2RvMG1jL3cv?=
 =?utf-8?B?ODJ5T1RWdFhjVlJFYmFCY212bWZjUHhVd2U2ZUxQWTY2STVCNTFrV0VSQ05V?=
 =?utf-8?B?U2I5MjBaa1JTQWlaeXo2RmJpTTdwQ05tZVU1dHhtaWNaWGVHTXlhRGg1QWhq?=
 =?utf-8?B?ZUVqdnFJT2xQd0FNMGRpR2NSUjBic2F1TGd4R0RmVXZJR1VNWk8ycUp0VG5R?=
 =?utf-8?B?SjV4blZ2TFRoYkYwczFkQ1hrWWpuLzdMZTVJSDh4L1lUVy9mZjQ0SEsvU3Ay?=
 =?utf-8?B?U09VZ2ljZFFYQzhmN2tUQWpvNmFHTDZxbFB4QndZL1g5MVMwb0ZxaWpZaUhz?=
 =?utf-8?B?WlZxa3dJb2NyZTJqcXluYmZDZXd5TUVqYStLS0JXWXc2WlFocC9hakVCNFFz?=
 =?utf-8?B?OTljdVpaeXdXb1EvZTFjNXcyQ29aRy85OVVYYi9Odm1jN3JacjdnSzFweDlQ?=
 =?utf-8?B?emxrMGcxWWF1VFg1QjlmNmd4N1g3TTFvNGZhOE45Z1ZsRkhRa05RRk5td1BY?=
 =?utf-8?B?SFhiZmZLOE01VEJwNEFTc3haVkRvdVVweUhIV3RXMk82SUk5VzJLUnM2Rm4y?=
 =?utf-8?B?U1EvWjUwVkhRMWNsTy9JcW1PNmxqeXpkajZXMzcvbnErYmhoNGRmMlp0RGNY?=
 =?utf-8?B?dVUrNHlWbHNSSndsNUdub2RKVHFNY3B0RHlUOTVSbU9OWFB3NGdMTk9UTVZy?=
 =?utf-8?B?enEra0k5N2hkbFNWQlpvNFlHT0krRFJVc0NyOWt1S1RFSW9QV2N3dXI0cEFy?=
 =?utf-8?Q?DIidlWnMD8mljpL8Dz3sKH7j5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b1f3b8-3626-4974-a4ef-08dccbf43bf6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:41.9549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dso8+b8AUVvpim3qBIORCPxeiASKu+ZoOqQQ3vlNwrqx2unnpJtbbe5i7h9dBRHnte/0RwRyIwyCF5IT9IL1ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
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

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 0a8c231a36e1..789fba312a68 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -111,7 +111,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -119,7 +119,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -227,8 +227,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -353,14 +353,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				 GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -374,7 +374,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -384,7 +384,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -413,7 +413,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -429,8 +429,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2

