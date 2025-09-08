Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AFB48184
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07AE10E325;
	Mon,  8 Sep 2025 00:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PixJfIg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6E810E327
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDEXMl2yfaHIif9dnhoKR5lgTcL8YyjP3U29vsD4gsduHQeuFTm+i+ik5PqBdsXqqsdoA2JFFvpJCGeaQ4yminaupBn7IPRzL+Z8SXnm1UNHYnDDbaGKjnqm+oumYExj2EW/mCIYM5xBHahLHLOL/mFMW3D3i2iJ4AXLTjUByVju9VdzkOmnS1uee7FE5yQbIZJxTeHUbE12q8kxGPEGtSZuyYgFPh2T0Du5aZaWbcHf3911Bo3p1MLc65iFuf0VmU6Ewlq864NgmA5GSiF4kbPUSX8a3vCuMhZm3EIzxAnR9geungqkurcbuwRf5e7+41NuTYgZokGOcD4p/7xTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo/NxerW50xRZO6tS1e/zWfFAOAe6RBPo0OLC4UjPKc=;
 b=hUB8va9cD9tb7wNlEMNOorA+O4O8EkCPTUcocRJ72+evYgHe8vjk7ipvpyypydWP0EIXjQ1+g79c51+HqWLravfS7aP2KP2DQ85k9wKzSrqVyFFNkc4srb/5rEocJ9FDliO7Y0TXDAoz0CAY2HWhhEsN6EmVH8l6Eu8aEurEabS0qbkzoKbXqLQvQpPyHeFAoaAQ2UgYgnJwSnLVEjlpta5nwOV+Am8z7VSVxbiRkB2eL2eP/CeiIsRL6AD59Y359eIwWsSR7h0XysNOkKIb4qEwb29Ao5T1rHlvEAKKWLfeawPYtRRuL4hAg3DXrwJPcN0l1b9f9TCOMo3bJ20B8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo/NxerW50xRZO6tS1e/zWfFAOAe6RBPo0OLC4UjPKc=;
 b=PixJfIg95aVXNLLwvn/R+5HemL9JypQ7IcpvGsgyS6muwlYguK2JtcVUjpgc7+4aX87EdHFs0dZ4qxeqwr7+YoAJcVi2GiEr2M+AuODHEauK6y0VP/S8MvE7KxxzPXzcehIu8mTZMXzGRCcb7DBLvpm3lgHE/rYtGf40rBb1oq0nk3Hi/a1KhDWqIHIJWXSdDfJWNGfowV12SFrlSoI7mo9yyEtEZf3/oN3jeOcF5Hjkv8cwU0zd0REVfiZIPnODBzQNHXYeGYYVeVm0ARyotL52MtB+5FlQDJ01ddPLh9YXt5MyxJ5wIisQU6oFC/65uGhWYsFymPznD2V7KcEDHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:39 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v5 11/15] lib/test_hmm: add large page allocation failure testing
