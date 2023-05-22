Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DA70BFC7
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C055989208;
	Mon, 22 May 2023 13:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::70c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C516789208
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXpMvck6jljxhDmNXhgXtu6EviNIfYi5ENjl3i7juWLzFFSCc+ieYZ55jsLRkJzporhgakytKaxBNwiLcppw0bou8Ab+aeAsgk6OP1DV1cJ3CzXGzz6rRZxit+JEzhcFwhbtC+An80xm74PMYSzcAvTrkQuq7+xNAQ5Bp2NQYzSAyG0z/vgfs9TJeZrur2E2FB4kEzPw3py2HUuLKREvO4agTh9bdw1ah/FwPGW0N9rcaxRsPyj2Wh5OCoqUuF6Q/I0hKpmJiiQUWGsrlNsSkXAOh9P/1gq+GUnN3duRO7yjmssRAGzWOizWSA0XO8ENLR8MW/WjOiLLm6lZUuQkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC9o0ifapU5wn0ZTVsPDRkWJiob5FG4zqWTHmSI5EuA=;
 b=dx74YBNykkS2nW9IvE8foRFKD4NiwWqBeH1KLms3S2btkoQ9qiSW5o+LhkxV/hKxysDoJGMPYDi/6wjw/oqZE09PmD00vW8AVfsdQ6DI0WF/REaCQ0nCBJfXjSIgq+oTmiwA6+KFV7kzxEUP+4LIM7SCadKoItihgi4GaET1tToy9C0A5vBQzOHMu7bSEP0fqtcHbfncZbpwtJPZmvCfaUxvO+9pCSClyQqerYVLZx1NfqBS/3YD6nAl9MFoyVd1GXV6kP9IkA4VNklUrs7KTE6wnXtNtIyrlDNkHoQ8T1yrR/G6dG6PuZgkMD9yDjZOODTnarbxNOVN7thLXvdcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OC9o0ifapU5wn0ZTVsPDRkWJiob5FG4zqWTHmSI5EuA=;
 b=hDsDExniLnvx3L9wsQGtD7NZLBEcwPpVEZ1V1GBI/4ioi7l9Voaebx1GkUKZ5Ri0Sq0BQQ2BrDchKO64Nqpf6OTGn1KhN34B4yx685tSae1gzttHBQhqLIFod/RPOP4JNV9JvcIj+pZIzes93l9KhSO/3FDWLP/HIVmqnfGx4yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GV2PR10MB6983.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:29:09 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fe53:f0e3:72f4:6c80]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fe53:f0e3:72f4:6c80%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 13:29:09 +0000
Message-ID: <44988709-f04c-6ccc-1d8f-eed939a643ac@kontron.de>
Date: Mon, 22 May 2023 15:29:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi83: Fix enable/disable flow
 to meet spec
