Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95E74CED5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4F510E1F9;
	Mon, 10 Jul 2023 07:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2101.outbound.protection.outlook.com [40.107.8.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E487B10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkjYXte690q71cilFyLTvR0BmfBH/1UGubOx81AmtWF6TaW4tgmKAnjkXiuw4HTqRAfee4+QVHFT0/B5dwVGTsDZzZx8gRsUyUA3HGAU/lErXHu/i0pfzYCEMFA5+PaXQO5qaP1jRfko8SQbHlXgF+Fs2gOzrTDBI9cU9kZQlDoLgau7tSIzaN15S9ioWCwAeQ/wATVNbUN0eq1qddsZL37lvAhVOIdg+Y4hwf8wBg6ahlo7NLaV3vpZRRkzjcR5BBj7wQz7nzS+yGxjgFuTMLmK9lblhodiK6jW1NipI8Qlo1peCwUGYDm1AxtbodigIRXNYZqJzQ5aIktmm043ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFgcu5IQqi1trwk7O3wcbQgfXYQI9pdPDNZa2OtRmws=;
 b=Fo3hHQW+2+vKfhoDXytd9DP82WetkKzSOW21erpIT3ylCGIcAS34fTsUJL9zWWa2bOcywd6ZPlbquZ/FntgoUB6WLHxaSkPKC3qAhg43Hhn5dfq53BTBFhp2G2Qn5U1fFHIUVQV1ZFMPcbGXPxI72ixxW4os9sD0TSCb2sgqNST6VUT38m/gSWOJJwBF+/dxyhPfW8mrK0dsqvAwQl2r9Ql8azgNc5tmkRL7wVfDFtkBfDfPfLf5F1qV5jzZdijBiAsyrazkCRUxp5BVKjahDbyxXrkwbuhmmoQlBAT2BDbtNSuiUR095XQsHHqLcvo19HYekD5p00qIgWJOoFjtgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFgcu5IQqi1trwk7O3wcbQgfXYQI9pdPDNZa2OtRmws=;
 b=FnwrehTg4XMtD8vWDcpZsLcPSyTr8eOOWtsCzng36Eke+Ic9oDSKmjRiG6xDUiW8OmLc9f+avDIDznMBlWtGv30UepkQFo+JefzmuRoF1BiWtoauwnC9TRqg2XVHZnWi/AP4BmxoPwKnHhUBme3y3/Wsdg7jvqs59l4j8GBnPeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DUZPR10MB8169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:46:25 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 07:46:25 +0000
Message-ID: <7c4affcb-bcb4-5f4b-cc2f-bed2cad9de71@kontron.de>
Date: Mon, 10 Jul 2023 09:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] drm/bridge: Fix handling of bridges with
 pre_enable_prev_first flag
