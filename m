Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED877380FCB
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120266F404;
	Fri, 14 May 2021 18:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD66F404
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:33:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNCkCoUF7xXy26HSMomy7RlVyVxGwzmc1kb54vAPsSlITyIR5+LWl055mTNSitD9zU2t8xBgojK/RntBzzjammOSaATrCFu89/7dl2SSKU8Fz2IyEFO3vvv4oMG28/vCtGlW12NgyMkq0TOu4ccxX4nqRUa+myZEnGQ0pUoYf0LtAC0ZLc6/fEW0NuWKeLhDHwJnFSy21f06WAdEWpC+TcjXJN53GVgpC0Gm7pWrE07ZZSEpKdcuOAaIZatrGgXj1gmKW3EHqUnRf7ewZiuToQ1VULZsgxVxcqIOnAfRH/SUdD8/l3JjGurdaVQqF7uImKFRreFXyUOEXpagExpZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyncnrtnmsqdCYWoTItodDCTsxSlEJbtQewwIaqpopQ=;
 b=GearDeVHRkSFepaChBourZyKeMjuwngmAI61XsAN7s94EWKZQM5epwWccOE/VneRcApHr6eR4auD1M3j/QfNC6tVFiAds3SK/YJ9IJt+zCMjl38PBByNBFMOl6fAJUoikjjL7RCSy4uI6urHEHu0VkJDGbJ1MWisx/IHaFHWtNzEDQ9aiQywlvIx1a48K8hjd1V0LHndLCtnDKnITas5LK/NHAMm1STMlem8bhTMiFihF9L7BYEcoKgCATW9gqbC1DlPv5Nw93a39JLurkAK9QludNChpr/Mhg0ILXEHHQbRGmSyNsW+OMgUuUqXloA7hSGrYA/WAr6HbmA3YwTAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyncnrtnmsqdCYWoTItodDCTsxSlEJbtQewwIaqpopQ=;
 b=aLnRYVra4oOg4jJdxn0of86OSA5kGDNXMZJFD/MfAlpGxXsilfy5wfGFiPDUNm2o1ISpS6Bjyw8EMglsnziIW8q3SQqizaE8Xns15+i2PckXV4Z8XISNL4Wx2EyMCd6cUCm8vPeNjnY/+DqTOX7JxVCl0y1/sy60T9guhj6QfG4=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB7037.namprd05.prod.outlook.com (2603:10b6:208:189::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11; Fri, 14 May
 2021 18:33:34 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4129.027; Fri, 14 May 2021
 18:33:34 +0000
Subject: Re: [PATCH -next] drm/vmwgfx: Fix return value check in
 vmw_setup_pci_resources()
To: Qiheng Lin <linqiheng@huawei.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210514082812.1697-1-linqiheng@huawei.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <d8f8ef46-5a27-5011-3c93-198ad57dafb3@vmware.com>
Date: Fri, 14 May 2021 14:33:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210514082812.1697-1-linqiheng@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL0PR02CA0072.namprd02.prod.outlook.com
 (2603:10b6:207:3d::49) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL0PR02CA0072.namprd02.prod.outlook.com (2603:10b6:207:3d::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 18:33:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2ab3ca-d14d-40be-5f7a-08d91706c758
X-MS-TrafficTypeDiagnostic: MN2PR05MB7037:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB7037DF90531910CF3DA70DACCE509@MN2PR05MB7037.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4o6vbfYj7VkxWm6Z3508EWsptueTE089jesa21aReeGdzkt9aappmtzfyE7zu05/DEnoW/K3YoczOonEjz5g+0R6uQoyvez8efK3YIX3FEElSxoTCJqoplnW6CVTfiyiAvuzh8hnFldo9WSu9tSbIki0EO3k5oAJ/ij51fBE1U2BCAZP1gcECKbdDrj5qB6HcSWIh3dvYykLfti11LbQmSxpwu5+KO4syWOb9T/M4EA53xHNblBwA3T4zGbCY+CzSa1dVT+hF6q6LeJZrxkfnNEorlq6SGWLn5jyuIjxZFdJidw8alkvYUUqoV4Zgv6AVrMImvE5Z6J81wDOCksQqgRAWpagTHeMtVYkM7i+yCUoEn9dIVAvE4grd7F5SugnsQ+U3rxPvWWBuZdVlM5vrH+c/wfgZuGCt1dHRvvg2M+she7If6N3SIph3fxRvodKNokmOIuuDcwWDr/IJYt8w2nShTHrbYvTDDvsA8tF6J7cKImDoQju1Gxu7CbdDuy6oFwaaWfBqQXO81lSPaAv6Qvxp57nagc8fKHDeVWWWJxiw9muIbJIKwVeoedcovtJOlelQqFSGN/JbgT2o+N41/iTWjXKDFaj6HP1VYQHRJ/hxkdCD37p5rccj1Atwo3yWlQkmfqQv9v8Z+AUCC6IWyTrfn0AsmI54Ji6Y+yM1n+qT32Aine22QuL/M5NBQ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(5660300002)(6486002)(956004)(2616005)(2906002)(8936002)(38100700002)(8676002)(26005)(4326008)(4744005)(66556008)(66476007)(110136005)(16526019)(53546011)(66946007)(36756003)(31696002)(86362001)(186003)(16576012)(316002)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmlkZEYxUGtZWFdtdHRHQVl1WnRINWJCYnZ3QVVZUGM3UzdNeWRhV3JMMlg5?=
 =?utf-8?B?TmV4amx0TGJRaUVNYVBBcjd6cENLVUZZS3RjUGZlYVg1eHBhTmcwVjZzQlVS?=
 =?utf-8?B?Ums0YTRpcHV3NndpTndwdkpsb2J1VEZPK1V1M0hUdDJvSWs1QTVJdUpLclhq?=
 =?utf-8?B?US9nL242VlYxaUN4MjNpY0VaMUxwdVVmMEhXYVFmaXc5L09neU15SVc3U1dV?=
 =?utf-8?B?d2Nxbkh2U2tsbUpzUGNvelNkTXY4RjhqbkJEeFU2ajFBcDJYV3M5TVN3UDZm?=
 =?utf-8?B?Um5GalhMWkJHTUh2OVdQSy9nZ3FFRkhwV1lJTy9Ta3NuczBzMzd4RkQxWXdZ?=
 =?utf-8?B?aWJyaG5zempSMklHLy9FSWpsYXZCc0RuZzFXdTdOc0NpV0VxY29iT3BkS3ZB?=
 =?utf-8?B?YUt6ekczWnhYQm9ubDg3RU0wR0FneXFhNUNZVWlWZXlKUTVwVVV6b01mdnZW?=
 =?utf-8?B?SzNZSW53UldETjlRMEt5aklsKzAzZi8zb1RGeE5vcjZRYUJUWk8zYVdWZDVT?=
 =?utf-8?B?cEczUlo4ZFgwNFJKVFp3OTlKYi9LOWJNSkVCUnlvelNkRWk0OGhyWU9NUDdD?=
 =?utf-8?B?L2x1QktuOW1XZzQ5bHczQTE0Y0tzQWI0WlRiRUtoMW1BTTB2UVlyK0ZnbXda?=
 =?utf-8?B?bTNiMkxuR3NBWmhhMHdzSSttRG5WbEg1dTFBTHFmQ3RFb3ltZ2puVmlyREFm?=
 =?utf-8?B?bjZ0S0g1Umd2bVNlVlpwdGRaNERxb3ZyRi9iU3YrV2s3WVJsYm84ZUJVaWQw?=
 =?utf-8?B?Zk50QTZlcVI1N2Q0MmJWMFFlVTRPK0huMVNUQkNZbzkwYkN1N2x3UU1NQVRH?=
 =?utf-8?B?OFdjYXVPcWZRL1ZyakZEbG1zODR2c1g1OHc0UHNNbXVyOWFCbTl1NmFKWlVM?=
 =?utf-8?B?cStTeU14SmgwbUpEdlo5cmpLMzhQSDVHTTFicjZoQUFiY0U5QjlKTGZsYUx4?=
 =?utf-8?B?V2V0YmdldkVxdTY2VUV1aEhtR243KzQ5WEJuNitlaVVDcUR6amdPSDdDV2Jr?=
 =?utf-8?B?Qi90Rmx6Um5PY3MraWRmMW1FSTFDZ0MyYTdVZnBGZzlMR1pXZW5NR3Z1cmc3?=
 =?utf-8?B?Nm1GbHhleWtrNFFIUDkrK3U4ZktTYnIzZFJaTHNUWEFtRi9kS3I0aVdwelBk?=
 =?utf-8?B?V0hUNHVrTHpWMUJXcXhWcXZxY2FtMHZDZXVOeHFTNldQSlFjelNQbUlralRk?=
 =?utf-8?B?ZklDVXRUODJOMm1pK3NqL2g5UndBdUJxK0VDWFU5V0NPTElSaFhsQk5ZVHdx?=
 =?utf-8?B?SlB5eUdwSWhpTzhuVktBZ2hvaGh0QlJLVzNSd3h3MEVndkI1S245VDJPdDkv?=
 =?utf-8?B?bWdsYnFJWE5GbVpHMVcwUVd0OXhtd2JNM3NieGJjMDMrOEFWMzhoT25POVp2?=
 =?utf-8?B?enJtQnBUQW5sdjFDRjRxS2MxQ2hVcUNSVGNFdWlzU0lkSzQyS0kwTHpCeW9Z?=
 =?utf-8?B?S21EWjVJK0FvbDNkSk1LMGhJWVZ2ZlA1RHQ3a2FNdC9OeFd5d2w0eFdCMk83?=
 =?utf-8?B?dDgxZ3gwU0RnVFp4Z2JFaklNVm8rVTFBT1lhWXVSLy9UUlNjQU9NcnhabDFB?=
 =?utf-8?B?ZU5sVXYrK21DaWZncE9hbVlZSDhoQlQ2ZGNZZ0pZclRRbWoxcmFrWFVUQVps?=
 =?utf-8?B?VVdyeUNqQm1HV1dGRDJYakMxdDlUSUVJTjg1TVp1NUNnZXJzWnJ3REdzU2Rp?=
 =?utf-8?B?OCtkT3hnRnVwSUJoU1VDY0F3bXhKNXhMM1dZSHRiRDNwMk4vV3ZVZlp0ZFVt?=
 =?utf-8?Q?uyN3EdG9H6sk6Q3nQHiy1fwhB/jAeKssccMwx5q?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2ab3ca-d14d-40be-5f7a-08d91706c758
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 18:33:33.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ezQoCAwOKdgDP6UxfSfItLksXAvmk0+TN+A/gs3wgIEmsiNw+CjDE34R/Oo2F7DWbe6cmUjWHnoFFCfDxj1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7037
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
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/14/21 4:28 AM, Qiheng Lin wrote:
> In case of error, the function devm_ioremap() returns NULL pointer not ERR_PTR().
> The IS_ERR() test in the return value check should be replaced with NULL test.
> After that, the error code -ENOMEM should be returned.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>

Looks good. Thank you. I'll push it with some other fixes via drm-misc-next.

z