Content-Language: en-US, de-DE
To: Fabio Estevam <festevam@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-3-frieder@fris.de> <2225400.iZASKD2KPV@steina-w>
 <CAOMZO5AiWM64tZgArUL89q5spuLD91R-pnURbfqPU9O0w54sQQ@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAOMZO5AiWM64tZgArUL89q5spuLD91R-pnURbfqPU9O0w54sQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GV2PR10MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b2ab8e-5f28-4d80-0392-08db5ac8861f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzCAS9nn2ZJoTOk53bg5+8b7OVOoiA0gS+4eMvfDnlJvQZhLshXVJPhfxCPcAW7YpyTgxBF6JytVMh1WQF/GZ85AxAkkvj0FNwg+XFbOg8QlNURKTWdJkIdhSXFfIrbK2yRsmjQIWSSxAuOZm1P+f4iIhTcHptVHnnrQOfh96Emct1+XSLUp36qY+b/t7iaT9fhgLJlkvgAf/Luwy0cNvDUTDFUqexW4aTsqzbmYfOZNlFwYbf3pF7bX7SeVklY/QIzSNyt1YuSLno6jlrpCXLPovSPUHe2SFySjIj3SOdMDfmXJv9+i3KNSOLxyykbrt34jEbm5AJwdxtEdj73jDVlum6RATJmG2RocZancZ6wyZ5i43g7rwe2LT2akaYZFu+XzC4S6XnyblPZDrjQJOtqFdxPHcL+p8BomjzVb+mp3wQ+u0ZVhl26Dt26OS45BNC0KUTcr1E8nA5SDd1BMQ3touuIFKT3eOMKHjYvLQMQCh7vU/GO1hzuz/NkcU/pTyU+YrTzVDzwX3OH6h6b5uRysCZclh2cpNDkcGGV9gvEi5YJGlZ37byU0swZ4yEUGdUalJ0h9YeErE54BgGbqaqZSeMB1BKwtO52Wiy5GPqag+1NeqBed4kEwGoN8/DNa7nTggz8K+SluQshdnhtiSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(110136005)(6486002)(86362001)(36756003)(478600001)(54906003)(31686004)(31696002)(83380400001)(6666004)(66476007)(66946007)(66556008)(38100700002)(316002)(4326008)(6506007)(41300700001)(2906002)(26005)(186003)(7416002)(8936002)(6512007)(8676002)(53546011)(5660300002)(2616005)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3BZNFBSSzlpWVE0akxwNXhtb29CZERSeUduLzdPRWk4RnpuNjNMRUF3VHdr?=
 =?utf-8?B?QTB5ak9kZG9HTUdRNjU4bjRqaHk5YnhNSUFLY1hvTXplbFp3Q0Z1Qm1vWWo4?=
 =?utf-8?B?VWkzVHQrN0MwZ2RMYW1jbmc0U3lvTkJ6UFF6enY5NUhzN0l0MmVSZXpUZU9F?=
 =?utf-8?B?dE5aVFVqSWROUGFIWThjY25FYzYvU29za1ZsQThTNEdFY3AzbTBQVEYrOWR5?=
 =?utf-8?B?Nlloem5uSjhYZ05UVnpKbDJPK0lURzU1L0YrbXZwbXhoSjBPRkFPRkdPSk1P?=
 =?utf-8?B?aFlERkpsUkRjdUJOejZXT3BhcmNHdGx0dTNhenRGaVN6VFUyejlIeUF3SWF3?=
 =?utf-8?B?dXhqaU1CMTlBSjBqRzg2U2VFQWtwSTFINTRWWEFUQWk3TWR2emovNTNWTGlo?=
 =?utf-8?B?aEg5SG9uRTltYVh3TFdxb3V3U0YzQXRQQUpzTGVlNCtuKzhZMzNpU1cxK1pU?=
 =?utf-8?B?QndJWFVVUm9weTFLNUdWV0VQT0M3YitOTHozRHBKSVNWemttYk1Qd0VzS0xN?=
 =?utf-8?B?K1dDRUVkN3phZitKVzMrSjRXeDk2aUNHMTQxaDkyS0RSa3NhclFOMW5LL1h1?=
 =?utf-8?B?M09KRzVlVlpGREVDYm5PR0l2ODlxVjF2SDY3NWRzbUsxMEFKNVZKdGZ1a1h5?=
 =?utf-8?B?bGxKZXk3eElSNG1sRGJocEl5Zng1SzRYditCWUlQNVFEZVMxMHhLbUQwb0li?=
 =?utf-8?B?d2dmVFdVc092VUFWbXd2dm5RRDU3djN3dW5TcW9EemQ0TGVSNFozdWNURHQ0?=
 =?utf-8?B?ZmN5MDZBV0NrYXFEN1ZEN05zcGtNRXA2dHhyb2l3MEkvNVI2RnVERld0dU81?=
 =?utf-8?B?UXhFSFhqVmJPMi94UnRQVXlVV21aUHlKN2Z6MlRYYThEWFpmK2YrVVNEUDNk?=
 =?utf-8?B?TGtWYzRrNE9FZmFYdHhoWnFTUmpGallqalNoc3hQU1NRMWV3U1ppTHJCcy91?=
 =?utf-8?B?TkRhc1JxMEdsYzNlUlVNdHdHZ1hHS2FsUTRFRTBhTUpNLyswaUx1QXkxRkhw?=
 =?utf-8?B?azNMQXdwOXg2RVZ1MjgvREZlbXJURW5YWVpKbWJpcGdtdjhZOVhlNElBQzF4?=
 =?utf-8?B?OFYzeFlNUjluUTZUQzdzQWxhM2daSlVMWmtscDVpbjJ0M2lac2RuZXpUckJD?=
 =?utf-8?B?MHpKc2owQ0RHdzFjWHNpc0dEeE1Yc29ZdlB1YUI5NWZENDdRL0E2ZDhhQTl4?=
 =?utf-8?B?Y3hjUnRPK2MzeHA3UXM4Z3lsRHVTWUgzenNWK2gyY2ZHekVHNTczOWtabStQ?=
 =?utf-8?B?MHVlclRsdnRMd2RvMUczb2grY3NtMk1TQmdZcCtoc1A0dkJvNWY1bWtqajZa?=
 =?utf-8?B?MW9uYkFNcC94QUpHZkZiRUNxVksyREJYdG9ENSs5SUNuMjJvRTdIeUJzT09T?=
 =?utf-8?B?OUl6Qy9neTNJMGdMditzNU9jd2RmVUMwNnVqQklGWUU2MElJUEx3RTNmR1E3?=
 =?utf-8?B?SjJKd3RJQnBUWkJ2cjA2bGI4SlhKL0lVNmRjWWZVandJcTc1bzg5dXRKT1F5?=
 =?utf-8?B?bC9JVzFVRUpXVk9jTllVNHBUVllKWG1ublZ1M0g0UHdKZERncGIxRlJwRDNH?=
 =?utf-8?B?WHpHWFJ3SUkySzdtOUpKN0VUTTE4WnY5THViWW9Tbml5ZTRGcWw4K2h0dTF2?=
 =?utf-8?B?UnYrbjlaanlhOUJEWU1sUzFMTGR4d2wySkxmWVdRbk9IMWFvSWJzOEZ5YVkw?=
 =?utf-8?B?czBEM3hRSlBzL2puRE1XT2Q4dWgvZmVtenlXekhFU2Zac0Q4Q25rSndHQm5W?=
 =?utf-8?B?YlpTblc4UVgrZGVVNUlab3FabUZ6aUM1VXpvelRDK0RzS3ZSN3c0QWt5SGJC?=
 =?utf-8?B?K1A0b3hCblBxcmIvS0FmS2Nzd3FXbVNlL2NJclJjTG5zTW9RRlcxc05MZzhq?=
 =?utf-8?B?Uy9zSjI0Y3JONUFTbFlYaXU2UFczazJidWF4L1BFZmsxVUxyMGZPWlRxYTZO?=
 =?utf-8?B?UzIwSWRVMTZMZG9OLzJiaHhYNzluLzNVUWs2RzhwT09Jam1mRkNnWUdRbUwv?=
 =?utf-8?B?TDFLLytLSFZSUnRoeEFveVlTZ29mQ05EUmx0WURRSkIxMHhMNXp6OEw0YmFS?=
 =?utf-8?B?ZWg1Zm9HaTVZaUR3WDNjODJSSVdxNmJSb1YrR2tQUnEvMUZRam1acDcxZCt5?=
 =?utf-8?B?OHRrY3gyY0E4TTFxdjVxek5pUGpWWG0yRVl5bE9nazlWaGIrOUovL01JbWhW?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b2ab8e-5f28-4d80-0392-08db5ac8861f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:29:09.4524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GejC6qP7GpB1c5JnsMfaZyv434+fafxYAqW2cWD2Qdmnioj/lU+VLRXsZV8iC9ZHW2+4D7aVuGTkS4s9EM+jUS74/ED3UdKK042m5wWx0zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6983
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Frieder Schrempf <frieder@fris.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.05.23 00:22, Fabio Estevam wrote:
> On Thu, May 4, 2023 at 6:12 AM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
>>
>> Am Mittwoch, 3. Mai 2023, 18:33:07 CEST schrieb Frieder Schrempf:
>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>
>>> The datasheet describes the following initialization flow including
>>> minimum delay times between each step:
>>>
>>> 1. DSI data lanes need to be in LP-11 and the clock lane in HS mode
>>> 2. toggle EN signal
>>> 3. initialize registers
>>> 4. enable PLL
>>> 5. soft reset
>>> 6. enable DSI stream
>>> 7. check error status register
>>>
>>> To meet this requirement we need to make sure the host bridge's
>>> pre_enable() is called first by using the pre_enable_prev_first
>>> flag.
>>>
>>> Furthermore we need to split enable() into pre_enable() which covers
>>> steps 2-5 from above and enable() which covers step 7 and is called
>>> after the host bridge's enable().
>>>
>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #TQMa8MxML/MBa8Mx
> 
> Should this have a Fixes tag so that it could be backported to stable kernels?

As this depends on the support for the pre_enable_prev_first flag,
currently the only candidates for backporting would be 6.3 and 6.4.

I can't tell if there are DSI host drivers which already implement the
proper init flow and would benefit from a backport.

Anyway, it shouldn't be a problem either so I guess the proper tags
would look like:

Cc: <stable@vger.kernel.org> # 6.3.x, 6.4.x
Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
SN65DSI84 driver")