To: Vladimir Lypak <vladimir.lypak@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20230707190020.6280-2-vladimir.lypak@gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230707190020.6280-2-vladimir.lypak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DUZPR10MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b45982b-4f69-4d78-a733-08db8119c309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jGLFG62Du9LUxZqFzJB+uEVJmjVGkI4NON8NP62nvl4V2g1fgPz4LuXNlbapL2iYxkPGvyuNbD6A3PH73g6UWhsSaJYxkMqo3AMeCP4d+q/O7rqslyrOYgfju22QZe2/S8JJbLCPa6wzrIf5YJFeugliPrmDIqkLkbs814Bm30RnUR+mP5TsvKrviZ8nNd7b/OwuRRz5VWJ9yL3BZOfNm3HNdshaAlYomQlPdGSrRuClA8JnlpLyRVQErPc9rzAz9nUNxi2TI867vGGUpPS+33TsNsRDh1QodVDz69o8gV5LaY0xFxRjyL/+eJIJ2o0ivQSa7SfiDdy8shqsPvCeLYQyj57aMdyXA26wD5P4Opc5oXm+jr70xTnqcm91TA6iyXuWYfOO3cWtrYoEGXHHcQP2hosHcJ2HOLsDnos9kjFUOu5hKB5diN8qVWW7GG4J3jyV8iO+/snvB7xKsZjiJVAPapMb0VohnqmSLKy6u0kKqLC9JZh3EXkv+WjgvZ1tHkxJFqSnU6sJztGaGt6ueYLHhCkJmTVNhamw0XS+24od/l/Di0ExCbd/GvY5fxgb8qi5dxbWFRw0aG3dpOXAQJHmRhMd9Of2UxLxuasy7b296uSg5KYdyNqLOWjgeZWI+5k9YYbklkY+ZYTIWs7cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6486002)(110136005)(54906003)(53546011)(26005)(6506007)(186003)(966005)(6512007)(2616005)(44832011)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(66574015)(83380400001)(4326008)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aStYQ0hFZUxETkZDc2Rza2VORjBzZFhhbmtUdUpHNThvK3ozblBWWnJPdE04?=
 =?utf-8?B?L3l4UVRIUmhyd0tBTFlFdGNRQ3hEMGRoZ1dvYVN4cGF5cEVYbGdYeFA4NGdv?=
 =?utf-8?B?L1FyczMrbDZxTHIzaTRkWTZWT1dGaGlYbFVJNlZVM040L205eUZaWVgvWHEy?=
 =?utf-8?B?QWg2R3h4dmkrMERxSGZYNUtJQ3J5b1ljRDBvTC9LdG5XV2gyNk94dURBd1ZW?=
 =?utf-8?B?OWJSUUVmQ3dGZUtCM0ZrTnh2TTQrTVZRdU81eGI1RXFUc2o4Mk9PNklqVXhP?=
 =?utf-8?B?MUR6M2FRcUdGckNNdlU3NkNoelBCRXRuT01lNmpQaHRaSHA5TWZsRmIwMGkw?=
 =?utf-8?B?WFhldlcxYm95RmtYemFKSXc5QXhhcE9rVFU3MUQvZmJVNjZUYzVZbHhsUnli?=
 =?utf-8?B?ZmdFVGp4S1RUTlFjcGhjcXNESlF3dmw1SEZBWnowcGl5ck9HSXVwamdKcUZU?=
 =?utf-8?B?NkE2YkZaczlSTFJBa085YlFuYk1ESndTeWlqei82YVJxbUZPMXNmVHdPbWZ6?=
 =?utf-8?B?QlZnenErUWpPam52Zi90dTVMankramxRYzlQVCsyOFhzUTFvK0VMTTlBUlVs?=
 =?utf-8?B?OWU5L2FkWmZVNnJlZDI0VGd3RldWb0Q1dTdsc3ZrR1FiZ2xvK28xWXZLZk5H?=
 =?utf-8?B?SWJtQlY4b3pYTGhpM2dRMXdHelBUL2lEOWI3OE14TDNMOU5wWkhqNkF1aWV1?=
 =?utf-8?B?MlMycEx5QUYxR1NVOWwrT2Jlb1U3T2UrNDdPeUxDVExnTlZLYW1yZnJIZG9R?=
 =?utf-8?B?eithcWo1a2xvaUpVY0ZLRlhnTUtHY3RicDNhOVMzNEN4Z3FEdUVqWSs1V3BW?=
 =?utf-8?B?RU5sRnlqOEwxNXd0elJnU3l4dGRaNlBKdlF3Mlh4L2NmNFVLUHlaTmEyT2Zt?=
 =?utf-8?B?Z2FnRjA2dHZaSlJSQnZhMThCbXdJaG5BSWVPZEJaV3l4SnBFU09KZjdpWllr?=
 =?utf-8?B?dmd6MHZBQjFRK09McHNqdzlucjV5WDRwM0k3OXJQV3cyeGFCZjFzeSsvSjhS?=
 =?utf-8?B?Y0dGckdIb1lQRUc3a2I5VGZhMGJkOUYxTDM3ZTJ1R3lXVEloRHNVRHpoNGFv?=
 =?utf-8?B?Z3FGRlhJUTBFbi9ZUDhsNnd3cDNWVk9Fa0NIZ2RzM2RmeXJOaXNCM0tVaFFH?=
 =?utf-8?B?R240ajI5WmJlUGJyc2R2eVJQeW5GL05mNUFwMjBGVXhHcEpqa0kzMGxKNEta?=
 =?utf-8?B?V1ZneHphNzlyKzhULzMrMEUyVUtRSThzR2NXRkMzNXJpQklONFZzMjdvMXZm?=
 =?utf-8?B?NnBGZmdLYXpFUStHYzlNYkxqbzE4M2syTkJ2TE81T3kxcmc5eUVWY003SWdy?=
 =?utf-8?B?Rm5mSTRMK2pjTzI2S3B4MVNhaU83OERmUzlsSE53UjdqdXBxSTJ1SGhyMDRz?=
 =?utf-8?B?bHE3WXI0SzhzcitjTDJITVQzUmNOczZEQXRUYVRyc2NZeHl0SlNWR0dGbWpG?=
 =?utf-8?B?cksxK2l1ZTlLNURRZzkvalpFNnNzd0FzUFQvZmRNMVQ1TlhVaWp4M3pIZklP?=
 =?utf-8?B?ams1a2VObERpNTlzc0ExRTg4MEs1K2FhdWFNVEtwZmlzTmRRZEVTckdRMk43?=
 =?utf-8?B?MUxrVEthZXROVEdOTFN5UGRXR2NYbFdmeGFOZGk3ODczWVFaUWp6WHBhVS9t?=
 =?utf-8?B?VG1zSGJ6MkU4bVRPam54V1paYVlFVk9wYXQ0ZTJsd2VYa2pxR0dFbDNadFdI?=
 =?utf-8?B?YkhOUUNHb3EzNVVHaU9XdFdKWXNqUzFVRzJYVFVnNy9IZXMxSzFyMEJueC80?=
 =?utf-8?B?dHowbzd4TWlEQjAyYnVuWTUvMUc2VmRua2ZTcmNIb25zNml2U1duTFo5Qmpv?=
 =?utf-8?B?UmtEL29sQzBxT2dQNHpQS0xBS1k5Z0k1amY1TXQ5MGlSYVNWOVo5cStRcWYv?=
 =?utf-8?B?REc0L0NoTDZXZ05wKzB2cUV4Wi8xRkY0TWNMYUUvdjUwUk1FK2tyV2U1L1Fy?=
 =?utf-8?B?SVNvdWZvdDF0OWY1YjRuUHJ3V003VWxiN0dwVVJwZ1BmTkxUYk9rREZlbzNM?=
 =?utf-8?B?RDE5UFh6QlNaTk1qVXZ2L1hHU0JVRzl5b010WlRlUnJJWkNLVzJhU0VJN2xX?=
 =?utf-8?B?ZjNKeVdueldDbDkwOWcwMlBaTDAyNlZWR3BHbEZYSDV2a1NEb0ZvN0JSVkp1?=
 =?utf-8?B?VVJKVllvRHNucTg4OHBHT0ZGcm1Oa3VYa0pYaGk2TlJrS2NOaVZYUFlaN0Uv?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b45982b-4f69-4d78-a733-08db8119c309
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:46:25.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hI0yO/nur2CGpv+tmkgME7XA2AOasHVcQ7TPO+0PmTAyUzgBmKpNojIfp99ji/F3QvmFe2UYaslyeGr7zhlmi4y/lUqeRWIhho2HHOWyss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8169
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.07.23 21:00, Vladimir Lypak wrote:
> [Sie erhalten nicht häufig E-Mails von vladimir.lypak@gmail.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> In function drm_atomic_bridge_chain_post_disable handling of
> pre_enable_prev_first flag is broken because "next" variable will always
> end up set to value of "bridge". This breaks loop which should disable
> bridges in reverse:
> 
>  next = list_next_entry(bridge, chain_node);
> 
>  if (next->pre_enable_prev_first) {
>         /* next bridge had requested that prev
>          * was enabled first, so disabled last
>          */
>         limit = next;
> 
>         /* Find the next bridge that has NOT requested
>          * prev to be enabled first / disabled last
>          */
>         list_for_each_entry_from(next, &encoder->bridge_chain,
>                                  chain_node) {
> // Next condition is always true. It is likely meant to be inversed
> // according to comment above. But doing this uncovers another problem:
> // it won't work if there are few bridges with this flag set at the end.
>                 if (next->pre_enable_prev_first) {
>                         next = list_prev_entry(next, chain_node);
>                         limit = next;
> // Here we always set next = limit = branch at first iteration.
>                         break;
>                 }
>         }
> 
>         /* Call these bridges in reverse order */
>         list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
>                                          chain_node) {
> // This loop never executes past this branch.
>                 if (next == bridge)
>                         break;
> 
>                 drm_atomic_bridge_call_post_disable(next, old_state);
> 
> In this patch logic for handling the flag is simplified. Temporary
> "iter" variable is introduced instead of "next" which is used only
> inside inner loops.
> 
> Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>

I haven't had a chance to look at this, but I still want to reference
another patch by Jagan that intends to fix some bug in this area:

https://patchwork.kernel.org/project/dri-devel/patch/20230328170752.1102347-1-jagan@amarulasolutions.com/

+Cc: Jagan

Dave, as you introduced this feature, did you have a chance to look at
Jagan's and Vladimir's patches?