Date: Mon,  8 Sep 2025 10:04:44 +1000
Message-ID: <20250908000448.180088-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY8P300CA0008.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::28) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: ba939e1e-2939-40bb-8a30-08ddee6b71db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdyU3oyQjZKbGZ0NVhzY3V3WVRnai9XTEplUlBXYWNQNDRUd2NBc3dKVU5J?=
 =?utf-8?B?c3ZOdTYweUdiTmdlOXZVL0h5YzJjZGgyMmJDYmIyakJXOTdmK1cxa3IrY0Vs?=
 =?utf-8?B?QjFBRDcvQ0lQY1dHUXhCT1BGbzFlQmJhbXYrRm5DcUljL24rR0VpVG5Cdzda?=
 =?utf-8?B?bkJHWk5EQjMyYnRUaEdvV2xiWGcvenZDeVhvYUZjdmVOSUhCRXl1RjB1U2h4?=
 =?utf-8?B?Q09Zc240bUhkSkFIcGhaUzVNWVNRdmdlWHAzcWgvVmFQL2FNYWxzSGFQQnFr?=
 =?utf-8?B?NzFOWWxMdFZGZXpHQzNiKy9CTVJjS1NqZVJRY0JZNzRRTHJrZDdsV0VOM0du?=
 =?utf-8?B?NVJjZzhQbHVIeGJ2STJhMGZ6LzRRc2laNjljbThzRG9iS2hMdDdvMzZSSmw2?=
 =?utf-8?B?VXRkSjdpbTRtc1lTT2ROQUJONFN6aWUxWGp1aUFQcWR3YzBpODBtYWhPQ1Y5?=
 =?utf-8?B?UlE0T1dBMWhDbTJIRzYxK1pjVGNWQnJNak9oUFdBOGxXNElTQmhreVBIVW1t?=
 =?utf-8?B?cUtMM2pQK3RmUmZod0xvbWhSZlFGN1hnVEdqYkplN3dQZyszek9tZENPdEZx?=
 =?utf-8?B?WlBPUldxakFkQ3VzdWdneXBJWWlZTG9LZTBkSFBaY2o0Yk9PK2VzTE5UeGxs?=
 =?utf-8?B?TDBlbG5xZ3pWRGRJTDNPSlY3Y09WNXRNZjlxRWpSZ1VxMFc0RzNzMzJ6MjRm?=
 =?utf-8?B?R0kySU9PL0MrNnowWnpQZHBWTy9MTTRyTks4c3k0OFJUZ2hQUStXazVHTzNK?=
 =?utf-8?B?N3UwcUJtcUJneHRjTjg4cXVIaFdCdFk1QVdKdzVVck9jYjUzMTBoQnpacjI5?=
 =?utf-8?B?cXVudmFESGdYYTZNOFRmbzAyTDVBYVhBTXQ1NUhXYkg2eXNCVkJlUlVxSzZr?=
 =?utf-8?B?RG1EcTJRTVJsMEdEV1BTeHcrdDNYV1ZoVWxJS0RzWXMvYVB0dUZVdW83YkZE?=
 =?utf-8?B?TVZTbDdkbTRvWGRWcFpzMk9HQ3d1Z3ZWV0JiWDFzSDZTL3crTDI4dXZ0bUhI?=
 =?utf-8?B?K3cwR1k3cEFkWW5nZXRaeXZtNnArVVdTY1pWZ25yZ3JPMWkvQzdKUUZzQ3Rx?=
 =?utf-8?B?T043K1ZNdW9ZSjJicktOZ0hGSjNKcW8wWUc0K0c0c3BTOHhJdkxVSU15Rk9Y?=
 =?utf-8?B?ZmRNMnlkNllzRGx2K2x0N0xiMUUzRURreXprQmFUbU1pemtSWXpsSWVtaGlL?=
 =?utf-8?B?WWdwM2JpcExvZVNMb1pWUEg4SjFaeEpnUkUvdjJWT0UyaDJQSDErdHY0TDc4?=
 =?utf-8?B?VjN4cGVpbEwvRklqSWIxVDlodU1yTEVVT0xQVmVybHA1Q0Y5UXA2c2JFZ2la?=
 =?utf-8?B?cUhhUVNlOVBVUGZvRVpyUjE3Mkp5QWZxWXd6dUoyUWtnTGt3VUZ4alRtZzUv?=
 =?utf-8?B?OWtCNngzSDJ1Rml0RXZTdGg3S2Z0V3RCcHFrZ0E1ZFU1N3YxSkdmWVMxZExE?=
 =?utf-8?B?dHN3eThlN2FQM1RHRjl6Q1Z2V0xPUWN6QW9CZzkwWjQrVGlrSGh1Q1pjRnZT?=
 =?utf-8?B?aTVTc1YvV2lpblpBQ0lYZ3NqaXM2SzhKcVNEQlBzdlVsTzY2WUVqdHI2ek53?=
 =?utf-8?B?Nm9CSmJrQlBwRExKVXA0YUV4U2NyVDRXSkQzMkNlV3lKaFRodnB0UHJ1bWZw?=
 =?utf-8?B?VS8zWW5hR0ZwWUZpSzJWOVZYT0kxekdBM3M5enBGbVRoOFl5ZnFCa0JzQ0lJ?=
 =?utf-8?B?amp3eERMeG5wRndoL2dobGduaUdSVUVlN3pKcjFLSDMwSjdHM0tSeHl4eVVl?=
 =?utf-8?B?eW5zNWZNd0xrTDJHWW9Pb05Tam1wdjI3NnJPNFZQK1RhZDFQZW1jTWNZbDdG?=
 =?utf-8?B?dGtxNVk2d1dldkVZMGN3elpZT090TUFReXFiWjJXeHNYR2VheWdoeUdWZGJG?=
 =?utf-8?B?NGFNUkRtUDBpSkJ4RDBvaFRsUFY4SDVlUXlpenZyZ213aGtDeHpqaTlSWm9s?=
 =?utf-8?Q?fQJOHIZvqK0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW9vcGtHaW44N1VGclNpK0oyanQxVUYxVTJ2MS9nbW0wM2htamF1QTRSWnJa?=
 =?utf-8?B?VDU5QWorbE9xZnNXd2xrRXFDY2Q3aFBUN2xncUtGMDNLVGNYZ2xiRDU0ME5m?=
 =?utf-8?B?UVVQdXZDVzc5Wlo3dEpmMmk3OVVMTFhvNHEwd21EQ1F0eVlxK3NFeVp5NWtl?=
 =?utf-8?B?YVd5NU56TGZidDNIaXBBOWRjN2lLMVhWR1BPK3EydDBxUS80WmN0TWhZb3dU?=
 =?utf-8?B?NGlvOUxaUUc1NmVpOE03MjhZOTAyUC8vY0g3cmFRTE04cFpCRlBubnllUGQ4?=
 =?utf-8?B?a0NJK0g0eW81NjlRYXdmeFJEajJJcWZUNy9Pa0RBSE50dUkwdVA5T2MrUGM5?=
 =?utf-8?B?eC84MmFiajRYcEdjdk1iN3EyRTdJUk5rWkRUNFhsbjVYMWVubVBoOW1MT0I0?=
 =?utf-8?B?K2ZGS2l1OEVRRU1Ed1VYM2RTMlNaQnpqdTJrQXM5Z25hL0NhbHM4d3lCRFpm?=
 =?utf-8?B?enY1UnAyR0dqekhjait2cVRHcWZGcGV5OW9iTGhkZ1RiQnpobnJ2blNHdm55?=
 =?utf-8?B?YzVOemg4dkMxQWVERlByTHFPOHZhdVN3RUlXOTFlV3RUY080QnFqKzdETWhk?=
 =?utf-8?B?VE1mMjFTQUErYlVhV1dEeWNBZG5QeXE0Q0FDeC85bU55UUZ0ZHJCZFRoOGNS?=
 =?utf-8?B?emN3eU5sVVEyMDJaZDhuR21nZGtMM2ZrQVBENi9FR2lZaE9PU2F3ZWVrcmZm?=
 =?utf-8?B?WFcwbjJPOWtBQkl1OExKNHRBU0NRTzhDNjBZWjk5ckVReEhxOUt2NUFTOG4v?=
 =?utf-8?B?WG54M3NPNEVmeWJNRU5ITzFoUVh3ZEwyWC9EYWxldjBQaDJ2aDl2L3MrZnl0?=
 =?utf-8?B?V2Nhbm9raGh2WHdrUXR0UDRCb2p3cGZRdGNxU240UjgwOHAzaWVqeHQvRFB3?=
 =?utf-8?B?RUxjWlN4bjRsaFRwbUFlTmVqOUFsRi9WMm1vT0xMQTZzWU1WWlRkNFFlRnpO?=
 =?utf-8?B?M0pWK29QMFBHUUltOEt5ZFU0ZzAxU0QxUzFNeTlzOWtCdW1pR0d6ZGkvZnU1?=
 =?utf-8?B?dFROemFIcXRGczFRZGplZ3lFM3NDRi9YT3dpVHQySDBNSFBHNzRFYzEvWDVn?=
 =?utf-8?B?Qm93Z3JuYjU3dXU4RHVoL0dwYlAvQWR5SkF2WXBNVzJiN25RTFVqZ1BoSlhr?=
 =?utf-8?B?OGlXRnNSRXJxRmlMeTh0SllYeExsblczVEpuTmJBdVFHVWZhL2Qyd3lWakVW?=
 =?utf-8?B?Sllkb2ZhcnpOZVhMUTFtS3dxOW9ONklVVFVMSlMyMkhiS2xDb0ZmMXFabHl0?=
 =?utf-8?B?eXNzUFVuKzRZcWttQzdhek9vQVErbjV5YU9KZDA0THNHT0JGUlNsM2pMcFhX?=
 =?utf-8?B?cVdUMTRycVVtcDNIa1hJanJycmljV1NhdUEvdUtCNGpIZXhZcStPSmJiV0Jx?=
 =?utf-8?B?SmJnNU5SUWxJdlI1b2ttRHI4WTJyendjWnJ4c0EraWFvcHRQWlRtVldEc1or?=
 =?utf-8?B?TGVNNkluaitkL1NqYzVYa3N2cy9ydG8zYVdNTDVTT0MzNkdXdE1uUGRzSDlw?=
 =?utf-8?B?RW8xckNIeS90eGpFc1VzODJScDB0RHBtUjJwdzRVa0FWRDczMmgxZ0J0dXlB?=
 =?utf-8?B?aWl4R3RYM2N3Sk1YakE0WTV1Z2I4TTZ6aS9ET2JQSHNjeFpycEFtWitIQnhu?=
 =?utf-8?B?ZDIwam9DbWdzZ0hqRzBNd3dvNVlGSnQ3T052MTZ1MitZZTJzOERORjhhcTY3?=
 =?utf-8?B?cDl6dEwvNDltemZLbGtjeGlUVWRzMThXbTBLVWRZT3JWK01FOWpHdENQWW9Q?=
 =?utf-8?B?WU9IRVdNRkFTeVhVT1ZEaHVSamR4Q1NJVndKZTFWMlNSdGRabUtwT2h4UEhj?=
 =?utf-8?B?K1NES0FCVFNha2FOVjRBcEtsN0ZZS2J2WFkrbDZ4WlJsQnhhUTBkWkNMYmRE?=
 =?utf-8?B?RWQrMWtYS1FFWlFNOGhpYkROOFRYUGE2VzN0ejJ5a0FqNU15K253Z2M4N2E5?=
 =?utf-8?B?Wit0WmI5TEVMa3hGcjFUemV4eDIrZ2N5S05SWW5xUmI0MHJGM1M1VnFONm5o?=
 =?utf-8?B?SFErajdNNjRQaEErbVdYa3dwcUwrUjY1d1lnTjhwaGFGdFlmTDJ1N0FVbVVY?=
 =?utf-8?B?YktlYnIzL1M0bFRMM1I0TlJGakhVQnVVYTBlWmdybEZFMHBVa1d6T0I5TnFu?=
 =?utf-8?Q?yStYP9uW9+2yepR9j4/HPWPT6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba939e1e-2939-40bb-8a30-08ddee6b71db
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:39.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKVihrMrUy4TiTV0kYkJsceVa5v/z7DyjjJpEV6T0w8LbK51bwH6abmVIhSW/87tVe2dCKaCd3JOcbfBrq3zHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

