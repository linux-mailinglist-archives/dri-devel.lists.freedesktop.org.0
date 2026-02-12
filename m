Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G4eB2BzjWn42gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C060112AB4B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15E610E6F2;
	Thu, 12 Feb 2026 06:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uFYsKx4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527D810E6E0;
 Thu, 12 Feb 2026 06:29:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ko5PC3ayXud7Mv1mnxKMu8v8lIt9W4avsiJZ0kRLuv7GDFTksFU6VtNhCp9o77wW9hQ2MNZV1xI7U8iG6YJaYfYRUbx+sEc7B9WiVqqI9afgvNiSEaey6gPFS41WYJs5DsAZ2mSbpy/6ZHp7lEbpzvmvH1mWg5Xd0+vGH53Kv+O3yQjYmkTOAq7IDLDEcQDDugTA0nRpFsqBzYJWyTVbms0QV1Xyf+6bw4PZ4YcONPazG7BkQ0c17HFBohwnY1VGtpU8MXMDnlkULKPUQw9KUHApvjhEUaAgUykhOBOOogKyW7Hti4e8UbArD748+fQuHJz7LMYYBJ7ezH5aNNcMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NKdionLhfN8pC2qJu+ZMKpkfK0Ksiz7eKaedbhIWHo=;
 b=fYMDufYJJ+AoK21Vt4WjZQ2ttIBfDWe03VpmB+4LWm2t49K1MHnuaB+Ie2XlG6g64ZwchNDFhBNbZJ2zyTCurgH18kxrDY9d712NmFtnckEzkLptLbC87CdCsYKwk04dkTNLuvdw6Ci/e7m8wnffXFHrUHoXDtcOxdv79kyJTspH7+W6Vyh/ch5n41vpA+N4duq72gJ1cz4uWHFUEZg9qBo2bpd9igCD8D59uAPKW2+1pWudMVlIsCsY4bzSFl/9OKmoFiKbFzU4jgwDwW9UHX/A57Fn8zRX4GVHOBPSMXAJlJy1bjT5PU0ghFLjB3AjhkUIkpvx8Zq3KR2AVskkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NKdionLhfN8pC2qJu+ZMKpkfK0Ksiz7eKaedbhIWHo=;
 b=uFYsKx4wNtCcwYa4d73q8OFov2n2e9E8Z52TDiSAtW3NGJPwN6sfmiTLZfVC3tqTrQ1DaPNiU92EXIPHRsG2gRXFg5zpydWUCBqerDMUZl9e2IsD+QKpO0xTHTuHcrlASEETh6MHWscZ3J4CEy/cwi7D8/7KUV2Kdecx/KVt9JV/kMgpHJTsCy7ltyp3hIIeyrluLSmRyZAFX0FVIqZKP7cFN4SlAsbodnrpx0HyR6BmNbI77YOanur9Z5It+N6dt03FEHL7GktG/QICEPv96QGftqSlY/k82rdESGM1abB1C0xXzAeiJptVjlJT+/+ZqF5jzCMmXJYv/KMC2dtKIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:29:45 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:45 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:05 +0900
