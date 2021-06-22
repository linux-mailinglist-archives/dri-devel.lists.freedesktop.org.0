Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD783B0F0D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 22:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1144989BAE;
	Tue, 22 Jun 2021 20:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Tue, 22 Jun 2021 20:53:49 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B72489BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 20:53:49 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4G8djn0Lppz4x;
 Tue, 22 Jun 2021 22:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1624394813; bh=t5I5NssExGW0t61jdwywzsW2KnoEPodiNLvtIofa+uU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2FnXCwX5LNQyLZDC33cGdda5mtRxmusRX4pJRjyui8vY/DyAktmS8bBTi3fdPXA1
 dCol4H0ekQ+U4+1I/UxMkM4vpQe5EvlYrD0s+kDnFBCANaRRNYp/ZfNE+rhN9p9c5p
 MeSRxcaP+LQXUIyALO1Z25/BdcfLEwHysFubML6dmNcEsZLOwTNxIil5SwLS654iHB
 I60Gw/+NtlEIe+f9SjKCGewDyi+g64HHMZ/PZ95WsJT858ZxBLUyLjqTvBiWaVBfHC
 uGDDWho+GTa2R+sb82z2oSyEvom2afeMnnVPFF1NjTH87zzRKcqfW2lgs+SHrhtFeL
 Vb+up9ZCCG+gQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date: Tue, 22 Jun 2021 22:46:51 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v7 05/15] gpu: host1x: Add option to skip firewall for a
 job
Message-ID: <YNJMN6CxlndhXqf5@qmqm.qmqm.pl>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-6-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610110456.3692391-6-mperttunen@nvidia.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 02:04:46PM +0300, Mikko Perttunen wrote:
> The new UAPI will have its own firewall, and we don't want to run
> the firewall in the Host1x driver for those jobs. As such, add a
> parameter to host1x_job_alloc to specify if we want to skip the
> firewall in the Host1x driver.
[...]
>  struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
> -				    u32 num_cmdbufs, u32 num_relocs)
> +				    u32 num_cmdbufs, u32 num_relocs,
> +				    bool skip_firewall)
>  {
>  	struct host1x_job *job = NULL;
>  	unsigned int num_unpins = num_relocs;
> +	bool enable_firewall;
>  	u64 total;
>  	void *mem;
>  
> -	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
> +	enable_firewall = IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && !skip_firewall;
[...]

Why negatively name a parameter just to invert it right away?

Best Regards
Micha³ Miros³aw