Add HMM_DMIRROR_FLAG_FAIL_ALLOC flag to simulate large page allocation
failures, enabling testing of split migration code paths.

This test flag allows validation of the fallback behavior when
destination device cannot allocate compound pages. This is useful
for testing the split migration functionality.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c      | 61 ++++++++++++++++++++++++++++++---------------
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6455707df902..bb9324b9b04c 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -959,44 +965,55 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
-
 		if (order)
+			*dst = MIGRATE_PFN_COMPOUND;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			*dst &= ~MIGRATE_PFN_COMPOUND;
+			dpage = NULL;
+		} else if (order) {
 			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
 						order, args->vma, addr), 0);
-		else
-			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-
-		/* Try with smaller pages if large allocation fails */
-		if (!dpage && order) {
+		} else {
 			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-			if (!dpage)
-				return VM_FAULT_OOM;
-			order = 0;
 		}
 
+		if (!dpage && !order)
+			return VM_FAULT_OOM;
+
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 				page_to_pfn(spage), page_to_pfn(dpage));
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-		if (order)
-			*dst |= MIGRATE_PFN_COMPOUND;
+
+		if (dpage) {
+			lock_page(dpage);
+			*dst |= migrate_pfn(page_to_pfn(dpage));
+		}
 
 		for (i = 0; i < (1 << order); i++) {
 			struct page *src_page;
 			struct page *dst_page;
 
+			/* Try with smaller pages if large allocation fails */
+			if (!dpage && order) {
+				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+				lock_page(dpage);
+				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst_page = pfn_to_page(page_to_pfn(dpage));
+				dpage = NULL; /* For the next iteration */
+			} else {
+				dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+			}
+
 			src_page = pfn_to_page(page_to_pfn(spage) + i);
-			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
 
 			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			addr += PAGE_SIZE;
 			copy_highpage(dst_page, src_page);
 		}
 next:
-		addr += PAGE_SIZE << order;
 		src += 1 << order;
 		dst += 1 << order;
 	}
@@ -1514,6 +1531,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.50.1