Subject: [PATCH 3/7] gpu: nova-core: gsp: add checking oversized commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-3-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: ad17e958-0588-43e4-3f08-08de6a001d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk9KNVpmMTFuQTg1MVpOWVZwbHVvNVlvcDJ4bG9hdDU1TEhVaWxNVXJucjJP?=
 =?utf-8?B?ZkZkbCtsT0d2OWVVYmM2Zndla0gzWk11UUxQUENhQk1iSFBhNDB3UUZ3dDNB?=
 =?utf-8?B?dEtGWDNhNUdoV25heUYva2NJUHc0Y2Jtak50TmVKNmlubkkwaGNRb2lrSkor?=
 =?utf-8?B?MnRCYmUycitkTi9GYXN4VTZ3V1dNSmFhdlRjc1dKbGgvM2V2NlllbzBLdjRJ?=
 =?utf-8?B?OFVwbzdWN2tuMnFVci9vMW8xeWdtdmU0UE1GNDkrNFVPTjZqeDk3QUpGZXlW?=
 =?utf-8?B?UnMxYmw1V0U4eUNqU0lVcStCSXpNRGNQeFNPMExOSDBCQk5zam0xL090ZGdU?=
 =?utf-8?B?bkpZZzFLbk5CdnNtaE9YQmlSOTRoWmllbkg5MWI2MnBhWnhGUkxOenJOanZM?=
 =?utf-8?B?eW5STGo2MERKc01sS1hTZlpxMHFBdnBxd0ZQZER5eHNsektibThIaUV2VlVW?=
 =?utf-8?B?RE5GR2FRTVNKajNQZUJYUVo2OWxnZkEyWk5BQWpEdy80blVhdVVRVWNCc3Vr?=
 =?utf-8?B?MWlnNDlVK09aRFhMYVk5T0ttakRncEZPZzlhMGVFVmJ3cExxNWxRcTA2VVZp?=
 =?utf-8?B?VHo3eVFQb0FTZzZ5NkFjV0EzS3hKUU5WTnNTOG1kYnZqSEVwL0ZOL2pjS1Rt?=
 =?utf-8?B?d0VWOEZWQzI2cGFWZG1rN1p3ZFV5Nm1WcWxkUGNSVUhROEMzeFRwNjFTT09V?=
 =?utf-8?B?QUZpTUczNlhoVU44Z1I5RUc2a2dhNWhqRDdkQnJnNEUxSlY3MjJEMUFTTHRv?=
 =?utf-8?B?QlBQdUpnNUZ4RHo3bktpV091ek9mMmtpNUMrN2VkTVM4RVdyTDAvNzlkUDVv?=
 =?utf-8?B?a2ZnNlNNaGYvUXhka0IzUEpRZUVBbnJOTXprSzZoOFFrQW9HUDZEbDlyUFBJ?=
 =?utf-8?B?ZXZEQVVaVHdMa2VGSHBudmtiWGx0OGI3WjVkd09EbEJ4aDVOMXVObVlOM0la?=
 =?utf-8?B?UXhNMEp1aEwra3RPT3JCc1JtSDJ4QXBSQVJOQmwxd09IaGc5Zzc2Yi9Qd1Rs?=
 =?utf-8?B?S2FuMFZkM2x4SEVxZ1dVQjVQUUVQb1E3TGQvK2FHQk96YlVmcWtOc0tBM3Bp?=
 =?utf-8?B?RzlUbVFVdVpyYmcrUlFxbzdpQis5bzZRTllhWWZsT1lmWitycE12bGJsRUw1?=
 =?utf-8?B?ZjdySkc0ZFpwQlFsazNWZmlqc0pRU0hOSTZKWDNBSUVoYXRGamhZaER1bWl6?=
 =?utf-8?B?LzNQYW5VRUZxU0ZDQ0RqMENjdXZXanF2TUdpZHVGNTFVZ3Z1MjZ5ek1XSU5a?=
 =?utf-8?B?SGdZcmtKRjl0U25XTSs0eG8vRkU2aXRLamk4bTBSdGZjQVZPM0lxaFBvYklW?=
 =?utf-8?B?aWJJTys4VDduVzNMRDBMM2UrTDdmeU1vbTJvalV0TGcyY3Q2K3hHYWRucUVI?=
 =?utf-8?B?cTJSaGt0eUVjaDhNeUFUQjRsTnVYV0VJZW1lU3VjUlVHbTlkNTlFVENJZGtK?=
 =?utf-8?B?OGd2QWlnSWV2R2FqcDVoQk1xSUNWa05FcDlkT3JnVEZpemtsaUViSllWV1pk?=
 =?utf-8?B?dThLN1pzS2JqRTNxUGFLaHBrc05XQzBXR21SL3NYc0pMd1FWQ283RWJSaWx5?=
 =?utf-8?B?azQ5V0d2dGxOeGZFUXg1NGh5ekh1ZTZrdkpBbVdmaDVXU0ZqcnVlN3Z4WHBU?=
 =?utf-8?B?RnVJMUhDbXZDWlpJblFmd0JFbVlhenJrMGFZam1OUXJqWVVhQ1FxdXk4Q0tW?=
 =?utf-8?B?Tlo5bE5ONFNpeGNGelB3VGZ1cWc2UmRTZlpIbkpNZjlCZWo2MEt1SkJvWEJV?=
 =?utf-8?B?ZUZXWVdVRjdwbWFvSHpCVWhJZVRJSEpwWlhqN1dFZFR5N2NMNGdmWU1wbDYr?=
 =?utf-8?B?VHVrdXRwRXNFUHFHblgzOVZnZi9yS2h3akl2MEVOcEdET29FeThVQStPeTZP?=
 =?utf-8?B?Wi96ZmY3QnRiTWJueEs1T0lhUEJ2QXZLNmFQNGVIY2Urd2dhc1lXYzcwZW9E?=
 =?utf-8?B?clBLckk2LzBQb1hhTUNvakpPbVlHR29mVlVCYVVFWThNdjl0UmJBdGlJcEFB?=
 =?utf-8?B?aFdaNitNVlNkMzF0LzJVVVpmYnErbFpnQitsdlZqb1p1M1dDM0tYZlpIR0hE?=
 =?utf-8?B?UVQzVTFKSnEza3k2VXBJTXdmbWFteFJlZks1bVE2RDY5aHl1L0liWEIrRStG?=
 =?utf-8?Q?p8zY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFo4eWYxaExiQTh6ZFRZWVJCMjVnNXcxT0lxMDJtYnB0ZTlUdE5TYldWL0p4?=
 =?utf-8?B?NFNKZ2RLVFdTeVlqdWNiNkl5WEZRc3FvNmxoQnp2dWRJMG5TMzZrZjVEZElX?=
 =?utf-8?B?L09YUk42b0lPclpBR2NCOVI3Lzk3UkRlZXVZTU1sSk4wNU1OU05KN0FpZEdh?=
 =?utf-8?B?aWxsN29XSGV4cFl4OE5jVWZTeDdqVzJrUEhmM2tNcHVjUFlWWmlnbDBPejZV?=
 =?utf-8?B?ZFJJNUxVVmdVVVNUajJ3Sk1yVUJFQnlFd0NhVHdUU1BIclAyNVBhYVkxb1NP?=
 =?utf-8?B?UEUzeEVEak01bERDODZVVHZEUURCTjVuVGxQMUsyVzI1ZUdIRmRRaEtQZ2pC?=
 =?utf-8?B?SEswVXYrcWZUSW9LT2kzSWk5MHRnQ2ZNVzZTTzdWVEwzLzhHbHk1TVViMGVr?=
 =?utf-8?B?a2FQWlJEZ3dXYmRUY1BIN2N6YlJtZkJnc29rS2Y2R28zVG45ai9hUHk1Z1No?=
 =?utf-8?B?K2FSZFg2RVdVZnVRWk1aczRWMEY3RzBoa0k4L0pZK200RnREclV2ZXQxMi9B?=
 =?utf-8?B?cTIzV0cxMHo5WkdVWGRkSXRlb0FaVkJKZ29ITERDRUVGbUxGa1dyejg2VUxa?=
 =?utf-8?B?VzRVWDAwQnFDWWYyckN3UFJmUnZtb3JrZ3VkOVA0WXlKM21vQlNidGpxSFFp?=
 =?utf-8?B?alhhODcxSUNWL0dyeXpDdG5RTWhRei9SQWtxcktRMXBaSStOUHo0RkFHNmFk?=
 =?utf-8?B?VGNyajd5Y2p0elJraTZha09MdEd4eFpVd2htQzFBZ2pkaHMxVkRpT0t4VzFv?=
 =?utf-8?B?dHdNOUZhWXE5aVZFVmdtNXNocHhhbVdLTWVmamxoSkVTN2ZzSXpCbGpHcDkz?=
 =?utf-8?B?S2VGU1VudmpEZmY0L3hPbnFNU014b2FYdEVuOEFoN0NreEZlcFNacmdDTzVw?=
 =?utf-8?B?RWJzdDhOeWtGS3kwZFBoa1BjeXI0MGF0RUwrYkxRVWZ1UXRNc3dQL2NSbDJM?=
 =?utf-8?B?dVdWbWYwZCtBTy9icnZlUDVmRWpHNHV3MnN0QkFOQy9uNzNWNjRRWEtpZ1k0?=
 =?utf-8?B?eC85b01tOUNURzM5dW1Sc0pwbW0yYm92NVVGbHZwZ2syYXpuQmtSaU1aWVk5?=
 =?utf-8?B?N0E2Q3ZwU2FUTGxsVnpVR09nN0o2cmdNaStzcG1BUXduci9pZ0Fhcng4cldS?=
 =?utf-8?B?L1N1bXRsaTRXNUJnUUFGYzRHbGE3Q0xTKzZmSTA2V1VoejVxUXhVMUxLN0RS?=
 =?utf-8?B?UlkyeC93cHlpTWRETGlYRVR6R21TZTJheFcxbnlsTGVqZW9XK25TMHlkbWVF?=
 =?utf-8?B?N3kvUG4zN3l3Nkp2VUNEWkNYRS9VTm85NTZDWGFzQWlVY3FSRGdLTEtTRktv?=
 =?utf-8?B?WVBYZTJIdTJIaUs3Ykg5SWVmb2s4N1dOS0tKYUZTdHkvcG44aWc3UHZDa2p1?=
 =?utf-8?B?VThZQUlIKzUyMDcxNDRQQU5KTEtkRFJNZEFob2h1aXlCSUFpbHkyWGNHVDNz?=
 =?utf-8?B?S3ZIdDRteER2ZTFmUUhhTjUrYlBFWWFpOTFSTTM2QWRWdTAzMDFFV1l1MU5O?=
 =?utf-8?B?dU10bUVRbWFVQURSNnlUd0pIWElZSGphU2FmL3NoZHR6enNsMjd5aUxGUUxl?=
 =?utf-8?B?Q2k3b2p5M2h1bE9WQW01NHJLOG9malA0SDFIUXR3S1ExdUFBVFFBaVV0c0g1?=
 =?utf-8?B?azZoQTM0N3VzSVMyN24vR1Yvd2dxbDNrQWJNM3dJUmcweHJybUxlQk54a2x2?=
 =?utf-8?B?UnBOMlFXdmo5YUhPWWxIVUF2RjVoOHZoYzk0eEQ5b1VZcUNGcnBPVnBQbmk0?=
 =?utf-8?B?T1NZK2h4cy81aWg3UnltVXpLNEhjUkFOSytGRjFBc0hlUDc4VUZycDFtd3FD?=
 =?utf-8?B?N1BJdjZKZWUrLzcxYXQ4MEtodWhabVEzSUptNU0zTGZiTW1INUt1eS92Y3da?=
 =?utf-8?B?UXliclUvQkhZOThOTng4VG1uUVJhZTFRVkVMVVlmWFhLNXVQdURVZkhsbGpR?=
 =?utf-8?B?MVpHWjlDdG5YakliWE5DRlNzUkREWDlzcFJVVU5uNnZxSlgxcEV3d0hpTFVR?=
 =?utf-8?B?NEE5aGJpcDhqbHVIT29NVldOM01WeXg2OXJOMVk3b3NhRHZFODJ4dDdHaXQx?=
 =?utf-8?B?bys2L1hJeEE1UnhNK3JPcXhITU1FNURVMXdjQjhBeWhOeVQzakpITSt2RTdQ?=
 =?utf-8?B?dVY0ajlUeVE5bXk4ZnQ4c0piRElhd3F5T1FBaTRUODN1OU9PbTV5OU9XQk9V?=
 =?utf-8?B?eW1YWis5TnNKcWZrNFMwVDIxczM5dzF2NlJ5Z0pzWkRaQVhqbTdHM3o3MTN3?=
 =?utf-8?B?YVZEZ0s4am9lazUyZmdyS3NjbStWaWZKaG1GemExbTZtVWdBM2lpMm9lWlB4?=
 =?utf-8?B?aVQ4Unp6YTNLcjBlNVNSZFNaMWc2cHpZUnRQRmp5blliclNZem5vOG5TOHNq?=
 =?utf-8?Q?PJlYM7h9Ook4c4Pni8dTPYGmr+EQNwZf/70ZQDjqbeiM3?=
