Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D463BE37
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27A110E078;
	Tue, 29 Nov 2022 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEBA10E078
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 10:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0WCE7cKs6TaAIpe3AjOMijDjIEVYswqY4gK78+xhp1PzFjp298reY6v1huIdHdChKLRTG7NSo0/tjimFNVJZXPq7aIx4SgDuhRSGhfIVMS7JnDezCnruT4/WUKqirEzLFZQBj8X62lct0aPVJcxHW9ho3S7rEp92R+jlNYMNPrcuHMr2lq2cMOglMmsaeB6etq5pCPujYKifTkg/dlCb2cqZhNhCiN6+tznwZXgJp1Q3H9RfdUthu+LLPUtf8IeGNW2tH6RhBm44NkARCCiAzFjRse0ItMJNagcD1RUfION6Aae/oehXD1P2wmdoJIQDvrEridBBqLRlWh3im4Exg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyrFD4vrFFWRSghFqQjUhl9L1KgjFfPWB36qQ5HuSPk=;
 b=DKJNHbxUvySqmLXvDnd6criMmLn/tP85t7rGi+nRaqj4sbxkXHWJI6DGHHcFjOXpgcOacqElXnrm9J4CI3US57jQGZfLYo4vrUWpNT9y6u2PUUiFwzjg62LnNmL91zOq0bQ7ezhKbFyCg8wUjH53QbqQI3/IhtwIoRqHM8W8QKkGng83XoVpgVi706DBZ8ij/TyQc2zunKJW02vfH7rbZsYOVdHstFrBvSXlMBr8sW8nlkk/dDwHihi5JOjYz/MCfgcUJlJhA4rW3TxQTe533A2DTWbIPKyAAKOY3UqWCm6m0gsH8fIepLNkDaLXSxV+vj0uCTZjdCwDHHdak9r4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyrFD4vrFFWRSghFqQjUhl9L1KgjFfPWB36qQ5HuSPk=;
 b=dm7qHsVHOr5cYdKp/HGF2AXUX5Gz5Om4hXKX0/GjQWpZepVJibazs9Z8TH5TQnrmulc7RYw6jCrzN69tBhLUCrVJkkFnNliCk1KBLLjK9abJNaI4fWRWYnNN1Ya5JKR9fjdM5Kj6xokB7U90rm0qT0ON72FppnUkFj7tbvuATs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SJ0PR03MB5615.namprd03.prod.outlook.com (2603:10b6:a03:27a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 10:46:09 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 10:46:09 +0000
Message-ID: <77cee477-6b72-3eb1-487b-33e12d7418ac@synaptics.com>
Date: Tue, 29 Nov 2022 18:46:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC] drm/fourcc: Add a modifier for contiguous memory
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221129101030.57499-1-randy.li@synaptics.com>
 <sHR1F4GVsLkT7F5iPXtRNZMZ1R_vSHulae_ZqcpUXP6_u3t85f_JnERnKg5Pombd1gDlNi24rBVbeDGK6XddDTzyRPbipWsmRt78DDDl4o0=@emersion.fr>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <sHR1F4GVsLkT7F5iPXtRNZMZ1R_vSHulae_ZqcpUXP6_u3t85f_JnERnKg5Pombd1gDlNi24rBVbeDGK6XddDTzyRPbipWsmRt78DDDl4o0=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|SJ0PR03MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: d7038b88-0685-4e70-1a36-08dad1f6ed2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64jjfywEDBM6j+QaGJyiCReiiqdWEfI5VHcjR7kStUZBTcoToYS3sLqEPUT/5vR0V2R/gV9uCcOSc0cr66Scxe6JQBM/ErJpdFXBhdXGipOul9VMXzOSkBCoVY7zPCMY4xiLRt4nVGvXbcnCdSqS4RwVjmOxv9hsM4UEsQJB14XCEfjPIkWASZWZoh06BaTkR+FVhFmzgJYHVBiF1ShRyAQXyBsMPvi1XimREzIvNSWAxkuDGnBqMC12lAkUOb2iZidXi5OcmnimL5Y7JtDZuIYn3ne3mIKN4tCzvsvhyGwqhSEsfgCVUALLGpspE+g8fEnCUfleodIFpy0Mcl+rlyO8jXDdQk6Fw5A9SZzPrhVVwRSYT7YuYBOp29vf53S7TuhROhRMKIr1Rgr4L9qpAjCYQWcFrIvat7YtF5LNn6hpMf+rFnVXkMxUxnfAEupI7mdvAa7veIw5pF2NtahSs77GDA/kKe+KVv6ddQrr6heFeo1nOppmRg4LyMwkLyKXZfls8NJ3dTNEB2epg+SvHXplkfXOgCOeNo73PogW86vAfCuuBi1s/COgWFvFAITTv2q1T76MZGWrKBte8/yNDXyAz44WpdOFcI8JntuLlOEeU27aZfgwsK5yYybNwvzOVmhXdW5VLj6ILLpnRY8dVeiQd165uUEDEY3/gs8c/SPtJRSSBHM6MaZrClv3pLdWwYZQVvmXtSEE20KrjTzTEOP1JDfEDRJiemmUOMNKXJc7aWE4ms+VHCZiGr3WEeuW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(53546011)(52116002)(186003)(2906002)(6486002)(36756003)(6512007)(478600001)(26005)(6506007)(2616005)(38350700002)(38100700002)(31696002)(83380400001)(86362001)(6666004)(41300700001)(31686004)(66556008)(8676002)(66476007)(4326008)(66946007)(8936002)(5660300002)(6916009)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTRWYmlVS0kyZ21USzJDWllTN0U3TnZabWZhNmhBRFptVUd1cmZRaVFRWEhz?=
 =?utf-8?B?SGxKaGo0eWFHZHlUWURINkNpR1R6V1NydG1HU3Fka0ljWFFBWG5od1FQcUw4?=
 =?utf-8?B?Sm9weDlKZm1idkEvTE5DRlArN2hFZkRFYzc4NW51Vlc0dUQyWWNjWmtkOW9o?=
 =?utf-8?B?OE9Yb1U0WVdLdWtycHNCd3FlbkxKWFY5c1A1UFE2Z1NmUkxNcGQvWUNmUVBZ?=
 =?utf-8?B?b3VFSDdtbThMVFNpU0ExZmNjTkI2d0RhZFVRenBselRYOU1DbzhHcE5FUmNP?=
 =?utf-8?B?MGdwYUdibUV2U3hDT3dSR3hqSmc4V0hQdW1na3pSaXMzdXF6ZHgvbnJucnpv?=
 =?utf-8?B?QkFROStGWGhsbG52bUgwT3daY3NwRUZlbEU3VzVKQURKMVRxRkxoM1gzbWxr?=
 =?utf-8?B?NmxTQ0dZS2hoeWtiOUV1VmdFclRKazhCZkNtMHVCV2lpYUxtZHRkV1I2NGk3?=
 =?utf-8?B?QVFjcmh1Unc0bUlNdHJnMko1UkE2aWhCZTdwUnh1RWo0RjcyS0NRdmN3UVlT?=
 =?utf-8?B?K29Vd3RvZ3BaaFNtSnhqeUlOcTdHeEhrVGFNVEswNHQwenNvaXlSUytDNFJq?=
 =?utf-8?B?SHFvRVpaNElOckN2VzA1NTVYUk10cDNNeC9ja1hQZGtRT0ZjNEtXTmFsYlRa?=
 =?utf-8?B?aFl5WEQrUjNZMXpFdWU4WWtCZ1VzWXJtTEJ3bjFZc0gxcjVGUEc5QmtUdTRn?=
 =?utf-8?B?TGhiMExDQWJxT3BnS25iTXNXSHh6VkRzTnlML2o0c1BkMXNaUU9BMlo0TmtK?=
 =?utf-8?B?RjJ1YXVWUmFBWEtDelBQeDZISXp2K1F5OGREWVpONlZTbTFLRHJmSy9vZ1FY?=
 =?utf-8?B?RkVXUHdKWGYzZjllMStoM2RKM3dpS1JVaDFCRDAyTitDc094WFlZQm1lYTZR?=
 =?utf-8?B?aEppZUlCQ1ZrOENjVTVscjJ0N0greURKczNuYk5pdVB6WlphaGNRcFV0cytD?=
 =?utf-8?B?TXJ4KzVTS0ZycGg4a3lXR0VNamhjQU0wWWxrbEJreXVJSkxvYnhTZDc0UHk1?=
 =?utf-8?B?aWlBSkp5R3ZUMWt1T1N5Ry9qQWdUZ0lHU0VIeUZHK3hJV1A4b0k4ZUJrYmw4?=
 =?utf-8?B?c3AzTms4UFZwREFuUTN1TG4xZ3FaYTdRbmUrMGl2Ly92UFJ6KzJPNVR3VXBU?=
 =?utf-8?B?NFVyMThzQlU0V2MxcWtNZGRaMisyZ21NQ3RyblB5OHp5eWVVaEpGQlFQUmxQ?=
 =?utf-8?B?R0JiRERNRkJlcVV2KzVMcC9uaTMxN0NUc0Y3bVNOMStFNWRzMnlQc3VnT09z?=
 =?utf-8?B?R1RqSEt1bnNtYzlrd1huWmpmT0VneHdnUWhoUTJvNDlPMGtMdmhpbytWMWRV?=
 =?utf-8?B?cmN3WGdjRUZSaVZoNlAyMmJkSWl2OE5PQlhPbjc4akxVcUpOYnVlVk5rVDJm?=
 =?utf-8?B?Zll3RGdBVEFRbE5saTViOGdNZ3RoTnd3RWpCYjcxQlgxSnRZMm5uSTduNjFP?=
 =?utf-8?B?bXhZNEFVaWF3WjhmVitLd1EzWjBwZGgrODJqeVVjYkVkZk1YeDZIKzJ4c0pX?=
 =?utf-8?B?S1pUWk5lSkY3WjBVQmJOZnlqU2ZIU3UzbWdHQysyT2VvVFFqVGZrTDU2bEk4?=
 =?utf-8?B?SUhnSGo3VlBSYkF5YjhoUGpxWFhmRkV2bmdPdVNXcTVyZ3ZnRFNON0FsaXA3?=
 =?utf-8?B?NFNYcmNtR2VwK29wOFcxS2JidWh6WmVjZy9UN3l4N3hRM0JYVDJ3eW9wd2tl?=
 =?utf-8?B?bWwrcUtBVXBYalpBZnBqMGR4SVpNWWh0ZWRNMGFHQW85Z0JCVmlRWGpJdWdD?=
 =?utf-8?B?MlZ2RnhyYlhiYTdlUkd0ck9CbjN5Y3J6TG1pTldDRmtrTnNBZFcyYmVKNWZU?=
 =?utf-8?B?aUkyTStMckFwKzFjaVlPeHpsYWpUeTVERi9WZDM3Q01acG9MR0ZRanY1dEgx?=
 =?utf-8?B?Y0NIRDNTQjdidDVsbnhkeEsvZmc2aE5OaHVXUWhoTDJVV0hBRlFIdHFaMGJW?=
 =?utf-8?B?MkhMTUg0SXBmV1hNL1MvckNCVGtaOGh2WThIRUVQOUdBT0VDc2w0MkxZTzdi?=
 =?utf-8?B?eGNZclpFY0d6OVhLVGZaeE9YNy9Wd1JmZmpWY1FoQ1U0dEo5WUNlT0NOWWFS?=
 =?utf-8?B?WjhiUUhxeEZCWFNvN3hPMUFwTm9aRkNicDU4MTNVbnE2SENyc2ZmRnhOK1Zp?=
 =?utf-8?Q?PfQNDe3++xmfyX3q2+QBlhYwb?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7038b88-0685-4e70-1a36-08dad1f6ed2c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 10:46:09.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxLBCXX50cVnw8/+ZcsfHuhkGL41OHydJVr595xSdeCfZS6+6d23iDSOq1hvrZygQ7lKJGCPwib5JN8E1o+klg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5615
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
Cc: ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 tzimmermann@suse.de, tfiga@chromium.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/29/22 18:18, Simon Ser wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Format modifiers are for the buffer layout only, not for the allocation
> parameters, placement, etc. See the doc comment at the top of
> drm_fourcc.h.
In the v4l2 mail list, we have such proposal that dropping the pixel 
formats(not the codec formats) from v4l2 header completely, as the 
growing of tile pixel formats.
But we can't get rid of those variants about non-contiguous(the same 
value FOURCC in v4l2 are all for the contiguous memory).

Before I solve this problem, I believe the support for tile formats in 
v4l2 would never be stable.

The most common way here is to hack the pixel format modifier, then 
userspace library could be aware this in allocation and get properties 
of the drm_planes.

Or another way, we could add a common plane property, indicated that 
whether the driver requests contiguous memory plane for a format?
-- 
Hsia-Jun(Randy) Li
