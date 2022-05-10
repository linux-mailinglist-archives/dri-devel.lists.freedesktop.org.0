Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 011905210ED
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8E610F58B;
	Tue, 10 May 2022 09:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705910F58B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 09:31:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEyIYipFiw985Ef6nS4ovoqOOBAgznBh6KmEs26SlUYY40Xu9M2r0FLYezk7k0cXCCLBVErrSi7S/mtVlJJG0koTYpzeEPKyJpbglrk07EvvpFJgrEsRcCJ1v3BDzeOkBJ4997b9dIDssvm9UIWydNVCTzqgso0y/T/MyGPBGW+7vNN+yUEWwrAeUOrL7Pj37oToNg8G2H/WIsAixn0bjm0rGr6c4/DzKiXTnLKD7fCVfv7Z+zAJXijzhZYj/lRqGVdyxPNT5qtMD2NL9jVnG6KtNFMWEeHOV2Mi+DKxKKSlRh5ORvJZrxgopTQtd2TOT04U68LeaUmNnbsTlKBL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7pwWrpEiBAavWjM3Aq/9gBfrSSFpi5lTtQvPbXUdw0=;
 b=mLKbu6UScOD+KhkLSfyBj1p5MB0qVKSoauoBi6OAMZPnPIyZCvEiC6eRj2OJAt8vomcb8MRopf41PsJvk6Gqlosic6sSI7004T1FG8VOYYuIkOPHElZ0r3ezIjWeNvBCavmJ1+FCV5QXHIELiX7R4l+KItj4XRnZ8yZtYCoK64t/xZJOhv7sumqX6F5UlgnY25k6so7lxuswvxcEmtGoQBAkCRFJatd5rx10hQ5ixiVqhP0ecWHcOnzmiqMCA2DFqxPtL2i12eiBSix5atFP33dUqSyHq1sWPDKGdwdgo8ovv5hDV9f6dFYtmwqsqPTr5DHCsTpUN+o1bEUjVCw+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7pwWrpEiBAavWjM3Aq/9gBfrSSFpi5lTtQvPbXUdw0=;
 b=3wPJHQAAKCyciyUFLDiWaub75J0GQB+bM3AxGlJK9UN0QC7AO/+ySLMunc8qh0/TwZ3Z61mGsfbMFBvxUjZYHAKe7n+CPA2tgaXFpE8c3mEVTrJSkVsZGrvkXQUn6bd6tsY28+7gxpX8fZtuHCLgIOu1PwiHclRvEU4/KpoOhHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB2760.namprd12.prod.outlook.com (2603:10b6:a03:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 09:31:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:31:45 +0000
Message-ID: <1c9b7f5a-7658-cf93-4d17-7d8e4b168932@amd.com>
Date: Tue, 10 May 2022 11:31:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dma-buf: call dma_buf_stats_setup after dmabuf is in
 valid list
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 "T.J. Mercier" <tjmercier@google.com>
References: <1652125797-2043-1-git-send-email-quic_charante@quicinc.com>
 <CABdmKX2V55tA-Or6Dd+bpbcv3fDHps_+zHHJQwhz819LX_2RSQ@mail.gmail.com>
 <51bc6d33-c5f5-2a6e-fd83-ffebbe2e0202@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <51bc6d33-c5f5-2a6e-fd83-ffebbe2e0202@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6472b134-54bd-435a-d34c-08da3267e62a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2760:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2760EDCC21F19006AE32ACAE83C99@BYAPR12MB2760.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZ2BsfBrhVTIAHMzuenK9kPV5fwClk+By7YcZMvcF2x4NC5Fye2ti8o/SxiDe42noZbd7AYaxC8nSr/tZo9PzU0pibr2VqOmy/BsT2xTDtB5ROAMjfZymU+522bF2FyNMk2JUiZDhYFt+z2ryp4mN9CIio7mHEYBpe8EUSqwcueEyw/+VMgYaeB0LiQHZ9GOhuBjRVidHNh0ozb922yRUV2zxvc2LX6bIAINsCgP1VdreGHeevYvCsPti5cw4qNvGy4/438F6l42AJfnL56Tznynx8qr5/gGyWj5XwhzJts2BpQWMl0eBRWi0ezl/em770la+wOkAB6nqIAyc3sG/iN6ym5I69LYzc0b6fG/8xYRAL/kSCpTNQyG5rRmtTb7FBZaTdjAkMSHTXDKfgHLlOjZtzllpqoqj4jO6vyhQQBkzH1JijkqSuQMRJ85P8oN8ZWxIYtJAT6JeZbs9RoGXpHXZoM2SZnKYPC9plqsGwGQGGyyyFL+GT+1z91ZEvFFuzka80AswUdofV4RASBJaVF1bBZbtcwK1pPl8oCW/muPMSH0AfO5AO5KSLBeRe/K2Q9nNcbKDr4ln+YgGZdTCMFQ+gOLK6KleZExvsLd3kBclsveA4GbGoyL0SW23mvLpjigb1Wltv2JpJAhf9SHFST2vDs4Gq8OHocGi06XUiwEOPkeMTCc3ZAZNoKIySderzbZozJ4Ia3AgwKNmw0wla7rJtw+ujotX7WcBWf+8Zs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(7416002)(2616005)(54906003)(31686004)(2906002)(38100700002)(316002)(66556008)(6512007)(5660300002)(110136005)(66946007)(66476007)(6506007)(53546011)(8676002)(8936002)(31696002)(4326008)(86362001)(508600001)(83380400001)(186003)(6486002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZWaWg3TS81NytNWTZ5eGhvTHdhdlJpRmRqM2s0OUhQcFNUOExIYnc0KzEv?=
 =?utf-8?B?QWZLMlBHQmk1MXlzRTEwNHFPcWhrYWgvNG9vb3NxaWNWdzlrc0M5THkxZU96?=
 =?utf-8?B?OTNQM0pyMnc1TmRkb014TVBhdEVsR1dNMURNM21MWW1uSlZnUUhKK0hLYzZu?=
 =?utf-8?B?cU9RRWR2VWwyaWJrdzZGZzZtblNab1duL1gvL2JsaTRjcVI2MitWczdGNHFF?=
 =?utf-8?B?SUdCMnZVaEdydUJ6VnNyUTkxQWxCUkJvUVRjNHlySFd0aU1EQ3FCeWVzUWJi?=
 =?utf-8?B?c01NMEwwL3BsWkw5bDZCMTJJUEx3cEZZcThEb2ovUmx4azlHeFlFdkcrSGQ0?=
 =?utf-8?B?cFJ2YWNtSWJmaHZyZzhUcHpUQmtsd2txeHlvTFRtMmtKV2xCanREVUs4YkRB?=
 =?utf-8?B?dEg3ZFRYLzFUSi9BYy9HK2tUVmxFZlRLcUd2OWJnZjF6STdxcmh3WnpVVzQw?=
 =?utf-8?B?Z1FMSXFSOU5jRmRIMFVPQkZsVGM2bnlQeldPZzNFR3l2V1dBU09qUFpWMEhH?=
 =?utf-8?B?Q2ZnMVlDTzdHWXYzVlV1d21jSkQ2bDdDcVhWek9DTkRDVndZTFdtOW9ZSzJ5?=
 =?utf-8?B?aWtpeGYyUkJVcmZBeHhOZUsxUjRsN0pMVU9kYnR0OWorekNSekw1TWR0bXJO?=
 =?utf-8?B?M0RJY2s4a21WREVPRHpwUmhWb0E3ODBGYlNLeHpCcGFHSFl2ai82S0RVM2VT?=
 =?utf-8?B?em5QWlAyaGNXZ01sLzA2bklYb1ROdEVnZ0srbSs1WmN5Umh2NXhWUERJc29N?=
 =?utf-8?B?QjdXU0NNb2paVFhuUFRFaFVxWnRDTkZSdmVXWGh4VXpZSUVpNmlaVkVBY1NC?=
 =?utf-8?B?Nkl1Y1hnNm45MG82THVWdnJMTGFoTVUwRWl1MDJSR1ZXSjBzK3psZ1lyOGF5?=
 =?utf-8?B?OFZHMFdNZTJVUzdRNU5oN1RrWUovVEwveWozYVZkaDdaV2V6cFRFcXQ3RWd0?=
 =?utf-8?B?czB4a3BJOExJd3I2V3NjMHJYRDhPZDJhSmtGSGtRMFJlcnIzMXVlR1VyTkZC?=
 =?utf-8?B?NnlPa0FIWmpoVGU5SnRtOHVIVDVDQ0Z1NFprNzZ1UzJ2SXNzN01lK2MzQXVh?=
 =?utf-8?B?dThVU2VNcnp6SWJ5YWxWSzZ1Ykp0d1lDd2xheG1FK05MMHhVUFRjNDJLUnAz?=
 =?utf-8?B?anFEWSt4aVlxU3BIZmI5NDVxVWNlK2p1cmU2ZkRuUXd0N1A1Z0NhcURJcWlu?=
 =?utf-8?B?eGk2MlF4Qnh2dFR4VXlxMWZGdk90M1lrN3hOajRuNnlvWlhLTHIwNjMxWWNU?=
 =?utf-8?B?a2l0SGVXYjZTL29MOFhnVUxOcjdDSWljUU1qZkt0dnJKME4xSUVmTEplUzB1?=
 =?utf-8?B?dHNzdzlnVEtreGwrbE0wMzNRY2VpMk1KWUM0Z0plU0JRQS96L29kUFRNNXhR?=
 =?utf-8?B?V1g2b1hQUHhUOWo0V1BFcHFxU0trTUhhZFRmalZhcWp6c0NGZ3VnQmxkT3N5?=
 =?utf-8?B?MjgwOHVnU2FQdTNxYVRHYlpJK3c4cnBxSnBFcXpZSWttTi9RcG8vZHU0c3l3?=
 =?utf-8?B?T25kNmNmbGl0anBFNUliODFxbzBQS20vcFJKdSsxMTZ5bGF1NVo0YmZGRFp4?=
 =?utf-8?B?eUlET09FYXo5L0pkSFFLQzkrTSs2UXF2T0pzOXhqV1g4dmFKUEdCdFg2WjNJ?=
 =?utf-8?B?aG00bDB2ZkMrRnNZQkFvek95ZWhFNXIxZjVmRG9MUUd0Um5sRm0vdTh6WlZ1?=
 =?utf-8?B?aTBmQTV6azhxUkR5QXlLNmRyRXh4bm50RU55VXBoTTRzUmFmekkxSlEwUWd2?=
 =?utf-8?B?dEJCTlJKY21UVkJQdnQzenpsenFxUW0rdzluN1MrOFNJbFE1WVpLN2JYdHVV?=
 =?utf-8?B?UTZhbDdBZ1RrTk9lRzhPcDgrdUp1eGp0THJjcUFEbXpmL0FTNkNWbzhUcmV4?=
 =?utf-8?B?bG1YZ2Jjd0lGTWdCU3JHcmJpYzJtY3U3ZXkvRit5dVdIcXNGaWlHR1BHQ2l1?=
 =?utf-8?B?ZFdNdHdZYllub1o4TkpKKzZ3TTdvckcxZmp1cmErc0pkVC9uampGejBnaDcw?=
 =?utf-8?B?cnZqblIyNzZ6RHhGbTI3VlJnWEovSEVqSGJ0ZWF3Nm91SlZMaGliWmtYN25C?=
 =?utf-8?B?L2Y5anZKdzBaTjl2eHVsa2pzZ0dNY1A1ZGRidHFURTFEL1JLQjAwUUdzYkxu?=
 =?utf-8?B?dElXZXV4aVZQS2R2MnFMdGZXbWl1QmZPMmVSN3oyQmcwRzZCSFpsekhnN2lk?=
 =?utf-8?B?UnZiRUlPaXVNVitZcUhMSENHbm5mSUJYTTF4OG94ZWtLVlFpUVBRZnNwckJ2?=
 =?utf-8?B?dUlNNVhUTGZRZjZPL1V5VG95bDJaUVYySEFSa08yYlFqT21tNHJMOHlmUWRZ?=
 =?utf-8?B?blh6elZ1OUlpcGQ2SDNsaFRzcjhWMXRYbUxFZll0N1U5QXBoU2Y5c1R0WGw5?=
 =?utf-8?Q?+lvpcLkSe/EJiWExvlP6W0vlm9TfGFBIabKe2SN1G3ikt?=
X-MS-Exchange-AntiSpam-MessageData-1: BxYj3/5mC5A8dA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6472b134-54bd-435a-d34c-08da3267e62a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:31:45.3276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9G09aG95gxgl8TDZnk/xPJzHZW0Ii7P3Np2DIPfWBYLRhRpCnJuagU/t9tsMX1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2760
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.22 um 04:43 schrieb Charan Teja Kalla:
> Hello Mercier,
>
> On 5/10/2022 3:19 AM, T.J. Mercier wrote:
>> On Mon, May 9, 2022 at 12:50 PM Charan Teja Kalla
>> <quic_charante@quicinc.com> wrote:
>>> From: Charan Teja Reddy <quic_charante@quicinc.com>
>>>
>>> When dma_buf_stats_setup() fails, it closes the dmabuf file which
>>> results into the calling of dma_buf_file_release() where it does
>>> list_del(&dmabuf->list_node) with out first adding it to the proper
>>> list. This is resulting into panic in the below path:
>>> __list_del_entry_valid+0x38/0xac
>>> dma_buf_file_release+0x74/0x158
>>> __fput+0xf4/0x428
>>> ____fput+0x14/0x24
>>> task_work_run+0x178/0x24c
>>> do_notify_resume+0x194/0x264
>>> work_pending+0xc/0x5f0
>>>
>>> Fix it by moving the dma_buf_stats_setup() after dmabuf is added to the
>>> list.
>>>
>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>> Signed-off-by: Charan Teja Reddy <quic_charante@quicinc.com>
>> Tested-by: T.J. Mercier <tjmercier@google.com>
>> Acked-by: T.J. Mercier <tjmercier@google.com>
>>
> Thanks for the Ack. Also Realized that it should have:
> Cc: <stable@vger.kernel.org> # 5.15.x+

Reviewed and pushed to drm-misc-fixes.

Thanks,
Christian.