X-MS-Exchange-AntiSpam-MessageData-1: B7m881Ga8eMT3w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad17e958-0588-43e4-3f08-08de6a001d28
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:45.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUqi3IfIfDH7D+ViBaj8fwH27omlOn9DAbTWZkxTuWyuy7mwLQNbm49pZ+hY5Fej2CigenWNpyob4HcbloGH4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: C060112AB4B
X-Rspamd-Action: no action

The limit is 16 pages for a single command sent to the GSP. Return an
error if `allocate_command` is called with a too large size.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index baae06de0e09..dbc9e95f1b17 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -122,6 +122,11 @@ fn read(
 /// Number of GSP pages making the [`Msgq`].
 pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
 
+/// Maximum size of a single GSP command in bytes.
+///
+/// A single command can span up to 16 GSP pages.
+pub(crate) const MSGQ_MSG_SIZE_MAX: usize = GSP_PAGE_SIZE * 16;
+
 /// Circular buffer of a [`Msgq`].
 ///
 /// This area of memory is to be shared between the driver and the GSP to exchange commands or
@@ -329,8 +334,11 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     /// # Errors
     ///
     /// - `ETIMEDOUT` if space does not become available within the timeout.
-    /// - `EIO` if the command header is not properly aligned.
+    /// - `EIO` if the command header is not properly aligned or sizing is impossible.
     fn allocate_command_with_timeout(&mut self, size: usize) -> Result<GspCommand<'_>> {
+        if size_of::<GspMsgElement>() + size > MSGQ_MSG_SIZE_MAX {
+            return Err(EIO);
+        }
         read_poll_timeout(
             || Ok(self.driver_bytes_available_to_write()),
             |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,

-- 
2.53.0

